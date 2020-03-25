CREATE TABLE IF NOT EXISTS TB_PRODUCT_OUTPUT(
    ID BIGSERIAL PRIMARY KEY NOT NULL,
    ID_PRODUCT BIGINT NOT NULL REFERENCES TB_PRODUCT(ID),
    QTD INTEGER NOT NULL,
    UNITARY_VALUE NUMERIC(9,2) NOT NULL,
    CREATED_AT TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    UPDATED_AT TIMESTAMP WITHOUT TIME ZONE NOT NULL
);