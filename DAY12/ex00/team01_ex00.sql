CREATE OR REPLACE FUNCTION fnc_curency_last_rate(cid bigint)
    RETURNS numeric
    LANGUAGE SQL
AS 
$$ 
    SELECT COALESCE((SELECT rate_to_usd FROM currency WHERE id = cid ORDER BY updated DESC LIMIT 1), 1)
$$;

SELECT 
    name, 
    lastname,
    type, 
    volume,
    COALESCE((SELECT DISTINCT name FROM currency WHERE currency_id = id), 'not defined') AS currency_name, 
    fnc_curency_last_rate(currency_id) AS last_rate_to_usd,
    fnc_curency_last_rate(currency_id) * volume AS total_volume_in_usd
FROM 
    (SELECT COALESCE("user".name, 'not defined') AS name, 
        COALESCE("user".lastname, 'not defined') AS lastname,
        balance.type AS type, 
        SUM(balance.money) AS volume, 
        currency_id
    FROM 
        "user"
        FULL JOIN balance ON "user".id = balance.user_id
    GROUP BY "user".name, lastname, type, currency_id)
ORDER BY name DESC, lastname, type;