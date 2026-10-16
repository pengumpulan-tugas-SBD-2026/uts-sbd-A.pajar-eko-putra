CREATE TABLE advert 
    ( 
     propertyno                 INTEGER  NOT NULL , 
     newspapername              INTEGER  NOT NULL , 
     dataadvert                 INTEGER  NOT NULL , 
     propertyforrent_propertyno INTEGER  NOT NULL 
    ) 
;

ALTER TABLE advert 
    ADD CONSTRAINT advert_PK PRIMARY KEY ( propertyno, newspapername, dataadvert ) ;

CREATE TABLE BRANCH 
    ( 
     BRANCHNO   INTEGER  NOT NULL , 
     mgrstaffno INTEGER 
    ) 
;

ALTER TABLE BRANCH 
    ADD CONSTRAINT BRANCH_PK PRIMARY KEY ( BRANCHNO ) ;

CREATE TABLE businessowner 
    ( 
     ownerno                    INTEGER  NOT NULL , 
     propertyforrent_propertyno INTEGER  NOT NULL 
    ) 
;

ALTER TABLE businessowner 
    ADD CONSTRAINT businessowner_PK PRIMARY KEY ( ownerno ) ;

CREATE TABLE client 
    ( 
     clientno  INTEGER , 
     client_ID NUMBER  NOT NULL 
    ) 
;

ALTER TABLE client 
    ADD CONSTRAINT client_PK PRIMARY KEY ( client_ID ) ;

CREATE TABLE lease 
    ( 
     leaseno          INTEGER  NOT NULL , 
     clientno         INTEGER , 
     propertyno       INTEGER , 
     client_client_ID NUMBER  NOT NULL 
    ) 
;

ALTER TABLE lease 
    ADD CONSTRAINT lease_PK PRIMARY KEY ( leaseno ) ;

CREATE TABLE manager 
    ( 
     staffno         INTEGER  NOT NULL , 
     BRANCH_BRANCHNO INTEGER  NOT NULL 
    ) 
;
CREATE UNIQUE INDEX manager__IDX ON manager 
    ( 
     BRANCH_BRANCHNO ASC 
    ) 
;

ALTER TABLE manager 
    ADD CONSTRAINT manager_PK PRIMARY KEY ( staffno ) ;

CREATE TABLE privateowner 
    ( 
     ownerno                    INTEGER  NOT NULL , 
     propertyforrent_propertyno INTEGER  NOT NULL 
    ) 
;

ALTER TABLE privateowner 
    ADD CONSTRAINT privateowner_PK PRIMARY KEY ( ownerno ) ;

CREATE TABLE propertyforrent 
    ( 
     propertyno          INTEGER  NOT NULL , 
     ownerno             INTEGER , 
     staffno             INTEGER , 
     branchno            INTEGER , 
     lease_leaseno       INTEGER  NOT NULL , 
     viewing_clientno    INTEGER  NOT NULL , 
     viewing_propertykey INTEGER  NOT NULL , 
     staff_staffno       INTEGER  NOT NULL , 
     BRANCH_BRANCHNO     INTEGER  NOT NULL 
    ) 
;

ALTER TABLE propertyforrent 
    ADD CONSTRAINT propertyforrent_PK PRIMARY KEY ( propertyno ) ;

CREATE TABLE registration 
    ( 
     clientno        INTEGER  NOT NULL , 
     branchno        INTEGER  NOT NULL , 
     staffno         INTEGER , 
     BRANCH_BRANCHNO INTEGER  NOT NULL , 
     staff_staffno   INTEGER  NOT NULL 
    ) 
;

ALTER TABLE registration 
    ADD CONSTRAINT registration_PK PRIMARY KEY ( clientno ) ;

