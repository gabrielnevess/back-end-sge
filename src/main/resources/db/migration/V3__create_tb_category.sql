CREATE TABLE IF NOT EXISTS TB_CATEGORY (
    ID BIGSERIAL PRIMARY KEY NOT NULL,
    NAME CHARACTER VARYING(50) NOT NULL,
    CREATED_AT TIMESTAMP NOT NULL,
    UPDATED_AT TIMESTAMP NOT NULL
);