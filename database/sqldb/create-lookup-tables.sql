DROP TABLE LOOKUP_COUNTRY;
DROP TABLE LOOKUP_ETHNIC;
DROP TABLE LOOKUP_EVENT_CODES;
DROP TABLE LOOKUP_KNOWN_GROUPS;
DROP TABLE LOOKUP_RELIGION;
DROP TABLE LOOKUP_TYPE;
DROP TABLE LOOKUP_GOLDSTEIN_SCALE;

CREATE TABLE LOOKUP_COUNTRY (
 Code varchar(3),
 Label varchar(255)
);

CREATE TABLE LOOKUP_ETHNIC (
 Code varchar(3),
 Label varchar(255)
);

CREATE TABLE LOOKUP_EVENT_CODES (
 Code varchar(4),
 Label varchar(500)
);

CREATE TABLE LOOKUP_KNOWN_GROUPS (
 Code varchar(3),
 Label varchar(255)
);

CREATE TABLE LOOKUP_RELIGION (
 Code varchar(3),
 Label varchar(255)
);

CREATE TABLE LOOKUP_TYPE (
 Code varchar(3),
 Label varchar(255)
);

CREATE TABLE LOOKUP_GOLDSTEIN_SCALE (
 Code int,
 Scale float
);