CREATE TABLE Relation_6 
    ( 
     staff_staffno   INTEGER  NOT NULL , 
     manager_staffno INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Relation_6 
    ADD CONSTRAINT Relation_6_PK PRIMARY KEY ( staff_staffno, manager_staffno ) ;

CREATE TABLE staff 
    ( 
     staffno           INTEGER  NOT NULL , 
     supervisorstaffno INTEGER , 
     branchno          INTEGER , 
     BRANCH_BRANCHNO   INTEGER  NOT NULL , 
     staff_staffno     INTEGER  NOT NULL 
    ) 
;

ALTER TABLE staff 
    ADD CONSTRAINT staff_PK PRIMARY KEY ( staffno ) ;

CREATE TABLE telephone 
    ( 
     telno           INTEGER  NOT NULL , 
     branchno        INTEGER , 
     BRANCH_BRANCHNO INTEGER  NOT NULL 
    ) 
;

ALTER TABLE telephone 
    ADD CONSTRAINT telephone_PK PRIMARY KEY ( telno ) ;

CREATE TABLE viewing 
    ( 
     clientno         INTEGER  NOT NULL , 
     propertykey      INTEGER  NOT NULL , 
     client_client_ID NUMBER  NOT NULL 
    ) 
;

ALTER TABLE viewing 
    ADD CONSTRAINT viewing_PK PRIMARY KEY ( clientno, propertykey ) ;

ALTER TABLE advert 
    ADD CONSTRAINT advert_propertyforrent_FK FOREIGN KEY 
    ( 
     propertyforrent_propertyno
    ) 
    REFERENCES propertyforrent 
    ( 
     propertyno
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE businessowner 
    ADD CONSTRAINT businessowner_propertyforrent_FK FOREIGN KEY 
    ( 
     propertyforrent_propertyno
    ) 
    REFERENCES propertyforrent 
    ( 
     propertyno
    ) 
;

ALTER TABLE lease 
    ADD CONSTRAINT lease_client_FK FOREIGN KEY 
    ( 
     client_client_ID
    ) 
    REFERENCES client 
    ( 
     client_ID
    ) 
;

ALTER TABLE manager 
    ADD CONSTRAINT manager_BRANCH_FK FOREIGN KEY 
    ( 
     BRANCH_BRANCHNO
    ) 
    REFERENCES BRANCH 
    ( 
     BRANCHNO
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE privateowner 
    ADD CONSTRAINT privateowner_propertyforrent_FK FOREIGN KEY 
    ( 
     propertyforrent_propertyno
    ) 
    REFERENCES propertyforrent 
    ( 
     propertyno
    ) 
;

ALTER TABLE propertyforrent 
    ADD CONSTRAINT propertyforrent_BRANCH_FK FOREIGN KEY 
    ( 
     BRANCH_BRANCHNO
    ) 
    REFERENCES BRANCH 
    ( 
     BRANCHNO
    ) 
;

ALTER TABLE propertyforrent 
    ADD CONSTRAINT propertyforrent_lease_FK FOREIGN KEY 
    ( 
     lease_leaseno
    ) 
    REFERENCES lease 
    ( 
     leaseno
    ) 
;

ALTER TABLE propertyforrent 
    ADD CONSTRAINT propertyforrent_staff_FK FOREIGN KEY 
    ( 
     staff_staffno
    ) 
    REFERENCES staff 
    ( 
     staffno
    ) 
;

ALTER TABLE propertyforrent 
    ADD CONSTRAINT propertyforrent_viewing_FK FOREIGN KEY 
    ( 
     viewing_clientno,
     viewing_propertykey
    ) 
    REFERENCES viewing 
    ( 
     clientno,
     propertykey
    ) 
;

ALTER TABLE registration 
    ADD CONSTRAINT registration_BRANCH_FK FOREIGN KEY 
    ( 
     BRANCH_BRANCHNO
    ) 
    REFERENCES BRANCH 
    ( 
     BRANCHNO
    ) 
;

ALTER TABLE registration 
    ADD CONSTRAINT registration_staff_FK FOREIGN KEY 
    ( 
     staff_staffno
    ) 
    REFERENCES staff 
    ( 
     staffno
    ) 
;

ALTER TABLE Relation_6 
    ADD CONSTRAINT Relation_6_manager_FK FOREIGN KEY 
    ( 
     manager_staffno
    ) 
    REFERENCES manager 
    ( 
     staffno
    ) 
;

ALTER TABLE Relation_6 
    ADD CONSTRAINT Relation_6_staff_FK FOREIGN KEY 
    ( 
     staff_staffno
    ) 
    REFERENCES staff 
    ( 
     staffno
    ) 
;

ALTER TABLE staff 
    ADD CONSTRAINT staff_BRANCH_FK FOREIGN KEY 
    ( 
     BRANCH_BRANCHNO
    ) 
    REFERENCES BRANCH 
    ( 
     BRANCHNO
    ) 
;

ALTER TABLE staff 
    ADD CONSTRAINT staff_staff_FK FOREIGN KEY 
    ( 
     staff_staffno
    ) 
    REFERENCES staff 
    ( 
     staffno
    ) 
;

ALTER TABLE telephone 
    ADD CONSTRAINT telephone_BRANCH_FK FOREIGN KEY 
    ( 
     BRANCH_BRANCHNO
    ) 
    REFERENCES BRANCH 
    ( 
     BRANCHNO
    ) 
;

ALTER TABLE viewing 
    ADD CONSTRAINT viewing_client_FK FOREIGN KEY 
    ( 
     client_client_ID
    ) 
    REFERENCES client 
    ( 
     client_ID
    ) 
;

CREATE SEQUENCE client_client_ID_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER client_client_ID_TRG 
BEFORE INSERT ON client 
FOR EACH ROW 
WHEN (NEW.client_ID IS NULL) 
BEGIN 
    :NEW.client_ID := client_client_ID_SEQ.NEXTVAL; 
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             1
-- ALTER TABLE                             30
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          1
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   2
-- WARNINGS                                 0
