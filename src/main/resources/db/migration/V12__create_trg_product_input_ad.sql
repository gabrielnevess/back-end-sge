CREATE OR REPLACE FUNCTION FUNC_PRODUCT_INPUT_AD()
 RETURNS trigger AS $$

 DECLARE COUNT_STOCK INTEGER;

BEGIN

    SELECT COUNT(*) INTO COUNT_STOCK FROM TB_STOCK WHERE ID_PRODUCT = OLD.ID_PRODUCT;

    IF COUNT_STOCK > 0 THEN
        UPDATE TB_STOCK SET
            QTD = QTD + (OLD.QTD * -1),
            UNITARY_VALUE = OLD.UNITARY_VALUE,
            UPDATED_AT = NOW()
        WHERE ID_PRODUCT = OLD.ID_PRODUCT;

    END IF;

    RETURN NULL;
END;
$$
LANGUAGE 'plpgsql';

DROP TRIGGER IF EXISTS TRG_PRODUCT_INPUT_AD ON PUBLIC.TB_PRODUCT_INPUT;

CREATE TRIGGER TRG_PRODUCT_INPUT_AD
AFTER DELETE ON TB_PRODUCT_INPUT
FOR EACH ROW EXECUTE PROCEDURE FUNC_PRODUCT_INPUT_AD();