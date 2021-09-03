--------------------------------------------------------
--  �w�إ��ɮ� - �P����-�E��-03-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type ADDRESS_TYP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "APUSER"."ADDRESS_TYP" AS OBJECT ( 
   XXX   VARCHAR2(100),
   OOO VARCHAR(100));

/
--------------------------------------------------------
--  DDL for Type ARRAY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "APUSER"."ARRAY" 
    AS TABLE OF NUMBER

/
--------------------------------------------------------
--  DDL for Type INDEX_TABLE_NUM
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "APUSER"."INDEX_TABLE_NUM" AS
    TABLE OF  VARCHAR(10) INDEX BY PLS_INTEGER;

/
--------------------------------------------------------
--  DDL for Type MSG_ARRAY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "APUSER"."MSG_ARRAY" as table of number;
create or replace PACKAGE PG_BP_F010201 AS 
TYPE TO_ACTIVITY_TYPE IS RECORD(
    ACTIVITY_TYPE_ID APUSER.TB_BP_ACTIVITY_TYPE.ACTIVITY_TYPE_ID%TYPE
); 
TYPE TT_ACTIVITY_TYPE_LIST IS TABLE OF TO_ACTIVITY_TYPE;
PROCEDURE SP_INSERT_SPACE(
    I_SPACE_ID IN APUSER.TB_BP_SPACE.SPACE_ID%TYPE,
    I_SPACE_NAME in APUSER.TB_BP_SPACE.SPACE_NAME%TYPE,
    I_LIMIT in APUSER.TB_BP_SPACE.LIMIT%TYPE,
    I_ADDRESS in APUSER.TB_BP_SPACE.ADDRESS%TYPE,
    I_ACTIVITY_TYPE_LIST in TT_ACTIVITY_TYPE_LIST,
    I_CREATE_TIME in APUSER.TB_BP_SPACE.CREATE_TIME%TYPE,
    I_UPDATE_TIME in APUSER.TB_BP_SPACE.UPDATE_TIME%TYPE,
    I_CREATOR in APUSER.TB_BP_SPACE.CREATOR%TYPE,
    I_UPDATER in APUSER.TB_BP_SPACE.UPDATER%TYPE
);
TYPE TO_SPACE_INFO IS RECORD(
    SPACE_ID APUSER.TB_BP_SPACE.SPACE_ID%TYPE,                                                                               
    SPACE_NAME APUSER.TB_BP_SPACE.SPACE_NAME%TYPE,                                                                     
    LIMIT APUSER.TB_BP_SPACE.LIMIT%TYPE,                                                                      
    ADDRESS APUSER.TB_BP_SPACE.ADDRESS%TYPE,    
    CREATE_TIME VARCHAR2(19),                                                                         			
    UPDATE_TIME VARCHAR2(19),                                                                            			
    CREATOR APUSER.TB_BP_SPACE.CREATOR%TYPE,  
    UPDATER APUSER.TB_BP_SPACE.UPDATER%TYPE
);
TYPE TT_SPACE_INFO_LIST IS TABLE OF TO_SPACE_INFO;
TYPE TO_ACTIVITY_TYPE_INFO IS RECORD(
    ACTIVITY_TYPE_ID APUSER.TB_BP_ACTIVITY_TYPE.ACTIVITY_TYPE_ID%TYPE,                                                                               
    ACTIVITY_TYPE_NAME APUSER.TB_BP_ACTIVITY_TYPE.ACTIVITY_TYPE_NAME%TYPE,                                                                     
    CREATE_TIME VARCHAR2(19),                                                                         			
    UPDATE_TIME VARCHAR2(19),                                                                            			
    CREATOR APUSER.TB_BP_ACTIVITY_TYPE.CREATOR%TYPE,  
    UPDATER APUSER.TB_BP_ACTIVITY_TYPE.UPDATER%TYPE
);
TYPE TT_ACTIVITY_TYPE_INFO_LIST IS TABLE OF TO_ACTIVITY_TYPE_INFO;
PROCEDURE SP_SELECT_SPACE(
    -- �d�߱��� ----------------------------------------------------------------------------------------------------
    I_SPACE_ID IN APUSER.TB_BP_SPACE.SPACE_ID%TYPE,                                                                               			-- PK, ORACLE SYS_GUID()
    I_SPACE_NAME IN APUSER.TB_BP_SPACE.SPACE_NAME%TYPE,                                                                                -- ��ƫإ߮ɶ�(YYYY/MM/DD HH24:MI:SS)
    I_LIMIT IN APUSER.TB_BP_SPACE.LIMIT%TYPE,                                                                                -- ��Ƴ̫Ყ�ʮɶ�(YYYY/MM/DD HH24:MI:SS)
    I_ADDRESS IN APUSER.TB_BP_SPACE.ADDRESS%TYPE,                                                                               			-- �����Ҧr��
    I_CREATE_TIME IN APUSER.TB_BP_SPACE.CREATE_TIME%TYPE,                                                                               			-- �m�W
    I_UPDATE_TIME IN APUSER.TB_BP_SPACE.UPDATE_TIME%TYPE,                                                                               			-- �a�}
    I_CREATOR IN APUSER.TB_BP_SPACE.CREATOR%TYPE,
    I_UPDATER IN APUSER.TB_BP_SPACE.UPDATER%TYPE,
    I_COLUMNSELECT IN VARCHAR2,
    I_COLUMNVALUE IN VARCHAR2,
    -- �����ƧǱ��� ------------------------------------------------------------------------------------------------
    I_PAGE_NO IN NUMBER,                                                                                        -- �d�߲ĴX�����
    I_PAGE_SIZE IN NUMBER,                                                                                      -- �@����ܴX��
    I_SORT_COLUMN IN VARCHAR2,                                                                                  -- �Ƨ����
    I_SORT_TYPE IN VARCHAR2,                                                                                    -- ASC/DESC
    -- ��X���G ----------------------------------------------------------------------------------------------------
    O_TOTAL OUT NUMBER,                                                                                         -- ��X�d���`����
    O_DATA OUT SYS_REFCURSOR,                                                                               	-- ��X�ӭ����
    O_DATA2 OUT SYS_REFCURSOR,                                                                               	-- ��X�ӭ����
    O_PAGE_NO OUT NUMBER                                                                                 		-- ��ڬd�߭���
);
PROCEDURE SP_UPDATE_SPACE(
    I_SPACE_ID IN APUSER.TB_BP_SPACE.SPACE_ID%TYPE,
    I_SPACE_NAME in APUSER.TB_BP_SPACE.SPACE_NAME%TYPE,
    I_LIMIT in APUSER.TB_BP_SPACE.LIMIT%TYPE,
    I_ADDRESS in APUSER.TB_BP_SPACE.ADDRESS%TYPE,
    I_UPDATE_TIME in APUSER.TB_BP_SPACE.UPDATE_TIME%TYPE,
    I_UPDATER in APUSER.TB_BP_SPACE.UPDATER%TYPE
);
PROCEDURE SP_DELETE_SPACE(
    I_SPACE_ID IN APUSER.TB_BP_SPACE.SPACE_ID%TYPE
);
END PG_BP_F010201;

/
--------------------------------------------------------
--  DDL for Type NEW_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "APUSER"."NEW_TYPE" IS RECORD   --�HTYPE type_name IS RECORD�}�l
    (
       v_ly_nl varchar2(200),
       v_ly_mc varchar(100) 
    ); 
create or replace PROCEDURE TEST_PROCEDURE99_TRYANY (   
    customerScalar  IN VARCHAR, -- �@�뫬�O
    customerComposite  IN new_type, -- �ƦX���O
    customerReference IN CUSTOMER.PHONE%TYPE, -- �ޥΫ��O 
    customerBLOB IN BLOB, --BLOB ���O
    rslt out SYS_REFCURSOR
    ) AS
    /**�D�w�s�{�ǨϥΰѼ�**/
    stmt varchar(200); 
    
BEGIN
    /*
    @AUTHOR ESB19507
    @DATE 2020.05.18
    @DESCRIPTION ���O�d��
    */
--    stmt := 'select id, name, phone from CUSTOMER WHERE ID IN (:1)';
--    OPEN rslt FOR stmt USING '"99","9"'; -- �S���ĪG���g�k
    
    stmt := 'select id, name, phone from CUSTOMER WHERE ID IN (:1, :2)';
    OPEN rslt FOR stmt USING '99','9';
END TEST_PROCEDURE99_TRYANY;				 
				

/
--------------------------------------------------------
--  DDL for Type TESET_OBJECT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "APUSER"."TESET_OBJECT" AS OBJECT (
  FIRST_NAME     VARCHAR2(20),
  LAST_NAME      VARCHAR2(25)
  );

/
--------------------------------------------------------
--  DDL for Type TEST_RECORD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "APUSER"."TEST_RECORD" IS OBJECT
 (
    RECORD_1  batch_test1.id%TYPE,
    RECORD_2  ccardbill1.objam%TYPE,
    RECORD_3  customer_order.orderid%TYPE
)

/
--------------------------------------------------------
--  DDL for Type TO_ACTIVITY_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "APUSER"."TO_ACTIVITY_TYPE" 
AS TABLE OF VARCHAR2(18) ;

/
--------------------------------------------------------
--  DDL for Type TO_TEST
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "APUSER"."TO_TEST" AS OBJECT
( /* TODO enter attribute and method declarations here */ 
    T_ID NUMBER(38,0),
    T_NAME VARCHAR(20 BYTE),
    T_AGE NUMBER(38,0),
    T_ADDRESS CHAR(25 BYTE),
    T_SALARY NUMBER(18,2)
)

/
--------------------------------------------------------
--  DDL for Type TRY_OBJ
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "APUSER"."TRY_OBJ" as object (
        field_a number,
        field_b varchar2(10)
    );
PROCEDURE SP_LISTUSERINFO AS 

BEGIN
NULL;
END SP_LISTUSERINFO;

/
--------------------------------------------------------
--  DDL for Type TT_NUMBER_ARRAY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "APUSER"."TT_NUMBER_ARRAY" IS TABLE OF NUMBER;

/
--------------------------------------------------------
--  DDL for Type TT_VARCHAR2_ARRAY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "APUSER"."TT_VARCHAR2_ARRAY" IS TABLE OF VARCHAR2(4000);

/
--------------------------------------------------------
--  DDL for Type VARCHARARRAY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "APUSER"."VARCHARARRAY" AS
    VARRAY(20) OF varchar(200);

/
--------------------------------------------------------
--  DDL for Sequence JASON_AUTO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "APUSER"."JASON_AUTO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1194 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SQ_RECORD_ID
--------------------------------------------------------

   CREATE SEQUENCE  "APUSER"."SQ_RECORD_ID"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 680 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence TB_ACCOMMODATION_KT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "APUSER"."TB_ACCOMMODATION_KT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence TB_BP_ACTIVITIES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "APUSER"."TB_BP_ACTIVITIES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence TB_BP_AUTHORIZE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "APUSER"."TB_BP_AUTHORIZE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence TB_BP_BOOK_RECORD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "APUSER"."TB_BP_BOOK_RECORD_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence TB_BP_SPACE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "APUSER"."TB_BP_SPACE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence TB_BP_USER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "APUSER"."TB_BP_USER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence TB_RECORD_KT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "APUSER"."TB_RECORD_KT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence TB_TRANSPORTATION_KT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "APUSER"."TB_TRANSPORTATION_KT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence TB_USER_KT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "APUSER"."TB_USER_KT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table TB_CASE_APPLICANT
--------------------------------------------------------

  CREATE TABLE "ESB22012"."TB_CASE_APPLICANT" 
   (	"APPLICANT_SEQ_NO" VARCHAR2(20 BYTE), 
	"CASE_NO" VARCHAR2(20 BYTE), 
	"NANNY_ID" VARCHAR2(20 BYTE), 
	"APPLICANT_STATUS" CHAR(1 BYTE) DEFAULT 0
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "ESB22012"."TB_CASE_APPLICANT"."APPLICANT_SEQ_NO" IS '���u�y����, Snowflake ID';
   COMMENT ON COLUMN "ESB22012"."TB_CASE_APPLICANT"."CASE_NO" IS '�H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO';
   COMMENT ON COLUMN "ESB22012"."TB_CASE_APPLICANT"."NANNY_ID" IS '�O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID';
   COMMENT ON COLUMN "ESB22012"."TB_CASE_APPLICANT"."APPLICANT_STATUS" IS '���u���A';
   COMMENT ON TABLE "ESB22012"."TB_CASE_APPLICANT"  IS '�O�����u�C��';
--------------------------------------------------------
--  DDL for Table TB_NANNY
--------------------------------------------------------

  CREATE TABLE "ESB22012"."TB_NANNY" 
   (	"NANNY_ID" VARCHAR2(20 BYTE), 
	"SELF_INTRODUCTION" NVARCHAR2(500), 
	"SERVICE_LOCATION" CHAR(1 BYTE), 
	"NANNY_STATUS" CHAR(1 BYTE) DEFAULT 'Y', 
	"CERTIFICATION_STATUS" CHAR(1 BYTE) DEFAULT 'N'
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "ESB22012"."TB_NANNY"."NANNY_ID" IS '�O�i�s��, Snowflake ID';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY"."SELF_INTRODUCTION" IS '�ۧڤ���';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY"."SERVICE_LOCATION" IS '�A�Ȱϰ�';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY"."NANNY_STATUS" IS '�O�i�������A';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY"."CERTIFICATION_STATUS" IS '�ҷӪ��A';
   COMMENT ON TABLE "ESB22012"."TB_NANNY"  IS '�d���O�i�C��';
--------------------------------------------------------
--  DDL for Table TB_NANNY_CERTIFICATION
--------------------------------------------------------

  CREATE TABLE "ESB22012"."TB_NANNY_CERTIFICATION" 
   (	"NANNY_ID" VARCHAR2(20 BYTE), 
	"CERTIFICATION" BLOB
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("CERTIFICATION") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;

   COMMENT ON COLUMN "ESB22012"."TB_NANNY_CERTIFICATION"."NANNY_ID" IS '�O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY_CERTIFICATION"."CERTIFICATION" IS '�O�i�ҷ�';
   COMMENT ON TABLE "ESB22012"."TB_NANNY_CERTIFICATION"  IS '�d���O�i�ҮѦC��';
--------------------------------------------------------
--  DDL for Table TB_NANNY_SERVICE
--------------------------------------------------------

  CREATE TABLE "ESB22012"."TB_NANNY_SERVICE" 
   (	"SERVICE_SEQ_NO" VARCHAR2(20 BYTE), 
	"NANNY_ID" VARCHAR2(20 BYTE), 
	"SERVICE_TYPE" VARCHAR2(2 BYTE), 
	"SERVICE_NAME" NVARCHAR2(50), 
	"PRICE" NUMBER(6,2), 
	"ACCEPTABLE_SPECIES" VARCHAR2(50 BYTE), 
	"ACCEPTABLE_AMOUNTS" NUMBER(1,0), 
	"ACCEPTABLE_SIZE" VARCHAR2(2 BYTE), 
	"SUPERVISION" VARCHAR2(2 BYTE), 
	"EXCRETION_FREQUENCY" VARCHAR2(2 BYTE), 
	"WALK_FREQUENCY" VARCHAR2(2 BYTE), 
	"EMERGENCY_DELIVERY" CHAR(1 BYTE) DEFAULT 'N', 
	"LAST_MIN_BOOKING" CHAR(1 BYTE) DEFAULT 'N', 
	"CASE_AMOUNTS" NUMBER(8,0) DEFAULT 0, 
	"SERVICE_SCORE" NUMBER(2,1), 
	"SERVICE_STATUS" CHAR(1 BYTE) DEFAULT 'Y'
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "ESB22012"."TB_NANNY_SERVICE"."SERVICE_SEQ_NO" IS '�A�Ȭy����, Snowflake ID';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY_SERVICE"."NANNY_ID" IS '�O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY_SERVICE"."SERVICE_TYPE" IS '�A������';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY_SERVICE"."SERVICE_NAME" IS '�A�ȦW��';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY_SERVICE"."PRICE" IS '�A�Ȼ���';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY_SERVICE"."ACCEPTABLE_SPECIES" IS '�i�����d������';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY_SERVICE"."ACCEPTABLE_AMOUNTS" IS '�i�����d���ƶq';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY_SERVICE"."ACCEPTABLE_SIZE" IS '�i�����̤j�d���髬';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY_SERVICE"."SUPERVISION" IS '�i���Ѫ��ʷ��ŧO';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY_SERVICE"."EXCRETION_FREQUENCY" IS '�i���ѱƪn����';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY_SERVICE"."WALK_FREQUENCY" IS '�i���ѨB�榸��';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY_SERVICE"."EMERGENCY_DELIVERY" IS '��檬�p���e';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY_SERVICE"."LAST_MIN_BOOKING" IS '�̫�@��w�q';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY_SERVICE"."CASE_AMOUNTS" IS '�w���ѪA�Ȧ���';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY_SERVICE"."SERVICE_SCORE" IS '�A���`��';
   COMMENT ON COLUMN "ESB22012"."TB_NANNY_SERVICE"."SERVICE_STATUS" IS '�A�Ȫ��A';
   COMMENT ON TABLE "ESB22012"."TB_NANNY_SERVICE"  IS '�O�i�A�ȦC��';
