CREATE OR REPLACE FUNCTION FUNC_PRODUCT_OUTPUT_AD()
 RETURNS trigger AS $$

 DECLARE COUNT_STOCK INTEGER;

BEGIN

    SET datestyle = dmy;
    SELECT COUNT(*) INTO COUNT_STOCK FROM TB_STOCK WHERE ID_PRODUCT = OLD.ID_PRODUCT;

    IF COUNT_STOCK > 0 THEN
        UPDATE TB_STOCK SET
            QTD = QTD + OLD.QTD,
            UNITARY_VALUE = OLD.UNITARY_VALUE,
            UPDATED_AT = TO_CHAR(now(), 'dd/MM/yyyy HH:mm:ss')::timestamp
        WHERE ID_PRODUCT = OLD.ID_PRODUCT;

    END IF;

    RETURN NULL;
END;
$$
LANGUAGE 'plpgsql';

DROP TRIGGER IF EXISTS TRG_PRODUCT_OUTPUT_AD ON PUBLIC.TB_PRODUCT_OUTPUT;

CREATE TRIGGER TRG_PRODUCT_OUTPUT_AD
AFTER DELETE ON TB_PRODUCT_OUTPUT
FOR EACH ROW EXECUTE PROCEDURE FUNC_PRODUCT_OUTPUT_AD();