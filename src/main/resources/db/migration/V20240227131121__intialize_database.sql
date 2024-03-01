CREATE SCHEMA IF NOT EXISTS GWBACKEND;
CREATE TABLE IF NOT EXISTS GWBACKEND.USERS
(
    ID              BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
    USERNAME        VARCHAR(255) NOT NULL,
    PASSWORD        VARCHAR(255) NOT NULL,
    EMAIL           VARCHAR(255) NOT NULL,
    USER_ROLE       VARCHAR(255) NOT NULL,
    FACULTY_ID      BIGINT NULL,
    CREATED_AT      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT PK_USER PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS GWBACKEND.FACULTIES
(
    ID              BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
    FACULTY_NAME    VARCHAR(255) NOT NULL,
    CREATED_AT      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT PK_FACULTY PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS GWBACKEND.CONTRIBUTIONS
(
    ID              BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
    UPLOAD_USER_ID  BIGINT NOT NULL,
    STUDENT_ID      VARCHAR(255) NOT NULL,
    STUDENT_NAME    VARCHAR(255) NOT NULL,
    TITLE           VARCHAR(255) NOT NULL,
    CONTENT         VARCHAR(255) NOT NULL,
    IMAGE_ID        BIGINT NULL,
    DOCUMENT_ID     BIGINT NULL,
    SUBMISSION_PERIOD_ID BIGINT NOT NULL,
    STATUS          VARCHAR(255) NOT NULL,
    COMMENT_ID      BIGINT NOT NULL,
    CONTRIBUTION    VARCHAR(255) NOT NULL,
    CREATED_AT      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT PK_CONTRIBUTION PRIMARY KEY (ID),
    CONSTRAINT FK_USER FOREIGN KEY (ID) REFERENCES GWBACKEND.USERS(ID)
);

CREATE TABLE IF NOT EXISTS GWBACKEND.SUBMISSION_PERIODS
(
    ID              BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
    NAME            VARCHAR(255) NOT NULL,
    START_DATE      TIMESTAMP NOT NULL,
    CLOSURE_DATE    TIMESTAMP NOT NULL,
    FINAL_CLOSURE_DATE TIMESTAMP NOT NULL,
    CREATED_AT      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT PK_SUBMISSION_PERIOD PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS GWBACKEND.COMMENTS
(
    ID              BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
    USER_ID         BIGINT NOT NULL,
    CONTRIBUTION_ID BIGINT NOT NULL,
    COMMENT_TEXT    TEXT NOT NULL,
    COMMENT_DATE    TIMESTAMP NOT NULL,
    CREATED_AT      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT PK_COMMENT PRIMARY KEY (ID),
    CONSTRAINT FK_USER FOREIGN KEY (ID) REFERENCES GWBACKEND.USERS(ID)
);

CREATE TABLE IF NOT EXISTS GWBACKEND.IMAGES
(
    ID              BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
    CONTRIBUTION_ID BIGINT NOT NULL,
    PATH            VARCHAR(255) NOT NULL,
    CREATED_AT      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT PK_IMAGE PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS GWBACKEND.DOCUMENTS
(
    ID              BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
    CONTRIBUTION_ID BIGINT NOT NULL,
    PATH            VARCHAR(255) NOT NULL,
    CREATED_AT      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT PK_DOCUMENT PRIMARY KEY (ID)
);
