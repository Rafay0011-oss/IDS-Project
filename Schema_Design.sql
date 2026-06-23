-- ============================================================
-- Smart City Management System (SCMS)
-- Group 08 | BSSE | IIUI-ISB
-- Members: Abdur Rafay (004378), Shah Bilawal (004930),
--          Huzaifa Farooq (004354), Zain Mustafa (004368)
-- Submitted To: Shakeel Ahmad
-- File: Schema_Design.sql  (DDL - Part 1)
-- RDBMS: Oracle Express Edition (Oracle XE)
-- ============================================================

-- ------------------------------------------------------------
-- DROP STATEMENTS (Oracle-compatible: EXCEPTION handles missing table)
-- ------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE EVENT_ATTENDANCE CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CONTRACT CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE COMPLAINT CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE BILL CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE EMPLOYEE CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE HOUSE CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE PUBLIC_EVENT CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE VENDOR CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE MUNICIPAL_DEPARTMENT CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE UTILITY CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CITIZEN CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- ------------------------------------------------------------
-- TABLE 1: CITIZEN
-- ------------------------------------------------------------
CREATE TABLE CITIZEN (
    Citizen_ID    NUMBER(10)    NOT NULL,
    Full_Name     VARCHAR2(100) NOT NULL,
    Phone_Number  VARCHAR2(20),
    Email_Address VARCHAR2(100),
    CONSTRAINT PK_CITIZEN    PRIMARY KEY (Citizen_ID),
    CONSTRAINT UQ_CITIZEN_EMAIL UNIQUE (Email_Address)
);

-- ------------------------------------------------------------
-- TABLE 2: HOUSE
-- ------------------------------------------------------------
CREATE TABLE HOUSE (
    House_ID       NUMBER(10)    NOT NULL,
    Citizen_ID     NUMBER(10)    NOT NULL,
    Street_Address VARCHAR2(200) NOT NULL,
    City_Zone      VARCHAR2(50),
    CONSTRAINT PK_HOUSE         PRIMARY KEY (House_ID),
    CONSTRAINT FK_HOUSE_CITIZEN FOREIGN KEY (Citizen_ID)
        REFERENCES CITIZEN(Citizen_ID)
        ON DELETE CASCADE
);

-- ------------------------------------------------------------
-- TABLE 3: UTILITY
-- ------------------------------------------------------------
CREATE TABLE UTILITY (
    Utility_ID   NUMBER(10)    NOT NULL,
    Utility_Name VARCHAR2(50)  NOT NULL,
    Unit_Rate    NUMBER(10,2)  NOT NULL,
    CONSTRAINT PK_UTILITY        PRIMARY KEY (Utility_ID),
    CONSTRAINT CHK_UTILITY_RATE  CHECK (Unit_Rate >= 0)
);

-- ------------------------------------------------------------
-- TABLE 4: MUNICIPAL_DEPARTMENT
-- ------------------------------------------------------------
CREATE TABLE MUNICIPAL_DEPARTMENT (
    Dept_ID         NUMBER(10)    NOT NULL,
    Dept_Name       VARCHAR2(100) NOT NULL,
    Office_Location VARCHAR2(200),
    CONSTRAINT PK_DEPT PRIMARY KEY (Dept_ID)
);

-- ------------------------------------------------------------
-- TABLE 5: BILL
-- ------------------------------------------------------------
CREATE TABLE BILL (
    Bill_ID      NUMBER(10)   NOT NULL,
    Citizen_ID   NUMBER(10)   NOT NULL,
    Utility_ID   NUMBER(10)   NOT NULL,
    Issue_Date   DATE         NOT NULL,
    Total_Amount NUMBER(12,2) NOT NULL,
    CONSTRAINT PK_BILL          PRIMARY KEY (Bill_ID),
    CONSTRAINT FK_BILL_CITIZEN  FOREIGN KEY (Citizen_ID)
        REFERENCES CITIZEN(Citizen_ID) ON DELETE CASCADE,
    CONSTRAINT FK_BILL_UTILITY  FOREIGN KEY (Utility_ID)
        REFERENCES UTILITY(Utility_ID),
    CONSTRAINT CHK_BILL_AMOUNT  CHECK (Total_Amount >= 0)
);

-- ------------------------------------------------------------
-- TABLE 6: EMPLOYEE
-- ------------------------------------------------------------
CREATE TABLE EMPLOYEE (
    Emp_ID     NUMBER(10)    NOT NULL,
    Citizen_ID NUMBER(10)    NOT NULL,
    Dept_ID    NUMBER(10)    NOT NULL,
    Emp_Name   VARCHAR2(100) NOT NULL,
    Job_Title  VARCHAR2(100),
    CONSTRAINT PK_EMPLOYEE    PRIMARY KEY (Emp_ID),
    CONSTRAINT FK_EMP_CITIZEN FOREIGN KEY (Citizen_ID)
        REFERENCES CITIZEN(Citizen_ID),
    CONSTRAINT FK_EMP_DEPT    FOREIGN KEY (Dept_ID)
        REFERENCES MUNICIPAL_DEPARTMENT(Dept_ID)
);

