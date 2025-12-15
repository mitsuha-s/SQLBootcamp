INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION fnc_get_past_rate(cid bigint, update timestamp)
    RETURNS numeric
    LANGUAGE plpgsql
AS 
$$
DECLARE
    res numeric;
BEGIN
    res = (SELECT rate_to_usd FROM currency WHERE id = cid AND updated < update ORDER BY updated DESC LIMIT 1);
    IF res IS NULL THEN
        res = (SELECT rate_to_usd FROM currency WHERE id = cid AND updated >= update ORDER BY updated LIMIT 1);
    END IF;

    RETURN res;
END;
$$;

SELECT 
    COALESCE("user".name, 'not defined') AS name, 
    COALESCE("user".lastname, 'not defined') AS lastname, 
    (SELECT DISTINCT name FROM currency WHERE currency_id = currency.id) AS currency_name, 
    fnc_get_past_rate(currency_id, updated) * money AS currency_in_usd
FROM
    "user"
    FULL JOIN balance ON "user".id = balance.user_id
WHERE currency_id IN (SELECT DISTINCT id FROM currency)
ORDER BY name DESC, lastname, currency_name;
