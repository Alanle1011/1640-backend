DROP TABLE IF EXISTS GWBACKEND.COMMENTS;

CREATE TABLE IF NOT EXISTS GWBACKEND.COMMENTS
(
    ID              BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
    COORDINATOR_ID  BIGINT NOT NULL,
    CONTRIBUTION_ID BIGINT NOT NULL,
    CONTENT         TEXT NOT NULL,
    CREATED_AT      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT PK_COMMENTS PRIMARY KEY (ID),
    CONSTRAINT FK_COORDINATOR FOREIGN KEY (COORDINATOR_ID) REFERENCES GWBACKEND.USERS(ID),
    CONSTRAINT FK_CONTRIBUTION FOREIGN KEY (CONTRIBUTION_ID) REFERENCES GWBACKEND.CONTRIBUTIONS(ID)
);