-- ------------------------------------------------------------
-- TABLE 7: COMPLAINT
-- ------------------------------------------------------------
CREATE TABLE COMPLAINT (
    Complaint_ID      NUMBER(10)    NOT NULL,
    Citizen_ID        NUMBER(10)    NOT NULL,
    Dept_ID           NUMBER(10)    NOT NULL,
    Description       VARCHAR2(1000) NOT NULL,
    Resolution_Status VARCHAR2(20)  DEFAULT 'Pending',
    CONSTRAINT PK_COMPLAINT       PRIMARY KEY (Complaint_ID),
    CONSTRAINT FK_COMP_CITIZEN    FOREIGN KEY (Citizen_ID)
        REFERENCES CITIZEN(Citizen_ID) ON DELETE CASCADE,
    CONSTRAINT FK_COMP_DEPT       FOREIGN KEY (Dept_ID)
        REFERENCES MUNICIPAL_DEPARTMENT(Dept_ID),
    CONSTRAINT CHK_COMP_STATUS    CHECK (Resolution_Status IN ('Pending','In Progress','Resolved'))
);

-- ------------------------------------------------------------
-- TABLE 8: PUBLIC_EVENT
-- ------------------------------------------------------------
CREATE TABLE PUBLIC_EVENT (
    Event_ID       NUMBER(10)    NOT NULL,
    Event_Name     VARCHAR2(150) NOT NULL,
    Event_Date     DATE          NOT NULL,
    Location_Venue VARCHAR2(200),
    CONSTRAINT PK_EVENT PRIMARY KEY (Event_ID)
);

-- ------------------------------------------------------------
-- TABLE 9: VENDOR
-- ------------------------------------------------------------
CREATE TABLE VENDOR (
    Vendor_ID        NUMBER(10)    NOT NULL,
    Vendor_Name      VARCHAR2(100) NOT NULL,
    Service_Category VARCHAR2(100),
    Contact_Number   VARCHAR2(20),
    CONSTRAINT PK_VENDOR PRIMARY KEY (Vendor_ID)
);

-- ------------------------------------------------------------
-- TABLE 10: CONTRACT  (Associative Entity)
-- ------------------------------------------------------------
CREATE TABLE CONTRACT (
    Contract_ID NUMBER(10) NOT NULL,
    Dept_ID     NUMBER(10) NOT NULL,
    Vendor_ID   NUMBER(10) NOT NULL,
    Start_Date  DATE       NOT NULL,
    End_Date    DATE,
    CONSTRAINT PK_CONTRACT         PRIMARY KEY (Contract_ID),
    CONSTRAINT FK_CONTRACT_DEPT    FOREIGN KEY (Dept_ID)
        REFERENCES MUNICIPAL_DEPARTMENT(Dept_ID),
    CONSTRAINT FK_CONTRACT_VENDOR  FOREIGN KEY (Vendor_ID)
        REFERENCES VENDOR(Vendor_ID),
    CONSTRAINT CHK_CONTRACT_DATES  CHECK (End_Date IS NULL OR End_Date >= Start_Date)
);

-- ------------------------------------------------------------
-- TABLE 11: EVENT_ATTENDANCE  (Associative Entity)
-- ------------------------------------------------------------
CREATE TABLE EVENT_ATTENDANCE (
    Attendance_ID     NUMBER(10)   NOT NULL,
    Citizen_ID        NUMBER(10)   NOT NULL,
    Event_ID          NUMBER(10)   NOT NULL,
    Registration_Date DATE         NOT NULL,
    Ticket_Type       VARCHAR2(20) DEFAULT 'Free',
    CONSTRAINT PK_ATTENDANCE    PRIMARY KEY (Attendance_ID),
    CONSTRAINT FK_ATT_CITIZEN   FOREIGN KEY (Citizen_ID)
        REFERENCES CITIZEN(Citizen_ID) ON DELETE CASCADE,
    CONSTRAINT FK_ATT_EVENT     FOREIGN KEY (Event_ID)
        REFERENCES PUBLIC_EVENT(Event_ID) ON DELETE CASCADE,
    CONSTRAINT UQ_CITIZEN_EVENT UNIQUE (Citizen_ID, Event_ID),
    CONSTRAINT CHK_TICKET_TYPE  CHECK (Ticket_Type IN ('Free','Paid','VIP'))
);

-- ============================================================
-- END OF DDL SCRIPT
-- ============================================================
