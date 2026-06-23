-- ============================================================
-- Smart City Management System (SCMS)
-- Group 08 | BSSE | IIUI-ISB
-- File: Business_Queries.sql  (Part 3 — 10 Required Queries)
-- RDBMS: Oracle Express Edition
-- ============================================================

-- ============================================================
-- SECTION A: MULTI-TABLE JOINS  (Queries 1, 2, 3)
-- ============================================================

-- ------------------------------------------------------------
-- Query 1 (INNER JOIN — 3 tables)
-- Business Question: List every citizen along with all their
-- utility bills, showing the utility name and amount due.
-- ------------------------------------------------------------
SELECT
    C.Citizen_ID,
    C.Full_Name,
    U.Utility_Name,
    TO_CHAR(B.Issue_Date, 'DD-MON-YYYY') AS Issue_Date,
    B.Total_Amount
FROM CITIZEN C
INNER JOIN BILL    B ON C.Citizen_ID = B.Citizen_ID
INNER JOIN UTILITY U ON B.Utility_ID  = U.Utility_ID
ORDER BY C.Full_Name, B.Issue_Date;

-- ------------------------------------------------------------
-- Query 2 (LEFT JOIN)
-- Business Question: Show all citizens and any complaints they
-- have filed. Citizens with no complaints still appear.
-- ------------------------------------------------------------
SELECT
    C.Citizen_ID,
    C.Full_Name,
    C.Phone_Number,
    CO.Complaint_ID,
    CO.Description,
    CO.Resolution_Status
FROM CITIZEN  C
LEFT JOIN COMPLAINT CO ON C.Citizen_ID = CO.Citizen_ID
ORDER BY C.Citizen_ID;

-- ------------------------------------------------------------
-- Query 3 (INNER JOIN — 3 tables)
-- Business Question: Show each department's contracts with the
-- vendor name and service category.
-- ------------------------------------------------------------
SELECT
    MD.Dept_Name,
    V.Vendor_Name,
    V.Service_Category,
    TO_CHAR(CN.Start_Date,'DD-MON-YYYY') AS Start_Date,
    TO_CHAR(CN.End_Date,  'DD-MON-YYYY') AS End_Date
FROM MUNICIPAL_DEPARTMENT MD
INNER JOIN CONTRACT CN ON MD.Dept_ID   = CN.Dept_ID
INNER JOIN VENDOR   V  ON CN.Vendor_ID = V.Vendor_ID
ORDER BY MD.Dept_Name, CN.Start_Date;

-- ============================================================
-- SECTION B: DATA AGGREGATION  (Queries 4, 5)
-- ============================================================

-- ------------------------------------------------------------
-- Query 4 (COUNT + GROUP BY + HAVING)
-- Business Question: Which departments have received more than
-- 1 complaint? Show complaint count per department.
-- ------------------------------------------------------------
SELECT
    MD.Dept_Name,
    COUNT(CO.Complaint_ID) AS Total_Complaints
FROM MUNICIPAL_DEPARTMENT MD
INNER JOIN COMPLAINT CO ON MD.Dept_ID = CO.Dept_ID
GROUP BY MD.Dept_ID, MD.Dept_Name
HAVING COUNT(CO.Complaint_ID) > 1
ORDER BY Total_Complaints DESC;

-- ------------------------------------------------------------
-- Query 5 (SUM + AVG + GROUP BY)
-- Business Question: What is the total and average bill amount
-- charged per utility type?
-- ------------------------------------------------------------
SELECT
    U.Utility_Name,
    COUNT(B.Bill_ID)               AS Bills_Issued,
    SUM(B.Total_Amount)            AS Total_Revenue,
    ROUND(AVG(B.Total_Amount), 2)  AS Avg_Bill_Amount,
    MAX(B.Total_Amount)            AS Highest_Bill,
    MIN(B.Total_Amount)            AS Lowest_Bill
FROM UTILITY U
INNER JOIN BILL B ON U.Utility_ID = B.Utility_ID
GROUP BY U.Utility_ID, U.Utility_Name
ORDER BY Total_Revenue DESC;