--------------------------------------------------------
--  DDL for Table TB_SERVICE_CASE
--------------------------------------------------------

  CREATE TABLE "ESB22012"."TB_SERVICE_CASE" 
   (	"CASE_NO" VARCHAR2(20 BYTE), 
	"APPOINTER" VARCHAR2(20 BYTE), 
	"SERVICE_SEQ_NO" VARCHAR2(20 BYTE), 
	"SERVICE_TYPE" VARCHAR2(2 BYTE), 
	"ACCEPTABLE_PRICE" NUMBER(6,2), 
	"PET_SPECIES" VARCHAR2(50 BYTE), 
	"PET_AMOUNTS" NUMBER(1,0), 
	"PET_SIZE" VARCHAR2(2 BYTE), 
	"NEED_TO_KNOW" NVARCHAR2(500), 
	"SERVICE_START_DATE" DATE, 
	"SERVICE_DUE_DATE" DATE, 
	"LOCATION" CHAR(1 BYTE), 
	"REQUIRED_VISIT_FREQUENCY" VARCHAR2(2 BYTE), 
	"CASE_COMMENT" NVARCHAR2(500), 
	"CASE_SCORE" NUMBER(1,0), 
	"CASE_STATUS" CHAR(1 BYTE) DEFAULT 'Y'
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "ESB22012"."TB_SERVICE_CASE"."CASE_NO" IS '�H�i�̽ШD�s��, Snowflake ID';
   COMMENT ON COLUMN "ESB22012"."TB_SERVICE_CASE"."APPOINTER" IS '�o�e�ШD��, Ref ESB22012.TB_USER.USER_NO';
   COMMENT ON COLUMN "ESB22012"."TB_SERVICE_CASE"."SERVICE_SEQ_NO" IS '�A�Ȭy����, Ref ESB22012.TB_NANNY_SERVICE.SERVICE_SEQ_NO';
   COMMENT ON COLUMN "ESB22012"."TB_SERVICE_CASE"."SERVICE_TYPE" IS '�A������';
   COMMENT ON COLUMN "ESB22012"."TB_SERVICE_CASE"."ACCEPTABLE_PRICE" IS '�i�����̰�����';
   COMMENT ON COLUMN "ESB22012"."TB_SERVICE_CASE"."PET_SPECIES" IS '�d������';
   COMMENT ON COLUMN "ESB22012"."TB_SERVICE_CASE"."PET_AMOUNTS" IS '�d���ƶq';
   COMMENT ON COLUMN "ESB22012"."TB_SERVICE_CASE"."PET_SIZE" IS '�d���̤j�髬';
   COMMENT ON COLUMN "ESB22012"."TB_SERVICE_CASE"."NEED_TO_KNOW" IS '�O�i����';
   COMMENT ON COLUMN "ESB22012"."TB_SERVICE_CASE"."SERVICE_START_DATE" IS '�ݨD�_�l��';
   COMMENT ON COLUMN "ESB22012"."TB_SERVICE_CASE"."SERVICE_DUE_DATE" IS '�ݨD������';
   COMMENT ON COLUMN "ESB22012"."TB_SERVICE_CASE"."LOCATION" IS '�Ҧb�ϰ�';
   COMMENT ON COLUMN "ESB22012"."TB_SERVICE_CASE"."REQUIRED_VISIT_FREQUENCY" IS '�̧C���X���ƭn�D';
   COMMENT ON COLUMN "ESB22012"."TB_SERVICE_CASE"."CASE_COMMENT" IS '�A�ȵ�������';
   COMMENT ON COLUMN "ESB22012"."TB_SERVICE_CASE"."CASE_SCORE" IS '�A�ȵ���';
   COMMENT ON COLUMN "ESB22012"."TB_SERVICE_CASE"."CASE_STATUS" IS '�ШD�檬�A';
   COMMENT ON TABLE "ESB22012"."TB_SERVICE_CASE"  IS '�H�i�̽ШD�C��';
--------------------------------------------------------
--  DDL for Table TB_USER
--------------------------------------------------------

  CREATE TABLE "ESB22012"."TB_USER" 
   (	"USER_NO" VARCHAR2(20 BYTE), 
	"NANNY_ID" VARCHAR2(20 BYTE), 
	"USER_PASSWORD" VARCHAR2(256 BYTE), 
	"USER_NAME" NVARCHAR2(200), 
	"EMAIL" VARCHAR2(320 BYTE), 
	"MOBILE" VARCHAR2(15 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "ESB22012"."TB_USER"."USER_NO" IS '�ϥΪ̽s��, Snowflake ID';
   COMMENT ON COLUMN "ESB22012"."TB_USER"."NANNY_ID" IS '�O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID';
   COMMENT ON COLUMN "ESB22012"."TB_USER"."USER_PASSWORD" IS '�ϥΪ̱K�X';
   COMMENT ON COLUMN "ESB22012"."TB_USER"."USER_NAME" IS '�ϥΪ̩m�W';
   COMMENT ON COLUMN "ESB22012"."TB_USER"."EMAIL" IS '�ϥΪ̫H�c';
   COMMENT ON COLUMN "ESB22012"."TB_USER"."MOBILE" IS '�ϥΪ̹q�ܸ��X';
   COMMENT ON TABLE "ESB22012"."TB_USER"  IS '�ϥΪ̦C��';
--------------------------------------------------------
--  DDL for View CUSTOMER_ORDER_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "APUSER"."CUSTOMER_ORDER_VIEW" ("ID", "NAME", "ORDERID") AS 
  SELECT c.id, c.name, o.orderId
  FROM CUSTOMER c, CUSTOMER_ORDER o
  WHERE c.id = o.id
;
--------------------------------------------------------
--  DDL for View CUSTOMER_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "APUSER"."CUSTOMER_VIEW" ("ID", "NAME") AS 
  SELECT id, name 
  FROM CUSTOMER
;
REM INSERTING into ESB22012.TB_CASE_APPLICANT
SET DEFINE OFF;
REM INSERTING into ESB22012.TB_NANNY
SET DEFINE OFF;
REM INSERTING into ESB22012.TB_NANNY_CERTIFICATION
SET DEFINE OFF;
REM INSERTING into ESB22012.TB_NANNY_SERVICE
SET DEFINE OFF;
REM INSERTING into ESB22012.TB_SERVICE_CASE
SET DEFINE OFF;
REM INSERTING into ESB22012.TB_USER
SET DEFINE OFF;
Insert into ESB22012.TB_USER (USER_NO,NANNY_ID,USER_PASSWORD,USER_NAME,EMAIL,MOBILE) values ('166189483309129728',null,'string321123','���p�s','string@gmail.com','0933123456');
Insert into ESB22012.TB_USER (USER_NO,NANNY_ID,USER_PASSWORD,USER_NAME,EMAIL,MOBILE) values ('U000001',null,'string123321','���j�s','123@gmail.com','0922258520');
--------------------------------------------------------
--  DDL for Index PK_CASE_APPLICANT
--------------------------------------------------------

  CREATE UNIQUE INDEX "ESB22012"."PK_CASE_APPLICANT" ON "ESB22012"."TB_CASE_APPLICANT" ("APPLICANT_SEQ_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_NANNY
--------------------------------------------------------

  CREATE UNIQUE INDEX "ESB22012"."PK_NANNY" ON "ESB22012"."TB_NANNY" ("NANNY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_NANNY_CERTIFICATION
--------------------------------------------------------

  CREATE UNIQUE INDEX "ESB22012"."PK_NANNY_CERTIFICATION" ON "ESB22012"."TB_NANNY_CERTIFICATION" ("NANNY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_NANNY_SERVICE
--------------------------------------------------------

  CREATE UNIQUE INDEX "ESB22012"."PK_NANNY_SERVICE" ON "ESB22012"."TB_NANNY_SERVICE" ("SERVICE_SEQ_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_SERVICE_CASE
--------------------------------------------------------

  CREATE UNIQUE INDEX "ESB22012"."PK_SERVICE_CASE" ON "ESB22012"."TB_SERVICE_CASE" ("CASE_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_USER
--------------------------------------------------------

  CREATE UNIQUE INDEX "ESB22012"."PK_USER" ON "ESB22012"."TB_USER" ("USER_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000183902C00002$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "ESB22012"."SYS_IL0000183902C00002$$" ON "ESB22012"."TB_NANNY_CERTIFICATION" (
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE( INITIAL 65536 NEXT 1048576 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  PARALLEL (DEGREE 0 INSTANCES 0) ;
--------------------------------------------------------
--  DDL for Procedure SP_ADD_TB_CARD
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ESB22012"."SP_ADD_TB_CARD" (
    -- ��J��� ----------------------------------------------------------------------------------------------------             
    I_CHID IN VARCHAR2,                                                                                -- ���d�HID, Ref ESB22012.TB_CARD.CHID
    I_CARD_NO IN VARCHAR2,                                                                             -- �d��, Ref ESB22012.TB_CARD.CARD_NO
    I_CARD_COLOR IN NVARCHAR2,                                                                         -- �d���C��, Ref ESB22012.TB_CARD.CARD_COLOR
    -- ���\���� ----------------------------------------------------------------------------------------------------
    O_ROWCOUNT OUT INT                                                                                 -- ��X���\����
) AS
BEGIN

    MERGE INTO TB_CARD TC
    USING ( SELECT I_CARD_NO as TEMP_CARD_NO FROM DUAL ) D
    ON (TC.CARD_NO = D.TEMP_CARD_NO)
    WHEN MATCHED THEN 
        UPDATE SET CHID = UPPER(I_CHID), CARD_COLOR = I_CARD_COLOR                                      -- �p�G���ۦP ESB22012.TB_CARD.CARD_NO �Ȱ� UPDATE
    WHEN NOT MATCHED THEN 
        INSERT (CHID, CARD_NO, CARD_COLOR) VALUES (UPPER(I_CHID), I_CARD_NO, I_CARD_COLOR);             -- �p�G�L�ۦP ESB22012.TB_CARD.CARD_NO �Ȱ� INSERT

    O_ROWCOUNT := SQL%ROWCOUNT;

    COMMIT;

END SP_ADD_TB_CARD;

/
--------------------------------------------------------
--  DDL for Procedure SP_QUERY_ALL_INFO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ESB22012"."SP_QUERY_ALL_INFO" (
    -- �d�߱��� ----------------------------------------------------------------------------------------------------             
    I_CUSTOMER_ID IN VARCHAR2,                                                                         -- �U��ID, Ref ESB22012.TB_CUSTOMER.CUSTOMER_ID
    -- ��X���G ----------------------------------------------------------------------------------------------------            
    O_DATA OUT SYS_REFCURSOR                                                                           -- ��X���
) AS
BEGIN

    OPEN O_DATA FOR SELECT 
        A.CUSTOMER_ID CUSTOMER_ID,
        A.CUSTOMER_NAME CUSTOMER_NAME,
        A.PHONE PHONE,
        B.CARD_NO CARD_NO,
        B.CARD_COLOR CARD_COLOR
    FROM TB_CUSTOMER A
    LEFT JOIN TB_CARD B ON A.CUSTOMER_ID = B.CHID 
    WHERE A.CUSTOMER_ID = I_CUSTOMER_ID
    ORDER BY CUSTOMER_ID, CARD_NO;

END SP_QUERY_ALL_INFO;

/
--------------------------------------------------------
--  DDL for Package PG_CASE_APPLICANT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ESB22012"."PG_CASE_APPLICANT" AS
	/**
	 * Query table ESB22012.TB_CASE_APPLICANT(�O�����u�C��) by not null
	 */
	FUNCTION FN_QUERY_BY_NOT_NULL(
	    -- ���u�y����, Snowflake ID
	    I_APPLICANT_SEQ_NO IN TB_CASE_APPLICANT.APPLICANT_SEQ_NO%TYPE,
	    -- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
	    I_CASE_NO IN TB_CASE_APPLICANT.CASE_NO%TYPE,
	    -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
	    I_NANNY_ID IN TB_CASE_APPLICANT.NANNY_ID%TYPE,
	    -- ���u���A
	    I_APPLICANT_STATUS IN TB_CASE_APPLICANT.APPLICANT_STATUS%TYPE
	) RETURN SYS_REFCURSOR;

	/**
	 * Count table ESB22012.TB_CASE_APPLICANT(�O�����u�C��) by not null
	 */
	FUNCTION FN_COUNT_BY_NOT_NULL(
	    -- ���u�y����, Snowflake ID
	    I_APPLICANT_SEQ_NO IN TB_CASE_APPLICANT.APPLICANT_SEQ_NO%TYPE,
	    -- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
	    I_CASE_NO IN TB_CASE_APPLICANT.CASE_NO%TYPE,
	    -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
	    I_NANNY_ID IN TB_CASE_APPLICANT.NANNY_ID%TYPE,
	    -- ���u���A
	    I_APPLICANT_STATUS IN TB_CASE_APPLICANT.APPLICANT_STATUS%TYPE
	) RETURN NUMBER;

	/**
	 * Insert data to table ESB22012.TB_CASE_APPLICANT(�O�����u�C��)
	 */
	FUNCTION FN_ADD(
	    -- ���u�y����, Snowflake ID
	    I_APPLICANT_SEQ_NO IN TB_CASE_APPLICANT.APPLICANT_SEQ_NO%TYPE,
	    -- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
	    I_CASE_NO IN TB_CASE_APPLICANT.CASE_NO%TYPE,
	    -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
	    I_NANNY_ID IN TB_CASE_APPLICANT.NANNY_ID%TYPE,
	    -- ���u���A
	    I_APPLICANT_STATUS IN TB_CASE_APPLICANT.APPLICANT_STATUS%TYPE
	) RETURN NUMBER;

	/**
	 * Insert data to table ESB22012.TB_CASE_APPLICANT(�O�����u�C��), if input column is null then use column default instead
	 */
	FUNCTION FN_ADD_BY_DEFAULT(
	    -- ���u�y����, Snowflake ID
	    I_APPLICANT_SEQ_NO IN TB_CASE_APPLICANT.APPLICANT_SEQ_NO%TYPE,
	    -- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
	    I_CASE_NO IN TB_CASE_APPLICANT.CASE_NO%TYPE,
	    -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
	    I_NANNY_ID IN TB_CASE_APPLICANT.NANNY_ID%TYPE,
	    -- ���u���A
	    I_APPLICANT_STATUS IN TB_CASE_APPLICANT.APPLICANT_STATUS%TYPE
	) RETURN NUMBER;
	
	/**
	 * Delete table ESB22012.TB_CASE_APPLICANT(�O�����u�C��) by not null column, if all conditions are null, do not deleted any records
	 */	
	FUNCTION FN_DEL_BY_NOT_NULL(
	    -- ���u�y����, Snowflake ID
	    I_APPLICANT_SEQ_NO IN TB_CASE_APPLICANT.APPLICANT_SEQ_NO%TYPE,
	    -- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
	    I_CASE_NO IN TB_CASE_APPLICANT.CASE_NO%TYPE,
	    -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
	    I_NANNY_ID IN TB_CASE_APPLICANT.NANNY_ID%TYPE,
	    -- ���u���A
	    I_APPLICANT_STATUS IN TB_CASE_APPLICANT.APPLICANT_STATUS%TYPE
	) RETURN NUMBER;

END PG_CASE_APPLICANT;

/
--------------------------------------------------------
--  DDL for Package PG_NANNY_SERVICE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ESB22012"."PG_NANNY_SERVICE" AS 
-----------------------------------------------------------------
-- �d�ߡB�s�W�έק�ESB22012.TB_NANNY_SERVICE�BTB_NANNY��� --
-- @author ESB22012 by Esunbank                                 --
-----------------------------------------------------------------
    /**
     * �s�W�έק��d���O�i�A�ȸ��
     */
    FUNCTION FN_ADD_OR_UPDATE_NANNY_SERVICE (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_SERVICE_SEQ_NO IN ESB22012.TB_NANNY_SERVICE.SERVICE_SEQ_NO%TYPE,                                          -- �A�Ȭy����, Snowflake ID
        I_NANNY_ID IN ESB22012.TB_NANNY_SERVICE.NANNY_ID%TYPE,                                                      -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
        I_SERVICE_TYPE IN ESB22012.TB_NANNY_SERVICE.SERVICE_TYPE%TYPE,                                              -- �A������
        I_SERVICE_NAME IN ESB22012.TB_NANNY_SERVICE.SERVICE_NAME%TYPE,                                              -- �A�ȦW��
        I_PRICE IN ESB22012.TB_NANNY_SERVICE.PRICE%TYPE,                                                            -- �A�Ȼ���
        I_ACCEPTABLE_SPECIES IN ESB22012.TB_NANNY_SERVICE.ACCEPTABLE_SPECIES%TYPE,                                  -- �i�����d������
        I_ACCEPTABLE_AMOUNTS IN ESB22012.TB_NANNY_SERVICE.ACCEPTABLE_AMOUNTS%TYPE,                                  -- �i�����d���ƶq
        I_ACCEPTABLE_SIZE IN ESB22012.TB_NANNY_SERVICE.ACCEPTABLE_SIZE%TYPE,                                        -- �i�����̤j�d���髬
        I_SUPERVISION IN ESB22012.TB_NANNY_SERVICE.SUPERVISION%TYPE,                                                -- �i���Ѫ��ʷ��ŧO
        I_EXCRETION_FREQUENCY IN ESB22012.TB_NANNY_SERVICE.EXCRETION_FREQUENCY%TYPE,                                -- �i���ѱƪn����
        I_WALK_FREQUENCY IN ESB22012.TB_NANNY_SERVICE.WALK_FREQUENCY%TYPE,                                          -- �i���ѨB�榸��
        I_EMERGENCY_DELIVERY IN ESB22012.TB_NANNY_SERVICE.EMERGENCY_DELIVERY%TYPE,                                  -- ��檬�p���e
        I_LAST_MIN_BOOKING IN ESB22012.TB_NANNY_SERVICE.LAST_MIN_BOOKING%TYPE                                       -- �̫�@��w�q
    ) RETURN NUMBER;

    /**
     * �ק��d���O�i���A�Ȫ��A���
     */
    FUNCTION FN_UPDATE_SERVICE_STATUS (
        -- ��J��� ----------------------------------------------------------------------------------------------------       
        I_SERVICE_SEQ_NO IN ESB22012.TB_NANNY_SERVICE.SERVICE_SEQ_NO%TYPE,                                          -- �A�Ȭy����, Snowflake ID
        I_NANNY_ID IN ESB22012.TB_NANNY_SERVICE.NANNY_ID%TYPE,                                                      -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
        I_SERVICE_TYPE IN ESB22012.TB_NANNY_SERVICE.SERVICE_TYPE%TYPE,                                              -- �A������
        I_SERVICE_STATUS IN ESB22012.TB_NANNY_SERVICE.SERVICE_STATUS%TYPE                                           -- �A�Ȫ��A
    ) RETURN NUMBER;
    
    /**
     * �d���d���O�i�A�ȸ�Ƥ��e
     */
    PROCEDURE SP_FIND_SERVICE_OF_A_NANNY (
        -- ��J��� ----------------------------------------------------------------------------------------------------      
        I_NANNY_ID IN ESB22012.TB_NANNY_SERVICE.NANNY_ID%TYPE,                                                      -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
        -- ��X���G ----------------------------------------------------------------------------------------------------
        O_TOTAL OUT NUMBER,                                                                                         -- ��X�d���`����
        O_DATA OUT SYS_REFCURSOR                                                                                    -- ��X�ӭ����
    );
    
    /**
     * �̾ڱ���d���d���O�i�A�ȸ�Ƥ��e
     */
    PROCEDURE SP_FIND_SERVICE_DETAIL_OF_A_NANNY (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_SERVICE_SEQ_NO IN ESB22012.TB_NANNY_SERVICE.SERVICE_SEQ_NO%TYPE,                                          -- �A�Ȭy����, Snowflake ID
        I_NANNY_ID IN ESB22012.TB_NANNY_SERVICE.NANNY_ID%TYPE,                                                      -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
        I_SERVICE_TYPE IN ESB22012.TB_NANNY_SERVICE.SERVICE_TYPE%TYPE,                                              -- �A������
        -- ��X���G ----------------------------------------------------------------------------------------------------
        O_TOTAL OUT NUMBER,                                                                                         -- ��X�d���`����
        O_DATA OUT SYS_REFCURSOR                                                                                    -- ��X�ӭ����
    );

END PG_NANNY_SERVICE;

/
--------------------------------------------------------
--  DDL for Package PG_SERVICE_CASE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ESB22012"."PG_SERVICE_CASE" AS 
-----------------------------------------------------------------
-- �d�ߡB�s�W�έק�ESB22012.TB_NANNY_SERVICE�BTB_NANNY��� --
-- @author ESB22012 by Esunbank                                 --
-----------------------------------------------------------------

	/**
	 * �s�W�H�i�A�ȽШD���
	 */
	FUNCTION FN_ADD_CASE(
	    I_CASE_NO IN ESB22012.TB_SERVICE_CASE.CASE_NO%TYPE,                                                         -- �H�i�̽ШD�s��, Snowflake ID
	    I_APPOINTER IN ESB22012.TB_SERVICE_CASE.APPOINTER%TYPE,                                                     -- �o�e�ШD��, Ref ESB22012.TB_USER.USER_NO
	    I_SERVICE_SEQ_NO IN ESB22012.TB_SERVICE_CASE.SERVICE_SEQ_NO%TYPE,                                           -- �A�Ȭy����, Ref ESB22012.TB_NANNY_SERVICE.SERVICE_SEQ_NO
	    I_SERVICE_TYPE IN ESB22012.TB_SERVICE_CASE.SERVICE_TYPE%TYPE,                                               -- �A������
	    I_ACCEPTABLE_PRICE IN ESB22012.TB_SERVICE_CASE.ACCEPTABLE_PRICE%TYPE,                                       -- �i�����̰�����
	    I_PET_SPECIES IN ESB22012.TB_SERVICE_CASE.PET_SPECIES%TYPE,                                                 -- �d������
	    I_PET_AMOUNTS IN ESB22012.TB_SERVICE_CASE.PET_AMOUNTS%TYPE,                                                 -- �d���ƶq
	    I_PET_SIZE IN ESB22012.TB_SERVICE_CASE.PET_SIZE%TYPE,                                                       -- �d���̤j�髬 
	    I_NEED_TO_KNOW IN ESB22012.TB_SERVICE_CASE.NEED_TO_KNOW%TYPE,                                               -- �O�i����
	    I_SERVICE_START_DATE IN ESB22012.TB_SERVICE_CASE.SERVICE_START_DATE%TYPE,                                   -- �ݨD�_�l��
	    I_SERVICE_DUE_DATE IN ESB22012.TB_SERVICE_CASE.SERVICE_DUE_DATE%TYPE,                                       -- �ݨD������
	    I_LOCATION IN ESB22012.TB_SERVICE_CASE.LOCATION%TYPE,                                                       -- �Ҧb�ϰ�
	    I_REQUIRED_VISIT_FREQUENCY IN ESB22012.TB_SERVICE_CASE.REQUIRED_VISIT_FREQUENCY%TYPE                        -- �̧C���X���ƭn�D
	) RETURN NUMBER;
    
    /**
     * �ק�H�i�A�ȽШD���
     */
	FUNCTION FN_UPDATE_CASE(
	    I_CASE_NO IN ESB22012.TB_SERVICE_CASE.CASE_NO%TYPE,                                                         -- �H�i�̽ШD�s��, Snowflake ID
	    I_APPOINTER IN ESB22012.TB_SERVICE_CASE.APPOINTER%TYPE,                                                     -- �o�e�ШD��, Ref ESB22012.TB_USER.USER_NO
	    I_SERVICE_SEQ_NO IN ESB22012.TB_SERVICE_CASE.SERVICE_SEQ_NO%TYPE,                                           -- �A�Ȭy����, Ref ESB22012.TB_NANNY_SERVICE.SERVICE_SEQ_NO
	    I_SERVICE_TYPE IN ESB22012.TB_SERVICE_CASE.SERVICE_TYPE%TYPE,                                               -- �A������
	    I_ACCEPTABLE_PRICE IN ESB22012.TB_SERVICE_CASE.ACCEPTABLE_PRICE%TYPE,                                       -- �i�����̰�����
	    I_PET_SPECIES IN ESB22012.TB_SERVICE_CASE.PET_SPECIES%TYPE,                                                 -- �d������
	    I_PET_AMOUNTS IN ESB22012.TB_SERVICE_CASE.PET_AMOUNTS%TYPE,                                                 -- �d���ƶq
	    I_PET_SIZE IN ESB22012.TB_SERVICE_CASE.PET_SIZE%TYPE,                                                       -- �d���̤j�髬 
	    I_NEED_TO_KNOW IN ESB22012.TB_SERVICE_CASE.NEED_TO_KNOW%TYPE,                                               -- �O�i����
	    I_SERVICE_START_DATE IN ESB22012.TB_SERVICE_CASE.SERVICE_START_DATE%TYPE,                                   -- �ݨD�_�l��
	    I_SERVICE_DUE_DATE IN ESB22012.TB_SERVICE_CASE.SERVICE_DUE_DATE%TYPE,                                       -- �ݨD������
	    I_LOCATION IN ESB22012.TB_SERVICE_CASE.LOCATION%TYPE,                                                       -- �Ҧb�ϰ�
	    I_REQUIRED_VISIT_FREQUENCY IN ESB22012.TB_SERVICE_CASE.REQUIRED_VISIT_FREQUENCY%TYPE                        -- �̧C���X���ƭn�D
	) RETURN NUMBER;

	/**
	 * �ק�H�i�A�ȽШD���ШD�檬�A��Ƹ��
	 */
	FUNCTION FN_UPDATE_CASE_STATUS(
        I_CASE_NO IN ESB22012.TB_SERVICE_CASE.CASE_NO%TYPE,                                                         -- �H�i�̽ШD�s��, Snowflake ID
        I_CASE_STATUS IN ESB22012.TB_SERVICE_CASE.CASE_STATUS%TYPE                                                  -- �ШD�檬�A
	) RETURN NUMBER;

	/**
	 * �ק�H�i�A�ȽШD���A�ȵ����ΪA�ȵ����������d���O���A�Ȥ����A���`�����
	 */
	FUNCTION FN_UPDATE_CASE_SCORE_AND_COMMENT(
        I_CASE_NO IN ESB22012.TB_SERVICE_CASE.CASE_NO%TYPE,                                                         -- �H�i�̽ШD�s��, Snowflake ID
        I_CASE_SCORE IN ESB22012.TB_SERVICE_CASE.CASE_SCORE%TYPE,                                                   -- �A�ȵ���
        I_CASE_COMMENT IN ESB22012.TB_SERVICE_CASE.CASE_COMMENT%TYPE                                               -- �A�ȵ�������
	) RETURN NUMBER;
	
	/**
	 * �d�߳�@�d���O�i�A�ȶ��ؤ��H�i�ШD���
	 */	
	PROCEDURE SP_FIND_CASE_OF_A_NANNY_SERVICE(
        -- ��J��� ----------------------------------------------------------------------------------------------------
        I_NANNY_ID IN ESB22012.TB_NANNY_SERVICE.NANNY_ID%TYPE,                                                      -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
        I_SERVICE_TYPE IN ESB22012.TB_NANNY_SERVICE.SERVICE_TYPE%TYPE,                                              -- �A������
        -- ��X���G ----------------------------------------------------------------------------------------------------
        O_TOTAL OUT NUMBER,                                                                                         -- ��X�d���`����
        O_DATA OUT SYS_REFCURSOR                                                                                    -- ��X�ӭ����
	);

	/**
	 * �̾ڪA�Ȱϰ�d�߱H�i�ШD���
	 */	
	PROCEDURE SP_FIND_CASE_BY_LOCATION(
        -- ��J��� ----------------------------------------------------------------------------------------------------
	    I_LOCATION IN ESB22012.TB_SERVICE_CASE.LOCATION%TYPE,                                                       -- �Ҧb�ϰ�
        -- ��X���G ----------------------------------------------------------------------------------------------------
        O_TOTAL OUT NUMBER,                                                                                         -- ��X�d���`����
        O_DATA OUT SYS_REFCURSOR                                                                                    -- ��X�ӭ����
	);

	/**
	 * �d�߳�@�ϥΪ̪��H�i�ШD���
	 */	
	PROCEDURE SP_FIND_CASE_BY_APPOINTER_AND_CASE_STATUS(
        -- ��J��� ----------------------------------------------------------------------------------------------------
        I_APPOINTER IN ESB22012.TB_SERVICE_CASE.APPOINTER%TYPE,                                                     -- �o�e�ШD��, Ref ESB22012.TB_USER.USER_NO
        I_CASE_STATUS IN ESB22012.TB_SERVICE_CASE.CASE_STATUS%TYPE,                                                 -- �ШD�檬�A
        -- ��X���G ----------------------------------------------------------------------------------------------------
        O_TOTAL OUT NUMBER,                                                                                         -- ��X�d���`����
        O_DATA OUT SYS_REFCURSOR                                                                                    -- ��X�ӭ����
	);
END PG_SERVICE_CASE;

/
--------------------------------------------------------
--  DDL for Package PG_USER_NANNY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ESB22012"."PG_USER_NANNY" AS 
-----------------------------------------------------------------
-- �d�ߡB�s�W�έק�ESB22012.TB_USER�BTB_NANNY�BTB_NANNY_CERTIFICATION��� --
-- @author ESB22012 by Esunbank                                 --
-----------------------------------------------------------------
    -- �d���O�i��ƲM��
    TYPE TO_NANNY_INFO IS RECORD(
        NANNY_ID ESB22012.TB_NANNY.NANNY_ID%TYPE,                                                               -- �N�z�D��, Ref ESB22012.TB_AGENT.AGENT_SEQ_NO
        SERVICE_LOCATION ESB22012.TB_NANNY.SERVICE_LOCATION%TYPE,                                 -- �Q�N�z�HAD�b��, Ref ESB22012.TB_USER.AD_ACCOUNT
        CERTIFICATION_STATUS ESB22012.TB_NANNY.CERTIFICATION_STATUS%TYPE,                                   -- �Q�N�z�H�m�W
        SERVICE_SEQ_NO ESB22012.TB_NANNY_SERVICE.SERVICE_SEQ_NO%TYPE,                                       -- �N�z�HAD�b��, Ref ESB22012.TB_USER.AD_ACCOUNT
        SERVICE_TYPE ESB22012.TB_NANNY_SERVICE.SERVICE_TYPE%TYPE,                                      -- �N�z�H�m�W
        PRICE ESB22012.TB_NANNY_SERVICE.PRICE%TYPE,                                   -- �N�z�_��(YYYYMMDDHH24MISS)
        ACCEPTABLE_SPECIES ESB22012.TB_NANNY_SERVICE.ACCEPTABLE_SPECIES%TYPE,                                     -- �N�z����(YYYYMMDDHH24MISS)
        ACCEPTABLE_AMOUNTS ESB22012.TB_NANNY_SERVICE.ACCEPTABLE_AMOUNTS%TYPE,                                                                           -- �t��
        ACCEPTABLE_SIZE ESB22012.TB_NANNY_SERVICE.ACCEPTABLE_SIZE%TYPE,                                    -- �N�z���A, Ref DATASHARE.TB_SYS_CD.CD_ID, CT_ID=30
        EMERGENCY_DELIVERY ESB22012.TB_NANNY_SERVICE.EMERGENCY_DELIVERY%TYPE,                                                                           -- �t��
        LAST_MIN_BOOKING ESB22012.TB_NANNY_SERVICE.LAST_MIN_BOOKING%TYPE,                                                                           -- �t��
        CASE_AMOUNTS ESB22012.TB_NANNY_SERVICE.CASE_AMOUNTS%TYPE,                                                                           -- �t��
        SERVICE_SCORE ESB22012.TB_NANNY_SERVICE.SERVICE_SCORE%TYPE                                                                           -- �t��
    );

    -- �d���O�i��ƲM��
    TYPE TT_NANNY_INFO_LIST IS TABLE OF TO_NANNY_INFO;
    
    /**
     * �s�W�ϥΪ̸��
     */
    FUNCTION FN_ADD_USER (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_USER_NO IN ESB22012.TB_USER.USER_NO%TYPE,                                                                 -- �ϥΪ̽s��
        I_USER_PASSWORD IN ESB22012.TB_USER.USER_PASSWORD%TYPE,                                                     -- �ϥΪ̱K�X
        I_USER_NAME IN ESB22012.TB_USER.USER_NAME%TYPE,                                                             -- �ϥΪ̩m�W
        I_EMAIL IN ESB22012.TB_USER.EMAIL%TYPE,                                                                     -- �ϥΪ̫H�c
        I_MOBILE IN ESB22012.TB_USER.MOBILE%TYPE                                                                    -- �ϥΪ̹q�ܸ��X
    ) RETURN NUMBER;

    /**
     * �ק�ϥΪ̸��
     */
    FUNCTION FN_UPDATE_USER (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_USER_NO IN ESB22012.TB_USER.USER_NO%TYPE,                                                                 -- �ϥΪ̽s��
        I_USER_PASSWORD IN ESB22012.TB_USER.USER_PASSWORD%TYPE,                                                     -- �ϥΪ̱K�X
        I_USER_NAME IN ESB22012.TB_USER.USER_NAME%TYPE,                                                             -- �ϥΪ̩m�W
        I_EMAIL IN ESB22012.TB_USER.EMAIL%TYPE,                                                                     -- �ϥΪ̫H�c
        I_MOBILE IN ESB22012.TB_USER.MOBILE%TYPE                                                                    -- �ϥΪ̹q�ܸ��X
    ) RETURN NUMBER;
    
    /**
     * �ӽЦ����d���O�i
     */
    FUNCTION FN_ADD_NANNY (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_USER_NO IN ESB22012.TB_USER.USER_NO%TYPE,                                                                 -- �ϥΪ̽s��
        I_NANNY_ID IN ESB22012.TB_NANNY.NANNY_ID%TYPE,                                                              -- �O�i�s��
        I_SELF_INTRODUCTION IN ESB22012.TB_NANNY.SELF_INTRODUCTION%TYPE,                                            -- �ۧڤ���
        I_SERVICE_LOCATION IN ESB22012.TB_NANNY.SERVICE_LOCATION%TYPE                                               -- �A�Ȱϰ�
    ) RETURN NUMBER;
    
    /**
     * �ק��d���O�i���
     */
    FUNCTION FN_UPDATE_NANNY (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_NANNY_ID IN ESB22012.TB_NANNY.NANNY_ID%TYPE,                                                              -- �O�i�s��
        I_SELF_INTRODUCTION IN ESB22012.TB_NANNY.SELF_INTRODUCTION%TYPE,                                            -- �ۧڤ���
        I_SERVICE_LOCATION IN ESB22012.TB_NANNY.SERVICE_LOCATION%TYPE                                               -- �A�Ȱϰ�
    ) RETURN NUMBER;
    
--    /**
--     * �s�W�έק�O�i�ҷӤ��ҷӪ��A
--     */
--    FUNCTION FN_ADD_OR_UPDATE_NANNY_CERTIFICATION (
--        -- ��J��� ----------------------------------------------------------------------------------------------------             
--        I_NANNY_ID IN ESB22012.TB_NANNY.NANNY_ID%TYPE,                                                              -- �O�i�s��
--        I_CERTIFICATION_STATUS  IN ESB22012.TB_NANNY.CERTIFICATION_STATUS%TYPE,                                     -- �ҷӪ��A
--        I_CERTIFICATION IN ESB22012.TB_NANNY_CERTIFICATION.CERTIFICATION%TYPE                                       -- �O�i�ҷ�
--    ) RETURN NUMBER;
    
    /**
     * �ק��d���O�i���O�i�������A���
     */
    FUNCTION FN_UPDATE_NANNY_STATUS (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_NANNY_ID IN ESB22012.TB_NANNY.NANNY_ID%TYPE,                                                              -- �O�i�s��
        I_NANNY_STATUS  IN ESB22012.TB_NANNY.NANNY_STATUS%TYPE                                                      -- �O�i�������A
    ) RETURN NUMBER;
    
    /**
     * �d�߳�@�d���O�i���
     */
    PROCEDURE SP_FIND_UNIQUE_NANNY (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_NANNY_ID IN ESB22012.TB_NANNY.NANNY_ID%TYPE,                                                              -- �O�i�s��
        -- ��X���G ----------------------------------------------------------------------------------------------------
        O_TOTAL OUT NUMBER,                                                                                         -- ��X�d���`����
        O_DATA OUT SYS_REFCURSOR                                                                                    -- ��X�ӭ����
    );
    
    /**
     * �d�߳�@�d���O�i���ҷӸ��
     */
    FUNCTION FN_FIND_UNIQUE_NANNY_CERTIFICATION (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_NANNY_ID IN ESB22012.TB_NANNY.NANNY_ID%TYPE                                                               -- �O�i�s��
    ) RETURN BLOB;
    
    /**
     * �d���d���O�i���
     */
    PROCEDURE SP_FIND_NANNY (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_NANNY_ID IN ESB22012.TB_NANNY.NANNY_ID%TYPE,                                                              -- �O�i�s��
        I_SERVICE_LOCATION IN ESB22012.TB_NANNY.SERVICE_LOCATION%TYPE,                                              -- �A�Ȱϰ�
        I_CERTIFICATION_STATUS IN ESB22012.TB_NANNY.CERTIFICATION_STATUS%TYPE,                                      -- �ҷӪ��A
        I_SERVICE_SEQ_NO IN ESB22012.TB_NANNY_SERVICE.SERVICE_SEQ_NO%TYPE,                                          -- �A�Ȭy����, Snowflake ID
        I_SERVICE_TYPE IN ESB22012.TB_NANNY_SERVICE.SERVICE_TYPE%TYPE,                                              -- �A������
        I_PRICE IN ESB22012.TB_NANNY_SERVICE.PRICE%TYPE,                                                            -- �A�Ȼ���
        I_ACCEPTABLE_SPECIES IN ESB22012.TB_NANNY_SERVICE.ACCEPTABLE_SPECIES%TYPE,                                  -- �i�����d������
        I_ACCEPTABLE_AMOUNTS IN ESB22012.TB_NANNY_SERVICE.ACCEPTABLE_AMOUNTS%TYPE,                                  -- �i�����d���ƶq
        I_ACCEPTABLE_SIZE IN ESB22012.TB_NANNY_SERVICE.ACCEPTABLE_SIZE%TYPE,                                        -- �i�����̤j�d���髬
        I_EMERGENCY_DELIVERY IN ESB22012.TB_NANNY_SERVICE.EMERGENCY_DELIVERY%TYPE,                                  -- ��檬�p���e
        I_LAST_MIN_BOOKING IN ESB22012.TB_NANNY_SERVICE.LAST_MIN_BOOKING%TYPE,                                      -- �̫�@��w�q
        I_SERVICE_SCORE IN ESB22012.TB_NANNY_SERVICE.SERVICE_SCORE%TYPE,                                            -- �A���`��
        -- ��X���G ----------------------------------------------------------------------------------------------------
        O_TOTAL OUT NUMBER,                                                                                         -- ��X�d���`����
        O_DATA OUT SYS_REFCURSOR                                                                                    -- ��X�ӭ����
    );
    
END PG_USER_NANNY;

/
--------------------------------------------------------
--  DDL for Package Body PG_CASE_APPLICANT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ESB22012"."PG_CASE_APPLICANT" AS
	/**
	 * Query table ESB22012.TB_CASE_APPLICANT(�O�����u�C��) by not null
	 */
	FUNCTION FN_QUERY_BY_NOT_NULL(
	    -- ���u�y����, Snowflake ID
	    I_APPLICANT_SEQ_NO IN TB_CASE_APPLICANT.APPLICANT_SEQ_NO%TYPE,
	    -- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
	    I_CASE_NO IN TB_CASE_APPLICANT.CASE_NO%TYPE,
	    -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
	    I_NANNY_ID IN TB_CASE_APPLICANT.NANNY_ID%TYPE,
	    -- ���u���A
	    I_APPLICANT_STATUS IN TB_CASE_APPLICANT.APPLICANT_STATUS%TYPE
	) RETURN SYS_REFCURSOR
	AS
		O_RESULT SYS_REFCURSOR;
	BEGIN
		OPEN O_RESULT FOR
		SELECT
			-- Unique ID for the table
			ROWID,
			-- ���u�y����, Snowflake ID
			APPLICANT_SEQ_NO,
			-- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
			CASE_NO,
			-- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
			NANNY_ID,
			-- ���u���A
			APPLICANT_STATUS
		FROM
			-- �O�����u�C��
			ESB22012.TB_CASE_APPLICANT
		WHERE
			-- ���u�y����, Snowflake ID
			(
				I_APPLICANT_SEQ_NO IS NULL
				OR APPLICANT_SEQ_NO = I_APPLICANT_SEQ_NO
			)		
			-- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
			AND (
				I_CASE_NO IS NULL
				OR CASE_NO = I_CASE_NO
			)
			-- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
			AND (
				I_NANNY_ID IS NULL
				OR NANNY_ID = I_NANNY_ID
			)
			-- ���u���A
			AND (
				I_APPLICANT_STATUS IS NULL
				OR APPLICANT_STATUS = I_APPLICANT_STATUS
			)
			;
		
		RETURN O_RESULT;
	END FN_QUERY_BY_NOT_NULL;

	/**
	 * Count table ESB22012.TB_CASE_APPLICANT(�O�����u�C��) by not null
	 */
	FUNCTION FN_COUNT_BY_NOT_NULL(
	    -- ���u�y����, Snowflake ID
	    I_APPLICANT_SEQ_NO IN TB_CASE_APPLICANT.APPLICANT_SEQ_NO%TYPE,
	    -- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
	    I_CASE_NO IN TB_CASE_APPLICANT.CASE_NO%TYPE,
	    -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
	    I_NANNY_ID IN TB_CASE_APPLICANT.NANNY_ID%TYPE,
	    -- ���u���A
	    I_APPLICANT_STATUS IN TB_CASE_APPLICANT.APPLICANT_STATUS%TYPE
	) RETURN NUMBER
	AS
		O_RESULT NUMBER;
	BEGIN
		SELECT
			COUNT(1) INTO O_RESULT
		FROM
			-- �O�����u�C��
			ESB22012.TB_CASE_APPLICANT
		WHERE
			-- ���u�y����, Snowflake ID
			(
				I_APPLICANT_SEQ_NO IS NULL
				OR APPLICANT_SEQ_NO = I_APPLICANT_SEQ_NO
			)			
			-- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
			AND (
				I_CASE_NO IS NULL
				OR CASE_NO = I_CASE_NO
			)
			-- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
			AND (
				I_NANNY_ID IS NULL
				OR NANNY_ID = I_NANNY_ID
			)
			-- ���u���A
			AND (
				I_APPLICANT_STATUS IS NULL
				OR APPLICANT_STATUS = I_APPLICANT_STATUS
			)
			;
		
		RETURN O_RESULT;
	END FN_COUNT_BY_NOT_NULL;
 	
 	/**
	 * Insert data to table ESB22012.TB_CASE_APPLICANT(�O�����u�C��)
	 */
	FUNCTION FN_ADD(
	    -- ���u�y����, Snowflake ID
	    I_APPLICANT_SEQ_NO IN TB_CASE_APPLICANT.APPLICANT_SEQ_NO%TYPE,
	    -- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
	    I_CASE_NO IN TB_CASE_APPLICANT.CASE_NO%TYPE,
	    -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
	    I_NANNY_ID IN TB_CASE_APPLICANT.NANNY_ID%TYPE,
	    -- ���u���A
	    I_APPLICANT_STATUS IN TB_CASE_APPLICANT.APPLICANT_STATUS%TYPE
	) RETURN NUMBER
	AS
	BEGIN
		-- �O�����u�C��
		INSERT INTO ESB22012.TB_CASE_APPLICANT (
			-- ���u�y����, Snowflake ID
			APPLICANT_SEQ_NO,
			-- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
			CASE_NO,
			-- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
			NANNY_ID,
			-- ���u���A
			APPLICANT_STATUS
		)
		VALUES (
			-- ���u�y����, Snowflake ID
			I_APPLICANT_SEQ_NO,
			-- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
			I_CASE_NO,
			-- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
			I_NANNY_ID,
			-- ���u���A
			I_APPLICANT_STATUS
		);
		
		RETURN SQL%ROWCOUNT;
	END FN_ADD;

 	/**
	 * Insert data to table ESB22012.TB_CASE_APPLICANT(�O�����u�C��), if input column is null then use column default instead
	 */
	FUNCTION FN_ADD_BY_DEFAULT(
	    -- ���u�y����, Snowflake ID
	    I_APPLICANT_SEQ_NO IN TB_CASE_APPLICANT.APPLICANT_SEQ_NO%TYPE,
	    -- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
	    I_CASE_NO IN TB_CASE_APPLICANT.CASE_NO%TYPE,
	    -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
	    I_NANNY_ID IN TB_CASE_APPLICANT.NANNY_ID%TYPE,
	    -- ���u���A
	    I_APPLICANT_STATUS IN TB_CASE_APPLICANT.APPLICANT_STATUS%TYPE
	) RETURN NUMBER
	AS
	BEGIN
		-- �O�����u�C��
		INSERT INTO ESB22012.TB_CASE_APPLICANT (
			-- ���u�y����, Snowflake ID
			APPLICANT_SEQ_NO,
			-- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
			CASE_NO,
			-- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
			NANNY_ID,
			-- ���u���A
			APPLICANT_STATUS
		)
		VALUES (
			-- ���u�y����, Snowflake ID
			I_APPLICANT_SEQ_NO,
			-- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
			I_CASE_NO,
			-- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
			I_NANNY_ID,
			-- ���u���A
			NVL(I_APPLICANT_STATUS, 0)
		);
		
		RETURN SQL%ROWCOUNT;
	END FN_ADD_BY_DEFAULT;
	
	/**
	 * Delete table ESB22012.TB_CASE_APPLICANT(�O�����u�C��) by not null column, if all conditions are null, do not deleted any records
	 */	
	FUNCTION FN_DEL_BY_NOT_NULL(
	    -- ���u�y����, Snowflake ID
	    I_APPLICANT_SEQ_NO IN TB_CASE_APPLICANT.APPLICANT_SEQ_NO%TYPE,
	    -- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
	    I_CASE_NO IN TB_CASE_APPLICANT.CASE_NO%TYPE,
	    -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
	    I_NANNY_ID IN TB_CASE_APPLICANT.NANNY_ID%TYPE,
	    -- ���u���A
	    I_APPLICANT_STATUS IN TB_CASE_APPLICANT.APPLICANT_STATUS%TYPE
	) RETURN NUMBER
	AS
	BEGIN
		IF
		    -- ���u�y����, Snowflake ID
		    I_APPLICANT_SEQ_NO IS NULL AND
		    -- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
		    I_CASE_NO IS NULL AND
		    -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
		    I_NANNY_ID IS NULL AND
		    -- ���u���A
		    I_APPLICANT_STATUS IS NULL 
		THEN
			RETURN 0;
		ELSE
			-- �O�����u�C��
			DELETE FROM ESB22012.TB_CASE_APPLICANT
			WHERE
				-- ���u�y����, Snowflake ID
				(
					I_APPLICANT_SEQ_NO IS NULL
					OR APPLICANT_SEQ_NO = I_APPLICANT_SEQ_NO
				)
				-- �H�i�̽ШD�s��, Ref ESB22012.TB_SERVICE_CASE.CASE_NO
				AND (
					I_CASE_NO IS NULL
					OR CASE_NO = I_CASE_NO
				)
				-- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
				AND (
					I_NANNY_ID IS NULL
					OR NANNY_ID = I_NANNY_ID
				)
				-- ���u���A
				AND (
					I_APPLICANT_STATUS IS NULL
					OR APPLICANT_STATUS = I_APPLICANT_STATUS
				)
				;
			
			RETURN SQL%ROWCOUNT;
		END IF;
	END FN_DEL_BY_NOT_NULL;
	
END PG_CASE_APPLICANT;

/
--------------------------------------------------------
--  DDL for Package Body PG_NANNY_SERVICE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ESB22012"."PG_NANNY_SERVICE" AS

  FUNCTION FN_ADD_OR_UPDATE_NANNY_SERVICE (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_SERVICE_SEQ_NO IN ESB22012.TB_NANNY_SERVICE.SERVICE_SEQ_NO%TYPE,                                          -- �A�Ȭy����, Snowflake ID
        I_NANNY_ID IN ESB22012.TB_NANNY_SERVICE.NANNY_ID%TYPE,                                                      -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
        I_SERVICE_TYPE IN ESB22012.TB_NANNY_SERVICE.SERVICE_TYPE%TYPE,                                              -- �A������
        I_SERVICE_NAME IN ESB22012.TB_NANNY_SERVICE.SERVICE_NAME%TYPE,                                              -- �A�ȦW��
        I_PRICE IN ESB22012.TB_NANNY_SERVICE.PRICE%TYPE,                                                            -- �A�Ȼ���
        I_ACCEPTABLE_SPECIES IN ESB22012.TB_NANNY_SERVICE.ACCEPTABLE_SPECIES%TYPE,                                  -- �i�����d������
        I_ACCEPTABLE_AMOUNTS IN ESB22012.TB_NANNY_SERVICE.ACCEPTABLE_AMOUNTS%TYPE,                                  -- �i�����d���ƶq
        I_ACCEPTABLE_SIZE IN ESB22012.TB_NANNY_SERVICE.ACCEPTABLE_SIZE%TYPE,                                        -- �i�����̤j�d���髬
        I_SUPERVISION IN ESB22012.TB_NANNY_SERVICE.SUPERVISION%TYPE,                                                -- �i���Ѫ��ʷ��ŧO
        I_EXCRETION_FREQUENCY IN ESB22012.TB_NANNY_SERVICE.EXCRETION_FREQUENCY%TYPE,                                -- �i���ѱƪn����
        I_WALK_FREQUENCY IN ESB22012.TB_NANNY_SERVICE.WALK_FREQUENCY%TYPE,                                          -- �i���ѨB�榸��
        I_EMERGENCY_DELIVERY IN ESB22012.TB_NANNY_SERVICE.EMERGENCY_DELIVERY%TYPE,                                  -- ��檬�p���e
        I_LAST_MIN_BOOKING IN ESB22012.TB_NANNY_SERVICE.LAST_MIN_BOOKING%TYPE                                       -- �̫�@��w�q
    ) RETURN NUMBER AS
  BEGIN
    MERGE INTO ESB22012.TB_NANNY_SERVICE NANNY_SERVICE
        USING dual
        ON  (SERVICE_SEQ_NO = I_SERVICE_SEQ_NO )
    WHEN NOT MATCHED THEN
        INSERT(
            SERVICE_SEQ_NO,
            NANNY_ID,
            SERVICE_TYPE,
            SERVICE_NAME,
            PRICE,
            ACCEPTABLE_SPECIES,
            ACCEPTABLE_AMOUNTS,
            ACCEPTABLE_SIZE,
            SUPERVISION,
            EXCRETION_FREQUENCY,
            WALK_FREQUENCY,
            EMERGENCY_DELIVERY,
            LAST_MIN_BOOKING
        )VALUES( 
            I_SERVICE_SEQ_NO,
            I_NANNY_ID,
            I_SERVICE_TYPE,
            I_SERVICE_NAME,
            I_PRICE,
            I_ACCEPTABLE_SPECIES,
            I_ACCEPTABLE_AMOUNTS,
            I_ACCEPTABLE_SIZE,
            I_SUPERVISION,
            I_EXCRETION_FREQUENCY,
            I_WALK_FREQUENCY,
            I_EMERGENCY_DELIVERY,
            I_LAST_MIN_BOOKING
        )
    WHEN MATCHED THEN
        UPDATE 
        SET 
            NANNY_ID = I_NANNY_ID,
            SERVICE_TYPE = I_SERVICE_TYPE,
            SERVICE_NAME = I_SERVICE_NAME,
            PRICE = I_PRICE,
            ACCEPTABLE_SPECIES = I_ACCEPTABLE_SPECIES,
            ACCEPTABLE_AMOUNTS = I_ACCEPTABLE_AMOUNTS,
            ACCEPTABLE_SIZE = I_ACCEPTABLE_SIZE,
            SUPERVISION = I_SUPERVISION,
            EXCRETION_FREQUENCY = I_EXCRETION_FREQUENCY,
            WALK_FREQUENCY = I_WALK_FREQUENCY,
            EMERGENCY_DELIVERY = I_EMERGENCY_DELIVERY,
            LAST_MIN_BOOKING = I_LAST_MIN_BOOKING
    ;
    RETURN SQL%ROWCOUNT;
  END FN_ADD_OR_UPDATE_NANNY_SERVICE;

  FUNCTION FN_UPDATE_SERVICE_STATUS (
        -- ��J��� ----------------------------------------------------------------------------------------------------       
        I_SERVICE_SEQ_NO IN ESB22012.TB_NANNY_SERVICE.SERVICE_SEQ_NO%TYPE,                                          -- �A�Ȭy����, Snowflake ID
        I_NANNY_ID IN ESB22012.TB_NANNY_SERVICE.NANNY_ID%TYPE,                                                      -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
        I_SERVICE_TYPE IN ESB22012.TB_NANNY_SERVICE.SERVICE_TYPE%TYPE,                                              -- �A������
        I_SERVICE_STATUS IN ESB22012.TB_NANNY_SERVICE.SERVICE_STATUS%TYPE                                           -- �A�Ȫ��A
    ) RETURN NUMBER AS
  BEGIN
    IF
        I_NANNY_ID IS NULL
    THEN
        RETURN 0;
    ELSE
        UPDATE
            ESB22012.TB_NANNY_SERVICE
        SET
            SERVICE_STATUS = NVL(I_SERVICE_STATUS, SERVICE_STATUS)
        WHERE 
            NANNY_ID = I_NANNY_ID;
        RETURN SQL%ROWCOUNT;
    END IF;
  END FN_UPDATE_SERVICE_STATUS;

  PROCEDURE SP_FIND_SERVICE_OF_A_NANNY (
        -- ��J��� ----------------------------------------------------------------------------------------------------      
        I_NANNY_ID IN ESB22012.TB_NANNY_SERVICE.NANNY_ID%TYPE,                                                      -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
        -- ��X���G ----------------------------------------------------------------------------------------------------
        O_TOTAL OUT NUMBER,                                                                                         -- ��X�d���`����
        O_DATA OUT SYS_REFCURSOR                                                                                    -- ��X�ӭ����
    ) AS
  BEGIN
    OPEN O_DATA FOR
      SELECT  
        SERVICE_SEQ_NO,
        NANNY_ID,
        SERVICE_TYPE,
        SERVICE_NAME,
        PRICE,
        ACCEPTABLE_SPECIES,
        ACCEPTABLE_AMOUNTS,
        ACCEPTABLE_SIZE,
        SUPERVISION,
        EXCRETION_FREQUENCY,
        WALK_FREQUENCY,
        EMERGENCY_DELIVERY,
        LAST_MIN_BOOKING,
        CASE_AMOUNTS,
        SERVICE_SCORE,
        SERVICE_STATUS   
      FROM TB_NANNY_SERVICE WHERE NANNY_ID = I_NANNY_ID;
        O_TOTAL := SQL%ROWCOUNT;
  END SP_FIND_SERVICE_OF_A_NANNY;

  PROCEDURE SP_FIND_SERVICE_DETAIL_OF_A_NANNY (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_SERVICE_SEQ_NO IN ESB22012.TB_NANNY_SERVICE.SERVICE_SEQ_NO%TYPE,                                          -- �A�Ȭy����, Snowflake ID
        I_NANNY_ID IN ESB22012.TB_NANNY_SERVICE.NANNY_ID%TYPE,                                                      -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
        I_SERVICE_TYPE IN ESB22012.TB_NANNY_SERVICE.SERVICE_TYPE%TYPE,                                              -- �A������
        -- ��X���G ----------------------------------------------------------------------------------------------------
        O_TOTAL OUT NUMBER,                                                                                         -- ��X�d���`����
        O_DATA OUT SYS_REFCURSOR                                                                                    -- ��X�ӭ����
    ) AS
  BEGIN
    OPEN O_DATA FOR
      SELECT  
        SERVICE_SEQ_NO,
        NANNY_ID,
        SERVICE_TYPE,
        SERVICE_NAME,
        PRICE,
        ACCEPTABLE_SPECIES,
        ACCEPTABLE_AMOUNTS,
        ACCEPTABLE_SIZE,
        SUPERVISION,
        EXCRETION_FREQUENCY,
        WALK_FREQUENCY,
        EMERGENCY_DELIVERY,
        LAST_MIN_BOOKING,
        CASE_AMOUNTS,
        SERVICE_SCORE,
        SERVICE_STATUS   
      FROM TB_NANNY_SERVICE WHERE NANNY_ID = I_NANNY_ID AND SERVICE_SEQ_NO = I_SERVICE_SEQ_NO AND SERVICE_TYPE = I_SERVICE_TYPE;
        O_TOTAL := SQL%ROWCOUNT;
  END SP_FIND_SERVICE_DETAIL_OF_A_NANNY;
END PG_NANNY_SERVICE;

/
--------------------------------------------------------
--  DDL for Package Body PG_SERVICE_CASE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ESB22012"."PG_SERVICE_CASE" AS
	
  FUNCTION FN_ADD_CASE(
	    I_CASE_NO IN ESB22012.TB_SERVICE_CASE.CASE_NO%TYPE,                                                         -- �H�i�̽ШD�s��, Snowflake ID
	    I_APPOINTER IN ESB22012.TB_SERVICE_CASE.APPOINTER%TYPE,                                                     -- �o�e�ШD��, Ref ESB22012.TB_USER.USER_NO
	    I_SERVICE_SEQ_NO IN ESB22012.TB_SERVICE_CASE.SERVICE_SEQ_NO%TYPE,                                           -- �A�Ȭy����, Ref ESB22012.TB_NANNY_SERVICE.SERVICE_SEQ_NO
	    I_SERVICE_TYPE IN ESB22012.TB_SERVICE_CASE.SERVICE_TYPE%TYPE,                                               -- �A������
	    I_ACCEPTABLE_PRICE IN ESB22012.TB_SERVICE_CASE.ACCEPTABLE_PRICE%TYPE,                                       -- �i�����̰�����
	    I_PET_SPECIES IN ESB22012.TB_SERVICE_CASE.PET_SPECIES%TYPE,                                                 -- �d������
	    I_PET_AMOUNTS IN ESB22012.TB_SERVICE_CASE.PET_AMOUNTS%TYPE,                                                 -- �d���ƶq
	    I_PET_SIZE IN ESB22012.TB_SERVICE_CASE.PET_SIZE%TYPE,                                                       -- �d���̤j�髬 
	    I_NEED_TO_KNOW IN ESB22012.TB_SERVICE_CASE.NEED_TO_KNOW%TYPE,                                               -- �O�i����
	    I_SERVICE_START_DATE IN ESB22012.TB_SERVICE_CASE.SERVICE_START_DATE%TYPE,                                   -- �ݨD�_�l��
	    I_SERVICE_DUE_DATE IN ESB22012.TB_SERVICE_CASE.SERVICE_DUE_DATE%TYPE,                                       -- �ݨD������
	    I_LOCATION IN ESB22012.TB_SERVICE_CASE.LOCATION%TYPE,                                                       -- �Ҧb�ϰ�
	    I_REQUIRED_VISIT_FREQUENCY IN ESB22012.TB_SERVICE_CASE.REQUIRED_VISIT_FREQUENCY%TYPE                        -- �̧C���X���ƭn�D
	) RETURN NUMBER AS
  BEGIN
    -- TODO: ������� FUNCTION PG_SERVICE_CASE.FN_ADD_CASE
    RETURN NULL;
  END FN_ADD_CASE;

  FUNCTION FN_UPDATE_CASE(
	    I_CASE_NO IN ESB22012.TB_SERVICE_CASE.CASE_NO%TYPE,                                                         -- �H�i�̽ШD�s��, Snowflake ID
	    I_APPOINTER IN ESB22012.TB_SERVICE_CASE.APPOINTER%TYPE,                                                     -- �o�e�ШD��, Ref ESB22012.TB_USER.USER_NO
	    I_SERVICE_SEQ_NO IN ESB22012.TB_SERVICE_CASE.SERVICE_SEQ_NO%TYPE,                                           -- �A�Ȭy����, Ref ESB22012.TB_NANNY_SERVICE.SERVICE_SEQ_NO
	    I_SERVICE_TYPE IN ESB22012.TB_SERVICE_CASE.SERVICE_TYPE%TYPE,                                               -- �A������
	    I_ACCEPTABLE_PRICE IN ESB22012.TB_SERVICE_CASE.ACCEPTABLE_PRICE%TYPE,                                       -- �i�����̰�����
	    I_PET_SPECIES IN ESB22012.TB_SERVICE_CASE.PET_SPECIES%TYPE,                                                 -- �d������
	    I_PET_AMOUNTS IN ESB22012.TB_SERVICE_CASE.PET_AMOUNTS%TYPE,                                                 -- �d���ƶq
	    I_PET_SIZE IN ESB22012.TB_SERVICE_CASE.PET_SIZE%TYPE,                                                       -- �d���̤j�髬 
	    I_NEED_TO_KNOW IN ESB22012.TB_SERVICE_CASE.NEED_TO_KNOW%TYPE,                                               -- �O�i����
	    I_SERVICE_START_DATE IN ESB22012.TB_SERVICE_CASE.SERVICE_START_DATE%TYPE,                                   -- �ݨD�_�l��
	    I_SERVICE_DUE_DATE IN ESB22012.TB_SERVICE_CASE.SERVICE_DUE_DATE%TYPE,                                       -- �ݨD������
	    I_LOCATION IN ESB22012.TB_SERVICE_CASE.LOCATION%TYPE,                                                       -- �Ҧb�ϰ�
	    I_REQUIRED_VISIT_FREQUENCY IN ESB22012.TB_SERVICE_CASE.REQUIRED_VISIT_FREQUENCY%TYPE                        -- �̧C���X���ƭn�D
	) RETURN NUMBER AS
  BEGIN
    -- TODO: ������� FUNCTION PG_SERVICE_CASE.FN_UPDATE_CASE
    RETURN NULL;
  END FN_UPDATE_CASE;

  FUNCTION FN_UPDATE_CASE_STATUS(
        I_CASE_NO IN ESB22012.TB_SERVICE_CASE.CASE_NO%TYPE,                                                         -- �H�i�̽ШD�s��, Snowflake ID
        I_CASE_STATUS IN ESB22012.TB_SERVICE_CASE.CASE_STATUS%TYPE                                                  -- �ШD�檬�A
	) RETURN NUMBER AS
  BEGIN
    -- TODO: ������� FUNCTION PG_SERVICE_CASE.FN_UPDATE_CASE_STATUS
    RETURN NULL;
  END FN_UPDATE_CASE_STATUS;

  FUNCTION FN_UPDATE_CASE_SCORE_AND_COMMENT(
        I_CASE_NO IN ESB22012.TB_SERVICE_CASE.CASE_NO%TYPE,                                                         -- �H�i�̽ШD�s��, Snowflake ID
        I_CASE_SCORE IN ESB22012.TB_SERVICE_CASE.CASE_SCORE%TYPE,                                                   -- �A�ȵ���
        I_CASE_COMMENT IN ESB22012.TB_SERVICE_CASE.CASE_COMMENT%TYPE                                               -- �A�ȵ�������
	) RETURN NUMBER AS
  BEGIN
    -- TODO: ������� FUNCTION PG_SERVICE_CASE.FN_UPDATE_CASE_SCORE_AND_COMMENT
    RETURN NULL;
  END FN_UPDATE_CASE_SCORE_AND_COMMENT;

  PROCEDURE SP_FIND_CASE_OF_A_NANNY_SERVICE(
        -- ��J��� ----------------------------------------------------------------------------------------------------
        I_NANNY_ID IN ESB22012.TB_NANNY_SERVICE.NANNY_ID%TYPE,                                                      -- �O�i�s��, Ref ESB22012.TB_NANNY.NANNY_ID
        I_SERVICE_TYPE IN ESB22012.TB_NANNY_SERVICE.SERVICE_TYPE%TYPE,                                              -- �A������
        -- ��X���G ----------------------------------------------------------------------------------------------------
        O_TOTAL OUT NUMBER,                                                                                         -- ��X�d���`����
        O_DATA OUT SYS_REFCURSOR                                                                                    -- ��X�ӭ����
	) AS
  BEGIN
    -- TODO: ������� PROCEDURE PG_SERVICE_CASE.SP_FIND_CASE_OF_A_NANNY_SERVICE
    NULL;
  END SP_FIND_CASE_OF_A_NANNY_SERVICE;

  PROCEDURE SP_FIND_CASE_BY_LOCATION(
        -- ��J��� ----------------------------------------------------------------------------------------------------
	    I_LOCATION IN ESB22012.TB_SERVICE_CASE.LOCATION%TYPE,                                                       -- �Ҧb�ϰ�
        -- ��X���G ----------------------------------------------------------------------------------------------------
        O_TOTAL OUT NUMBER,                                                                                         -- ��X�d���`����
        O_DATA OUT SYS_REFCURSOR                                                                                    -- ��X�ӭ����
	) AS
  BEGIN
    -- TODO: ������� PROCEDURE PG_SERVICE_CASE.SP_FIND_CASE_BY_LOCATION
    NULL;
  END SP_FIND_CASE_BY_LOCATION;

  PROCEDURE SP_FIND_CASE_BY_APPOINTER_AND_CASE_STATUS(
        -- ��J��� ----------------------------------------------------------------------------------------------------
        I_APPOINTER IN ESB22012.TB_SERVICE_CASE.APPOINTER%TYPE,                                                     -- �o�e�ШD��, Ref ESB22012.TB_USER.USER_NO
        I_CASE_STATUS IN ESB22012.TB_SERVICE_CASE.CASE_STATUS%TYPE,                                                 -- �ШD�檬�A
        -- ��X���G ----------------------------------------------------------------------------------------------------
        O_TOTAL OUT NUMBER,                                                                                         -- ��X�d���`����
        O_DATA OUT SYS_REFCURSOR                                                                                    -- ��X�ӭ����
	) AS
  BEGIN
    -- TODO: ������� PROCEDURE PG_SERVICE_CASE.SP_FIND_CASE_BY_APPOINTER_AND_CASE_STATUS
    NULL;
  END SP_FIND_CASE_BY_APPOINTER_AND_CASE_STATUS;

END PG_SERVICE_CASE;

/
--------------------------------------------------------
--  DDL for Package Body PG_USER_NANNY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ESB22012"."PG_USER_NANNY" AS
-----------------------------------------------------------------
-- �d�ߡB�s�W�έק�ESB22012.TB_USER�BTB_NANNY�BTB_NANNY_CERTIFICATION��� --
-- @author ESB22012 by Esunbank                                 --
-----------------------------------------------------------------
    /**
     * �s�W�ϥΪ̸��
     */
    FUNCTION FN_ADD_USER (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_USER_NO IN ESB22012.TB_USER.USER_NO%TYPE,                                                                 -- �ϥΪ̽s��
        I_USER_PASSWORD IN ESB22012.TB_USER.USER_PASSWORD%TYPE,                                                     -- �ϥΪ̱K�X
        I_USER_NAME IN ESB22012.TB_USER.USER_NAME%TYPE,                                                             -- �ϥΪ̩m�W
        I_EMAIL IN ESB22012.TB_USER.EMAIL%TYPE,                                                                     -- �ϥΪ̫H�c
        I_MOBILE IN ESB22012.TB_USER.MOBILE%TYPE                                                                    -- �ϥΪ̹q�ܸ��X
    ) RETURN NUMBER
    AS
    BEGIN
        MERGE INTO ESB22012.TB_USER DBUSER1
            USING ( SELECT COUNT(1) CNT FROM ESB22012.TB_USER WHERE ESB22012.TB_USER.EMAIL = I_EMAIL ) DBUSER2
            ON  (DBUSER2.CNT > 0 )
        WHEN NOT MATCHED THEN
            INSERT(
                USER_NO,
                USER_PASSWORD,
                USER_NAME,
                EMAIL,
                MOBILE
            )VALUES( 
                I_USER_NO, 
                I_USER_PASSWORD,
                I_USER_NAME,
                I_EMAIL,
                I_MOBILE
            );
        RETURN SQL%ROWCOUNT;
    END FN_ADD_USER;

    /**
     * �ק�ϥΪ̸��
     */
    FUNCTION FN_UPDATE_USER (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_USER_NO IN ESB22012.TB_USER.USER_NO%TYPE,                                                                 -- �ϥΪ̽s��
        I_USER_PASSWORD IN ESB22012.TB_USER.USER_PASSWORD%TYPE,                                                     -- �ϥΪ̱K�X
        I_USER_NAME IN ESB22012.TB_USER.USER_NAME%TYPE,                                                             -- �ϥΪ̩m�W
        I_EMAIL IN ESB22012.TB_USER.EMAIL%TYPE,                                                                     -- �ϥΪ̫H�c
        I_MOBILE IN ESB22012.TB_USER.MOBILE%TYPE                                                                    -- �ϥΪ̹q�ܸ��X
    ) RETURN NUMBER 
    AS
    BEGIN
        IF
            I_USER_NO IS NULL
        THEN
            RETURN 0;
        ELSE
            UPDATE
                ESB22012.TB_USER
            SET
                USER_PASSWORD = NVL(I_USER_PASSWORD, USER_PASSWORD),
                USER_NAME = NVL(I_USER_NAME, USER_NAME),
                EMAIL = NVL(I_EMAIL, EMAIL),
                MOBILE = NVL(I_MOBILE, MOBILE)
            WHERE 
                USER_NO = I_USER_NO;
            RETURN SQL%ROWCOUNT;
        END IF;
    END FN_UPDATE_USER;
    
    /**
     * �ӽЦ����d���O�i
     */
    FUNCTION FN_ADD_NANNY (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_USER_NO IN ESB22012.TB_USER.USER_NO%TYPE,                                                                 -- �ϥΪ̽s��
        I_NANNY_ID IN ESB22012.TB_NANNY.NANNY_ID%TYPE,                                                              -- �O�i�s��
        I_SELF_INTRODUCTION IN ESB22012.TB_NANNY.SELF_INTRODUCTION%TYPE,                                            -- �ۧڤ���
        I_SERVICE_LOCATION IN ESB22012.TB_NANNY.SERVICE_LOCATION%TYPE                                               -- �A�Ȱϰ�
    ) RETURN NUMBER 
    AS
        V_USER_COUNT NUMBER;
    BEGIN
        -- 1. ���ˬd�O�_�w�g�ӽйL --------------------------------------------------------------------------------------- 
        SELECT
            COUNT(USER_NO) INTO V_USER_COUNT
        FROM ESB22012.TB_USER
        WHERE ESB22012.TB_USER.USER_NO = I_USER_NO AND ESB22012.TB_USER.NANNY_ID IS NOT NULL;
        -- 2. �Y�S���h�s�W�@���O�i ---------------------------------------------------------------------------------------
        IF V_USER_COUNT = 0
        THEN
            INSERT INTO ESB22012.TB_NANNY (
                NANNY_ID,
                SELF_INTRODUCTION,
                SERVICE_LOCATION
            ) VALUES (
                I_NANNY_ID,
                I_SELF_INTRODUCTION,
                I_SERVICE_LOCATION
            );
        END IF;
        RETURN SQL%ROWCOUNT;
    END FN_ADD_NANNY;

    /**
     * �ק��d���O�i���
     */
    FUNCTION FN_UPDATE_NANNY (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_NANNY_ID IN ESB22012.TB_NANNY.NANNY_ID%TYPE,                                                              -- �O�i�s��
        I_SELF_INTRODUCTION IN ESB22012.TB_NANNY.SELF_INTRODUCTION%TYPE,                                            -- �ۧڤ���
        I_SERVICE_LOCATION IN ESB22012.TB_NANNY.SERVICE_LOCATION%TYPE                                               -- �A�Ȱϰ�
    ) RETURN NUMBER 
    AS
    BEGIN
        IF
            I_NANNY_ID IS NULL
        THEN
            RETURN 0;
        ELSE
            UPDATE
                ESB22012.TB_NANNY
            SET
                SELF_INTRODUCTION = NVL(I_SELF_INTRODUCTION, SELF_INTRODUCTION),
                SERVICE_LOCATION = NVL(I_SERVICE_LOCATION, SERVICE_LOCATION)
            WHERE 
                NANNY_ID = I_NANNY_ID;
            RETURN SQL%ROWCOUNT;
        END IF;
    END FN_UPDATE_NANNY;

--    /**
--     * �s�W�έק�O�i�ҷӤ��ҷӪ��A
--     */
--    FUNCTION FN_ADD_OR_UPDATE_NANNY_CERTIFICATION (
--        -- ��J��� ----------------------------------------------------------------------------------------------------             
--        I_NANNY_ID IN ESB22012.TB_NANNY.NANNY_ID%TYPE,                                                              -- �O�i�s��
--        I_CERTIFICATION_STATUS  IN ESB22012.TB_NANNY.CERTIFICATION_STATUS%TYPE,                                     -- �ҷӪ��A
--        I_CERTIFICATION IN ESB22012.TB_NANNY_CERTIFICATION.CERTIFICATION%TYPE                                       -- �O�i�ҷ�
--    ) RETURN NUMBER 
--    AS
--    BEGIN
--        -- TODO: ������� FUNCTION PG_USER_NANNY.FN_ADD_OR_UPDATE_NANNY_CERTIFICATION
--        RETURN NULL;
--    END FN_ADD_OR_UPDATE_NANNY_CERTIFICATION;
    
    /**
     * �ק��d���O�i���O�i�������A���
     */
    FUNCTION FN_UPDATE_NANNY_STATUS (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_NANNY_ID IN ESB22012.TB_NANNY.NANNY_ID%TYPE,                                                              -- �O�i�s��
        I_NANNY_STATUS  IN ESB22012.TB_NANNY.NANNY_STATUS%TYPE                                                      -- �O�i�������A
    ) RETURN NUMBER 
    AS
    BEGIN
        IF
            I_NANNY_ID IS NULL
        THEN
            RETURN 0;
        ELSE
            UPDATE
                ESB22012.TB_NANNY_SERVICE
            SET
                SERVICE_STATUS = NVL(I_NANNY_STATUS, SERVICE_STATUS)
            WHERE 
                ESB22012.TB_NANNY_SERVICE.NANNY_ID = I_NANNY_ID;
            UPDATE
                ESB22012.TB_NANNY
            SET
                NANNY_STATUS = NVL(I_NANNY_STATUS, NANNY_STATUS)
            WHERE 
                ESB22012.TB_NANNY.NANNY_ID = I_NANNY_ID;
            RETURN SQL%ROWCOUNT;
        END IF;
    END FN_UPDATE_NANNY_STATUS;
    
    /**
     * �d�߳�@�d���O�i���
     */
    PROCEDURE SP_FIND_UNIQUE_NANNY (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_NANNY_ID IN ESB22012.TB_NANNY.NANNY_ID%TYPE,                                                              -- �O�i�s��
        -- ��X���G ----------------------------------------------------------------------------------------------------
        O_TOTAL OUT NUMBER,                                                                                         -- ��X�d���`����
        O_DATA OUT SYS_REFCURSOR                                                                                    -- ��X�ӭ����
    ) 
    AS
        NANNY_INFO_LIST TT_NANNY_INFO_LIST;                                                                         -- �d���O�i��ƲM��
    BEGIN
        
        -- 1. �̾ڱ���d���d���O�i��Ƥ��e --------------------------------------------------------------------------------
        SELECT 
            N.NANNY_ID,                                                                                             -- �O�i�s��, Snowflake ID
            N.SERVICE_LOCATION,                                                                                     -- �A�Ȱϰ�
            N.CERTIFICATION_STATUS,                                                                                 -- �ҷӪ��A
            NS.SERVICE_SEQ_NO,                                                                                      -- �A�Ȭy����, Snowflake ID
            NS.SERVICE_TYPE,                                                                                        -- �A������
            NS.PRICE,                                                                                               -- �A�Ȼ���
            NS.ACCEPTABLE_SPECIES,                                                                                  -- �i�����d������
            NS.ACCEPTABLE_AMOUNTS,                                                                                  -- �i�����d���ƶq
            NS.ACCEPTABLE_SIZE,                                                                                     -- �i�����̤j�d���髬
            NS.EMERGENCY_DELIVERY,                                                                                  -- ��檬�p���e
            NS.LAST_MIN_BOOKING,                                                                                    -- �̫�@��w�q
            NS.CASE_AMOUNTS,                                                                                        -- �w���ѪA�Ȧ���
            NS.SERVICE_SCORE                                                                                        -- �A���`��
        BULK COLLECT INTO NANNY_INFO_LIST                                                                           -- ��媺�覡�N�d�ߵ��G��J�d���O�i��ƲM��
        FROM 
            ESB22012.TB_NANNY N                                                                                     -- �d���O�i�C��
            INNER JOIN ESB22012.TB_NANNY_SERVICE NS ON NS.NANNY_ID = N.NANNY_ID                                     -- �O�i�A�ȦC��
        WHERE 
            N.NANNY_ID = I_NANNY_ID;

        -- 2. ���o����`���� -------------------------------------------------------------------------------------------
        O_TOTAL := NANNY_INFO_LIST.COUNT;                                                                            -- ����`����
        
        -- 3. ���o��ڬd�ߪ���� ----------------------------------------------------------------------------------------
        OPEN O_DATA FOR                                                                                             -- ��X���
        SELECT 
            A.NANNY_ID,                                                                                             -- �O�i�s��, Snowflake ID
            A.SERVICE_LOCATION,                                                                                     -- �A�Ȱϰ�
            A.CERTIFICATION_STATUS,                                                                                 -- �ҷӪ��A
            A.SERVICE_SEQ_NO,                                                                                      -- �A�Ȭy����, Snowflake ID
            A.SERVICE_TYPE,                                                                                        -- �A������
            A.PRICE,                                                                                               -- �A�Ȼ���
            A.ACCEPTABLE_SPECIES,                                                                                  -- �i�����d������
            A.ACCEPTABLE_AMOUNTS,                                                                                  -- �i�����d���ƶq
            A.ACCEPTABLE_SIZE,                                                                                     -- �i�����̤j�d���髬
            A.EMERGENCY_DELIVERY,                                                                                  -- ��檬�p���e
            A.LAST_MIN_BOOKING,                                                                                    -- �̫�@��w�q
            A.CASE_AMOUNTS,                                                                                        -- �w���ѪA�Ȧ���
            A.SERVICE_SCORE                                                                                        -- �A���`��
        FROM 
            TABLE(NANNY_INFO_LIST) A;
    END SP_FIND_UNIQUE_NANNY;

    /**
     * �d�߳�@�d���O�i���ҷӸ��
     */
    FUNCTION FN_FIND_UNIQUE_NANNY_CERTIFICATION (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_NANNY_ID IN ESB22012.TB_NANNY.NANNY_ID%TYPE                                                               -- �O�i�s��
    ) RETURN BLOB
    AS
        V_CERTIFICATION BLOB;
    BEGIN
        IF
            I_NANNY_ID IS NULL
        THEN
            RETURN NULL;
        ELSE
            SELECT 
                CERTIFICATION
            INTO V_CERTIFICATION
            FROM
                ESB22012.TB_NANNY_CERTIFICATION
            WHERE 
                NANNY_ID = I_NANNY_ID;
            RETURN V_CERTIFICATION;
        END IF;
    END FN_FIND_UNIQUE_NANNY_CERTIFICATION;

    /**
     * �d���d���O�i���
     */
    PROCEDURE SP_FIND_NANNY (
        -- ��J��� ----------------------------------------------------------------------------------------------------             
        I_NANNY_ID IN ESB22012.TB_NANNY.NANNY_ID%TYPE,                                                              -- �O�i�s��
        I_SERVICE_LOCATION IN ESB22012.TB_NANNY.SERVICE_LOCATION%TYPE,                                              -- �A�Ȱϰ�
        I_CERTIFICATION_STATUS IN ESB22012.TB_NANNY.CERTIFICATION_STATUS%TYPE,                                      -- �ҷӪ��A
        I_SERVICE_SEQ_NO IN ESB22012.TB_NANNY_SERVICE.SERVICE_SEQ_NO%TYPE,                                          -- �A�Ȭy����, Snowflake ID
        I_SERVICE_TYPE IN ESB22012.TB_NANNY_SERVICE.SERVICE_TYPE%TYPE,                                              -- �A������
        I_PRICE IN ESB22012.TB_NANNY_SERVICE.PRICE%TYPE,                                                            -- �A�Ȼ���
        I_ACCEPTABLE_SPECIES IN ESB22012.TB_NANNY_SERVICE.ACCEPTABLE_SPECIES%TYPE,                                  -- �i�����d������
        I_ACCEPTABLE_AMOUNTS IN ESB22012.TB_NANNY_SERVICE.ACCEPTABLE_AMOUNTS%TYPE,                                  -- �i�����d���ƶq
        I_ACCEPTABLE_SIZE IN ESB22012.TB_NANNY_SERVICE.ACCEPTABLE_SIZE%TYPE,                                        -- �i�����̤j�d���髬
        I_EMERGENCY_DELIVERY IN ESB22012.TB_NANNY_SERVICE.EMERGENCY_DELIVERY%TYPE,                                  -- ��檬�p���e
        I_LAST_MIN_BOOKING IN ESB22012.TB_NANNY_SERVICE.LAST_MIN_BOOKING%TYPE,                                      -- �̫�@��w�q
        I_SERVICE_SCORE IN ESB22012.TB_NANNY_SERVICE.SERVICE_SCORE%TYPE,                                            -- �A���`��
        -- ��X���G ----------------------------------------------------------------------------------------------------
        O_TOTAL OUT NUMBER,                                                                                         -- ��X�d���`����
        O_DATA OUT SYS_REFCURSOR                                                                                    -- ��X�ӭ����
    ) 
    AS
    BEGIN
        -- TODO: ������� PROCEDURE PG_USER_NANNY.SP_FIND_NANNY
        NULL;
    END SP_FIND_NANNY;

END PG_USER_NANNY;

/
--------------------------------------------------------
--  DDL for Function BINDARRAY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "APUSER"."BINDARRAY" (cIdArray VARCHARARRAY) RETURN VARCHAR AS 
    rslt VARCHAR(1000);
BEGIN
   /*
    @AUTHOR ESB19350
    @DATE 2020.04.28
    @DESCRIPTION �w�s�{�ǽd�� - �զ��ʺA�j�w���G�� 
    @NOTE ���լd�ߤW��
    */
    FOR i IN cIdArray.FIRST..cIdArray.LAST
    LOOP
      IF rslt IS NULL THEN
        rslt := rslt || '''' || cIdArray(i) || '''';
      ELSE
        rslt := rslt || ', ''' || cIdArray(i) || '''';
      END IF;
    END LOOP;
    RETURN rslt;
END bindArray;

/
--------------------------------------------------------
--  DDL for Function BINDS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "APUSER"."BINDS" (n NUMBER) RETURN VARCHAR2 AS 
    rslt VARCHAR2(1000);
BEGIN
   /*
    @AUTHOR ESB19350
    @DATE 2020.04.28
    @DESCRIPTION �w�s�{�ǽd�� - �զ��ʺA�j�w���G�� 
    @NOTE ���լd�ߤW��
    */
    FOR i IN 1..n LOOP
      IF rslt IS NULL THEN
        rslt := ':' || i;
      ELSE
        rslt := rslt || ', :' || i;
      END IF;
    END LOOP;
    RETURN rslt;
END binds;

/
--------------------------------------------------------
--  DDL for Function BINDSORDERBY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "APUSER"."BINDSORDERBY" 
(
  SIZECOUNT IN NUMBER 
) 
RETURN VARCHAR2 IS
    bindVar varchar(1000);
BEGIN
    for i in 1..SIZECOUNT loop
        IF i != SIZECOUNT THEN
           bindVar :=  bindVar || ':A' || i || ',';
           --bindVar :=  bindVar || ':A' || i || ' :B' || i ||',';
           --bindVar :=  bindVar || ':' || i || ',';
        ELSE 
           bindVar :=  bindVar || ':A' || i;
           --bindVar :=  bindVar || ':A' || i || ' :B' || i ;
           --bindVar :=  bindVar || ':' || i ;
        END IF;
    end loop;
    RETURN bindVar;
END BINDSORDERBY;

/
--------------------------------------------------------
--  DDL for Function GEN_NUMBERS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "APUSER"."GEN_NUMBERS" (N IN NUMBER DEFAULT NULL)
  RETURN ARRAY
  PIPELINED
  AS
  BEGIN
     FOR I IN 1 .. NVL(N,999999999)
     LOOP
         PIPE ROW(I);
     END LOOP;
     RETURN;
  END;

/
--------------------------------------------------------
--  DDL for Function GET_CUSTOMERS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "APUSER"."GET_CUSTOMERS" 
  RETURN SYS_REFCURSOR
AS
  MY_CURSOR SYS_REFCURSOR;
BEGIN
  OPEN MY_CURSOR FOR SELECT * FROM APUSER.CUSTOMERS;
  TEST_GET_CUSTOMERS;
  RETURN MY_CURSOR;
END GET_CUSTOMERS;

/
--------------------------------------------------------
--  DDL for Function SF_ADD_NO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "APUSER"."SF_ADD_NO" RETURN NUMBER 
AS 
	ID_NO NUMBER;
BEGIN
	INSERT INTO IDENTITY_TEST_TAB(
        DESCRIPTION
    )
    VALUES (
        TO_CHAR(SYSDATE, 'YYYYMMDD')
    )
    RETURNING ID INTO ID_NO;

    RETURN ID_NO;
END SF_ADD_NO;

/
--------------------------------------------------------
--  DDL for Function SF_ADD_TEST
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "APUSER"."SF_ADD_TEST" (
    I_NUM_01 IN NUMBER,
    I_NUM_02 IN NUMBER 
) RETURN NUMBER AS 
BEGIN
  RETURN I_NUM_01 + I_NUM_02;
END SF_ADD_TEST;

/
--------------------------------------------------------
--  DDL for Function SF_GET_SEQ_NO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "APUSER"."SF_GET_SEQ_NO" (
	I_SEQ_TYPE VARCHAR2
) RETURN NUMBER 
AS 
	PRAGMA AUTONOMOUS_TRANSACTION;
	O_SEQ_NO NUMBER;																									        --�ŧi�^�ǧǸ��ܼ�
	V_LOCK NUMBER;																									            --�ŧi�ܼơA�ѳ�@�J�fKey�ϥ� 
	V_CURRENT_TIME VARCHAR2(12) := TO_CHAR(SYSDATE, 'YYYYMMDDHH24');												            --���o�ثe�ɶ��r��A�ѧP�w�O�_���m�Ǹ� 
BEGIN
	-- 1. ��s�Ǹ��A�Y��s���\�A�h�^�ǳ̫�@���Ǹ� -------------------------------------------------------
	UPDATE APUSER.TB_SEQ_REGISTRY SR																				            --��s�x�s�Ǹ�Table 
	SET
		SR.SEQ_NO = SR.SEQ_NO + 1																					            --���Ǹ��i��[�@�ʧ@ 
	WHERE
		SR.SEQ_TYPE = I_SEQ_TYPE																					            --��s���󬰦۩w�q�~�ȦW�٤Υثe�ɶ� 
		AND SR.SEQ_TIME = V_CURRENT_TIME																			 
	RETURNING SEQ_NO INTO O_SEQ_NO;																					            --��s���O������A�ñN���ʹL�᪺�Ǹ��ƭ�Assign��O_SEQ_NO�ܼ� 

	IF SQL%ROWCOUNT > 0																								            --�p�Gupdate���O�����ʵ��ơA�N����榨�\
	THEN
		COMMIT;
		RETURN O_SEQ_NO;																							            --�i��commit�A�ñN�Ǹ��^�ǡA����Function
	END IF;

	-- 2. �Y�O���������A�h��LOCK��RECORD�A�A�i��MERGE --------------------------------------------------
	-- 2.1. LOCK RECORD ----------------------------------------------
	SELECT
		1 INTO V_LOCK																								            --�Uselect for update���O�ALock Record
	FROM
		APUSER.TB_SEQ_REGISTRY SR																					             
	WHERE
		SR.SEQ_TYPE = '-999'																						            --�w���x�s�@����ơA��Lock Record�ϥ�
	FOR UPDATE
	;

	-- 2.2. MERGE RECORD --------------------------------------------
	MERGE INTO APUSER.TB_SEQ_REGISTRY SR USING DUAL ON (															            --�ϥ�Merge into���O
		SR.SEQ_TYPE = I_SEQ_TYPE																					            --��TB_SEQ_REGISTRY���s�b�۩w�q�~�ȦW��(SEQ_TYPE)
		AND SR.SEQ_TIME = V_CURRENT_TIME 																			            --�P�ثe�ɶ�(V_CURRENT_TIME)���
	)
	WHEN NOT MATCHED THEN
	INSERT (
		SEQ_TYPE,																									            --�p�G���s�b�A�N�����������A�G�s�W�@����l��� 
		SEQ_TIME																									            --�s�W�۩w�q�~�ȦW�ٻP(SEQ_TYPE)�P�ثe�ɶ�(V_CURRENT_TIME)���
	)
	VALUES (
		I_SEQ_TYPE,																									
		V_CURRENT_TIME																								 
	)
	WHEN MATCHED THEN
	UPDATE SET
		SR.SEQ_NO = SR.SEQ_NO + 1																					            --�p�G�s�b�A�h�N��w�Q��LThread�m���s�W��ơA�G�����b��Ǹ��i��[�@ 
	;

	SELECT
		SR.SEQ_NO INTO O_SEQ_NO																						            --�N�ثe�s�Ǹ�select�X��
	FROM
		APUSER.TB_SEQ_REGISTRY SR																					
	WHERE
		SR.SEQ_TYPE = I_SEQ_TYPE																					 
		AND SR.SEQ_TIME = V_CURRENT_TIME																			 
	;	

	COMMIT;

	RETURN O_SEQ_NO;																								            --�^�ǧǸ�
END;

/
--------------------------------------------------------
--  DDL for Function TEST1
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "APUSER"."TEST1" (
	I_IDS IN TT_VARCHAR2_ARRAY
) RETURN SYS_REFCURSOR
AS
	O_RESULT SYS_REFCURSOR;
BEGIN
	OPEN O_RESULT FOR
	SELECT 
        TU.*
	FROM
		APUSER.TB_USER TU
    WHERE
        I_IDS IS EMPTY
        OR (
            TU.ID IN(
                SELECT
                    *
                FROM (
                    TABLE(I_IDS)
                )
            )        
        )
	;

	RETURN O_RESULT;

END TEST1;

/
--------------------------------------------------------
--  DDL for Function TEST1_FUNCTION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "APUSER"."TEST1_FUNCTION" RETURN NUMBER IS affectRow NUMBER;
BEGIN
  INSERT INTO CUSTOMER (ID, NAME, PHONE) VALUES('999', 'EE', '0123456789');
  affectRow:= SQL%RowCount; 
  RETURN affectRow;
END TEST1_FUNCTION;

/
--------------------------------------------------------
--  DDL for Function TEST2
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "APUSER"."TEST2" RETURN SYS_REFCURSOR
AS
	O_RESULT SYS_REFCURSOR;
BEGIN
	OPEN O_RESULT FOR
	SELECT
		*
	FROM   
		CUSTOMER C	
	;

    RETURN O_RESULT;
END TEST2;

/
--------------------------------------------------------
--  DDL for Function TEST_COUNT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "APUSER"."TEST_COUNT" 

RETURN NUMBER IS 
    TOTAL NUMBER :=0;
BEGIN
    INSERT INTO CUSTOMERS(ID,NAME,AGE,ADDRESS,SALARY) VALUES(19,'Roberrr',22,'','10000');
    SELECT COUNT(*) INTO TOTAL
    FROM CUSTOMERS;
    RETURN TOTAL;
END;

/
--------------------------------------------------------
--  DDL for Function TEST_CURSOR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "APUSER"."TEST_CURSOR" 
    RETURN SYS_REFCURSOR AS 
    rsltCursor SYS_REFCURSOR;
BEGIN
    OPEN rsltCursor FOR 
    SELECT * FROM CUSTOMER;
    RETURN rsltCursor;
END TEST_CURSOR;

/
--------------------------------------------------------
--  Constraints for Table TB_CASE_APPLICANT
--------------------------------------------------------

  ALTER TABLE "ESB22012"."TB_CASE_APPLICANT" MODIFY ("APPLICANT_SEQ_NO" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_CASE_APPLICANT" MODIFY ("CASE_NO" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_CASE_APPLICANT" MODIFY ("NANNY_ID" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_CASE_APPLICANT" MODIFY ("APPLICANT_STATUS" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_CASE_APPLICANT" ADD CONSTRAINT "PK_CASE_APPLICANT" PRIMARY KEY ("APPLICANT_SEQ_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_NANNY
--------------------------------------------------------

  ALTER TABLE "ESB22012"."TB_NANNY" MODIFY ("NANNY_ID" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY" MODIFY ("SELF_INTRODUCTION" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY" MODIFY ("SERVICE_LOCATION" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY" MODIFY ("NANNY_STATUS" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY" ADD CONSTRAINT "PK_NANNY" PRIMARY KEY ("NANNY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ESB22012"."TB_NANNY" MODIFY ("CERTIFICATION_STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TB_NANNY_CERTIFICATION
--------------------------------------------------------

  ALTER TABLE "ESB22012"."TB_NANNY_CERTIFICATION" MODIFY ("NANNY_ID" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY_CERTIFICATION" ADD CONSTRAINT "PK_NANNY_CERTIFICATION" PRIMARY KEY ("NANNY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_NANNY_SERVICE
--------------------------------------------------------

  ALTER TABLE "ESB22012"."TB_NANNY_SERVICE" MODIFY ("SERVICE_SEQ_NO" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY_SERVICE" MODIFY ("NANNY_ID" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY_SERVICE" MODIFY ("SERVICE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY_SERVICE" MODIFY ("SERVICE_NAME" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY_SERVICE" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY_SERVICE" MODIFY ("ACCEPTABLE_SPECIES" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY_SERVICE" MODIFY ("ACCEPTABLE_AMOUNTS" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY_SERVICE" MODIFY ("ACCEPTABLE_SIZE" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY_SERVICE" MODIFY ("SUPERVISION" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY_SERVICE" MODIFY ("EXCRETION_FREQUENCY" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY_SERVICE" MODIFY ("WALK_FREQUENCY" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY_SERVICE" MODIFY ("EMERGENCY_DELIVERY" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY_SERVICE" MODIFY ("LAST_MIN_BOOKING" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY_SERVICE" MODIFY ("CASE_AMOUNTS" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY_SERVICE" MODIFY ("SERVICE_STATUS" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_NANNY_SERVICE" ADD CONSTRAINT "PK_NANNY_SERVICE" PRIMARY KEY ("SERVICE_SEQ_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_SERVICE_CASE
--------------------------------------------------------

  ALTER TABLE "ESB22012"."TB_SERVICE_CASE" MODIFY ("CASE_NO" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_SERVICE_CASE" MODIFY ("APPOINTER" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_SERVICE_CASE" MODIFY ("SERVICE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_SERVICE_CASE" MODIFY ("ACCEPTABLE_PRICE" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_SERVICE_CASE" MODIFY ("PET_SPECIES" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_SERVICE_CASE" MODIFY ("PET_AMOUNTS" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_SERVICE_CASE" MODIFY ("PET_SIZE" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_SERVICE_CASE" MODIFY ("SERVICE_START_DATE" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_SERVICE_CASE" MODIFY ("SERVICE_DUE_DATE" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_SERVICE_CASE" MODIFY ("LOCATION" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_SERVICE_CASE" MODIFY ("REQUIRED_VISIT_FREQUENCY" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_SERVICE_CASE" MODIFY ("CASE_STATUS" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_SERVICE_CASE" ADD CONSTRAINT "PK_SERVICE_CASE" PRIMARY KEY ("CASE_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_USER
--------------------------------------------------------

  ALTER TABLE "ESB22012"."TB_USER" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_USER" MODIFY ("USER_PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_USER" MODIFY ("USER_NAME" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_USER" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_USER" MODIFY ("MOBILE" NOT NULL ENABLE);
  ALTER TABLE "ESB22012"."TB_USER" ADD CONSTRAINT "PK_USER" PRIMARY KEY ("USER_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
