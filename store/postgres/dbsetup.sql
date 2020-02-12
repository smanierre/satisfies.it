DROP TABLE CONCRETE_TYPES CASCADE;
DROP TABLE INTERFACES;
DROP TABLE METHODS;

CREATE TABLE IF NOT EXISTS CONCRETE_TYPES (
    ID serial PRIMARY KEY,
    PACKAGE VARCHAR (255),
    NAME VARCHAR (255),
    BASETYPE VARCHAR (255)
);

CREATE TABLE IF NOT EXISTS METHODS (
    ID serial PRIMARY KEY,
    PACKAGE VARCHAR (255),
    NAME VARCHAR (255),
    PARAMETERS VARCHAR (255)[],
    RETURN_VALUES VARCHAR (255)[],
    RECEIVER_NAME VARCHAR (255),
    RECEIVER_ID INTEGER REFERENCES CONCRETE_TYPES(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS INTERFACES (
    ID serial PRIMARY KEY,
    PACKAGE VARCHAR (255),
    NAME VARCHAR (255),
    IMPLEMENTABLE BOOLEAN
);