-- ============================================================
-- SECTION C: SUBQUERIES  (Queries 6, 7)
-- ============================================================

-- ------------------------------------------------------------
-- Query 6 (IN subquery)
-- Business Question: Find all citizens who have attended at
-- least one public event.
-- ------------------------------------------------------------
SELECT
    Citizen_ID,
    Full_Name,
    Phone_Number
FROM CITIZEN
WHERE Citizen_ID IN (
    SELECT DISTINCT Citizen_ID
    FROM EVENT_ATTENDANCE
)
ORDER BY Full_Name;

-- ------------------------------------------------------------
-- Query 7 (Correlated EXISTS subquery)
-- Business Question: List all departments that have at least
-- one complaint with status 'Pending'.
-- ------------------------------------------------------------
SELECT
    Dept_ID,
    Dept_Name,
    Office_Location
FROM MUNICIPAL_DEPARTMENT MD
WHERE EXISTS (
    SELECT 1
    FROM COMPLAINT C
    WHERE C.Dept_ID = MD.Dept_ID
      AND C.Resolution_Status = 'Pending'
)
ORDER BY Dept_Name;

-- ============================================================
-- SECTION D: ADVANCED DATABASE OBJECTS  (Queries 8, 9, 10)
-- ============================================================

-- ------------------------------------------------------------
-- Query 8 — Database VIEW
-- Business Question: Create a reusable view that shows full
-- complaint details joined with citizen and department names.
-- Oracle syntax: CREATE OR REPLACE VIEW ... AS SELECT ...
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW vw_Complaint_Details AS
SELECT
    CO.Complaint_ID,
    C.Full_Name          AS Citizen_Name,
    C.Phone_Number,
    MD.Dept_Name,
    CO.Description,
    CO.Resolution_Status
FROM COMPLAINT             CO
INNER JOIN CITIZEN             C  ON CO.Citizen_ID = C.Citizen_ID
INNER JOIN MUNICIPAL_DEPARTMENT MD ON CO.Dept_ID   = MD.Dept_ID;
/

-- Query to verify the view:
SELECT * FROM vw_Complaint_Details ORDER BY Complaint_ID;

-- ------------------------------------------------------------
-- Query 9 — Database TRIGGER  (Oracle PL/SQL syntax)
-- Business Question: Automatically block any bill insertion
-- where Total_Amount is zero or negative.
-- Oracle: RAISE_APPLICATION_ERROR instead of SIGNAL
-- ------------------------------------------------------------
CREATE OR REPLACE TRIGGER trg_Bill_Amount_Check
BEFORE INSERT ON BILL
FOR EACH ROW
BEGIN
    IF :NEW.Total_Amount <= 0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'ERROR: Bill Total_Amount must be greater than zero.'
        );
    END IF;
END;
/

-- Test trigger (uncomment to confirm it fires — will raise ORA-20001):
-- INSERT INTO BILL VALUES (99, 1, 1, TO_DATE('2025-06-01','YYYY-MM-DD'), 0);

-- ------------------------------------------------------------
-- Query 10 — Stored PROCEDURE  (Oracle PL/SQL syntax)
-- Business Question: Accept a Dept_ID and print the list of
-- complaints for that department with resolution status.
-- Oracle: uses SYS_REFCURSOR for result sets.
-- ------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Department_Complaints (
    p_Dept_ID   IN  NUMBER,
    p_cursor    OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_cursor FOR
        SELECT
            CO.Complaint_ID,
            C.Full_Name         AS Citizen_Name,
            CO.Description,
            CO.Resolution_Status
        FROM COMPLAINT CO
        INNER JOIN CITIZEN C ON CO.Citizen_ID = C.Citizen_ID
        WHERE CO.Dept_ID = p_Dept_ID
        ORDER BY CO.Complaint_ID;
END;
/

-- Execute the procedure for Department 1 (Water & Sewerage):
-- In Oracle SQL Developer, run as a script or use:
VARIABLE rc REFCURSOR;
EXEC sp_Department_Complaints(1, :rc);
PRINT rc;

-- ============================================================
-- END OF BUSINESS QUERIES SCRIPT
-- ============================================================
