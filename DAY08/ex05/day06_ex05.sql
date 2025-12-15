COMMENT ON TABLE person_discounts IS 'Personal discounts for clients';
COMMENT ON COLUMN person_discounts.id IS 'Personal discount id';
COMMENT ON COLUMN person_discounts.person_id IS 'Client id from person table';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Pizzeria id from pizzeria table';
COMMENT ON COLUMN person_discounts.discount IS 'Discount amount in percentage';
