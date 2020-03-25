CREATE OR REPLACE FUNCTION FUNC_PRODUCT_OUTPUT_AU()
 RETURNS trigger AS $$

 DECLARE COUNT_STOCK INTEGER;

BEGIN

    SELECT COUNT(*) INTO COUNT_STOCK FROM TB_STOCK WHERE ID_PRODUCT = NEW.ID_PRODUCT;

    IF COUNT_STOCK > 0 THEN
        UPDATE TB_STOCK SET
            QTD = QTD + (OLD.QTD - NEW.QTD),
            UNITARY_VALUE = NEW.UNITARY_VALUE,
            UPDATED_AT = NOW()
        WHERE ID_PRODUCT = NEW.ID_PRODUCT;

    END IF;

    RETURN NULL;
END;
$$
LANGUAGE 'plpgsql';

DROP TRIGGER IF EXISTS TRG_PRODUCT_OUTPUT_AU ON PUBLIC.TB_PRODUCT_OUTPUT;

CREATE TRIGGER TRG_PRODUCT_OUTPUT_AU
AFTER UPDATE ON TB_PRODUCT_OUTPUT
FOR EACH ROW EXECUTE PROCEDURE FUNC_PRODUCT_OUTPUT_AU();