-- ============================================================
-- Smart City Management System (SCMS)
-- Group 08 | BSSE | IIUI-ISB
-- File: Data_Population.sql  (DML - Part 2)
-- RDBMS: Oracle Express Edition
-- Oracle uses TO_DATE('YYYY-MM-DD','YYYY-MM-DD') for dates
-- ============================================================

-- ------------------------------------------------------------
-- 1. CITIZEN  (12 records)
-- ------------------------------------------------------------
INSERT INTO CITIZEN VALUES (1,  'Ali Hassan',      '0300-1111111', 'ali.hassan@email.com');
INSERT INTO CITIZEN VALUES (2,  'Sara Malik',       '0301-2222222', 'sara.malik@email.com');
INSERT INTO CITIZEN VALUES (3,  'Umar Farooq',      '0302-3333333', 'umar.farooq@email.com');
INSERT INTO CITIZEN VALUES (4,  'Ayesha Khan',      '0303-4444444', 'ayesha.khan@email.com');
INSERT INTO CITIZEN VALUES (5,  'Bilal Ahmed',      '0304-5555555', 'bilal.ahmed@email.com');
INSERT INTO CITIZEN VALUES (6,  'Fatima Noor',      '0305-6666666', 'fatima.noor@email.com');
INSERT INTO CITIZEN VALUES (7,  'Hassan Raza',      '0306-7777777', 'hassan.raza@email.com');
INSERT INTO CITIZEN VALUES (8,  'Zainab Siddiqui',  '0307-8888888', 'zainab.sid@email.com');
INSERT INTO CITIZEN VALUES (9,  'Tariq Mehmood',    '0308-9999999', 'tariq.meh@email.com');
INSERT INTO CITIZEN VALUES (10, 'Nadia Iqbal',      '0309-1010101', 'nadia.iqbal@email.com');
INSERT INTO CITIZEN VALUES (11, 'Kamran Shahid',    '0310-1212121', 'kamran.s@email.com');
INSERT INTO CITIZEN VALUES (12, 'Sana Butt',        '0311-1313131', 'sana.butt@email.com');
COMMIT;

-- ------------------------------------------------------------
-- 2. HOUSE  (12 records)
-- ------------------------------------------------------------
INSERT INTO HOUSE VALUES (1,  1,  'House 5, Street 3',   'Zone A');
INSERT INTO HOUSE VALUES (2,  2,  'House 12, Street 7',  'Zone B');
INSERT INTO HOUSE VALUES (3,  3,  'House 9, Street 1',   'Zone A');
INSERT INTO HOUSE VALUES (4,  4,  'House 22, Street 5',  'Zone C');
INSERT INTO HOUSE VALUES (5,  5,  'House 4, Street 9',   'Zone B');
INSERT INTO HOUSE VALUES (6,  6,  'House 7, Street 2',   'Zone D');
INSERT INTO HOUSE VALUES (7,  7,  'House 18, Street 6',  'Zone A');
INSERT INTO HOUSE VALUES (8,  8,  'House 3, Street 8',   'Zone C');
INSERT INTO HOUSE VALUES (9,  9,  'House 11, Street 4',  'Zone B');
INSERT INTO HOUSE VALUES (10, 10, 'House 30, Street 10', 'Zone D');
INSERT INTO HOUSE VALUES (11, 11, 'House 6, Street 12',  'Zone A');
INSERT INTO HOUSE VALUES (12, 12, 'House 14, Street 15', 'Zone C');
COMMIT;

-- ------------------------------------------------------------
-- 3. UTILITY  (5 records)
-- ------------------------------------------------------------
INSERT INTO UTILITY VALUES (1, 'Electricity', 25.50);
INSERT INTO UTILITY VALUES (2, 'Water',        8.75);
INSERT INTO UTILITY VALUES (3, 'Gas',          15.00);
INSERT INTO UTILITY VALUES (4, 'Internet',     50.00);
INSERT INTO UTILITY VALUES (5, 'Sanitation',    5.00);
COMMIT;

-- ------------------------------------------------------------
-- 4. MUNICIPAL_DEPARTMENT  (5 records)
-- ------------------------------------------------------------
INSERT INTO MUNICIPAL_DEPARTMENT VALUES (1, 'Water & Sewerage',   'Block A, City Hall');
INSERT INTO MUNICIPAL_DEPARTMENT VALUES (2, 'Roads & Transport',  'Block B, City Hall');
INSERT INTO MUNICIPAL_DEPARTMENT VALUES (3, 'Parks & Recreation', 'Block C, City Hall');
INSERT INTO MUNICIPAL_DEPARTMENT VALUES (4, 'Electricity Board',  'Block D, City Hall');
INSERT INTO MUNICIPAL_DEPARTMENT VALUES (5, 'Sanitation Dept',    'Block E, City Hall');
COMMIT;

-- ------------------------------------------------------------
-- 5. BILL  (15 records) — Oracle TO_DATE for date literals
-- ------------------------------------------------------------
INSERT INTO BILL VALUES (1,  1,  1, TO_DATE('2025-01-10','YYYY-MM-DD'), 2550.00);
INSERT INTO BILL VALUES (2,  2,  2, TO_DATE('2025-01-12','YYYY-MM-DD'),  875.00);
INSERT INTO BILL VALUES (3,  3,  3, TO_DATE('2025-01-15','YYYY-MM-DD'), 1500.00);
INSERT INTO BILL VALUES (4,  4,  1, TO_DATE('2025-02-10','YYYY-MM-DD'), 3200.00);
INSERT INTO BILL VALUES (5,  5,  2, TO_DATE('2025-02-12','YYYY-MM-DD'),  700.00);
INSERT INTO BILL VALUES (6,  6,  4, TO_DATE('2025-02-18','YYYY-MM-DD'), 5000.00);
INSERT INTO BILL VALUES (7,  7,  1, TO_DATE('2025-03-10','YYYY-MM-DD'), 1800.00);
INSERT INTO BILL VALUES (8,  8,  3, TO_DATE('2025-03-14','YYYY-MM-DD'), 2100.00);
INSERT INTO BILL VALUES (9,  9,  5, TO_DATE('2025-03-20','YYYY-MM-DD'),  500.00);
INSERT INTO BILL VALUES (10, 10, 2, TO_DATE('2025-04-10','YYYY-MM-DD'),  950.00);
INSERT INTO BILL VALUES (11, 11, 1, TO_DATE('2025-04-15','YYYY-MM-DD'), 2200.00);
INSERT INTO BILL VALUES (12, 12, 3, TO_DATE('2025-04-20','YYYY-MM-DD'), 1750.00);
INSERT INTO BILL VALUES (13, 1,  4, TO_DATE('2025-05-01','YYYY-MM-DD'), 4500.00);
INSERT INTO BILL VALUES (14, 2,  5, TO_DATE('2025-05-05','YYYY-MM-DD'),  450.00);
INSERT INTO BILL VALUES (15, 3,  1, TO_DATE('2025-05-10','YYYY-MM-DD'), 2900.00);
COMMIT;

-- ------------------------------------------------------------
-- 6. EMPLOYEE  (10 records)
-- ------------------------------------------------------------
INSERT INTO EMPLOYEE VALUES (1,  3,  1, 'Umar Farooq',    'Water Inspector');
INSERT INTO EMPLOYEE VALUES (2,  4,  2, 'Ayesha Khan',     'Road Supervisor');
INSERT INTO EMPLOYEE VALUES (3,  5,  3, 'Bilal Ahmed',     'Park Manager');
INSERT INTO EMPLOYEE VALUES (4,  6,  4, 'Fatima Noor',     'Electrical Engineer');
INSERT INTO EMPLOYEE VALUES (5,  7,  5, 'Hassan Raza',     'Sanitation Officer');
INSERT INTO EMPLOYEE VALUES (6,  8,  1, 'Zainab Siddiqui', 'Field Technician');
INSERT INTO EMPLOYEE VALUES (7,  9,  2, 'Tariq Mehmood',   'Traffic Analyst');
INSERT INTO EMPLOYEE VALUES (8,  10, 3, 'Nadia Iqbal',     'Event Coordinator');
INSERT INTO EMPLOYEE VALUES (9,  11, 4, 'Kamran Shahid',   'Grid Operator');
INSERT INTO EMPLOYEE VALUES (10, 12, 5, 'Sana Butt',       'Waste Manager');
COMMIT;

-- ------------------------------------------------------------
-- 7. COMPLAINT  (12 records)
-- ------------------------------------------------------------
INSERT INTO COMPLAINT VALUES (1,  1,  1, 'Water supply interrupted for 3 days.',         'Resolved');
INSERT INTO COMPLAINT VALUES (2,  2,  2, 'Large pothole on main road near school.',       'In Progress');
INSERT INTO COMPLAINT VALUES (3,  3,  3, 'Park lights not working for a week.',           'Pending');
INSERT INTO COMPLAINT VALUES (4,  4,  4, 'Frequent power outages in Zone C.',             'In Progress');
INSERT INTO COMPLAINT VALUES (5,  5,  5, 'Garbage not collected for 5 days.',             'Resolved');
INSERT INTO COMPLAINT VALUES (6,  6,  1, 'Sewage overflow on Street 2.',                  'Pending');
INSERT INTO COMPLAINT VALUES (7,  7,  2, 'Traffic signal malfunctioning at main chowk.',  'In Progress');
INSERT INTO COMPLAINT VALUES (8,  8,  4, 'Electric pole leaning dangerously.',            'Resolved');
INSERT INTO COMPLAINT VALUES (9,  9,  5, 'Open manhole near residential area.',           'Pending');
INSERT INTO COMPLAINT VALUES (10, 10, 3, 'Illegal dumping in city park.',                 'In Progress');
INSERT INTO COMPLAINT VALUES (11, 11, 1, 'Low water pressure in Zone A.',                 'Resolved');
INSERT INTO COMPLAINT VALUES (12, 12, 2, 'Road flooded after rain, no drainage.',         'Pending');
COMMIT;

-- ------------------------------------------------------------
-- 8. PUBLIC_EVENT  (10 records)
-- ------------------------------------------------------------
INSERT INTO PUBLIC_EVENT VALUES (1,  'City Clean-Up Drive',       TO_DATE('2025-03-15','YYYY-MM-DD'), 'F-9 Park, Islamabad');
INSERT INTO PUBLIC_EVENT VALUES (2,  'Smart City Tech Expo',      TO_DATE('2025-04-20','YYYY-MM-DD'), 'Jinnah Convention Centre');
INSERT INTO PUBLIC_EVENT VALUES (3,  'Tree Plantation Campaign',  TO_DATE('2025-05-05','YYYY-MM-DD'), 'Margalla Foothills');
INSERT INTO PUBLIC_EVENT VALUES (4,  'Road Safety Awareness Day', TO_DATE('2025-06-01','YYYY-MM-DD'), 'Faisal Avenue');
INSERT INTO PUBLIC_EVENT VALUES (5,  'Water Conservation Fair',   TO_DATE('2025-06-20','YYYY-MM-DD'), 'Shakarparian Park');
INSERT INTO PUBLIC_EVENT VALUES (6,  'Youth Sports Tournament',   TO_DATE('2025-07-10','YYYY-MM-DD'), 'Liaquat Gymnasium');
INSERT INTO PUBLIC_EVENT VALUES (7,  'Public Health Seminar',     TO_DATE('2025-07-25','YYYY-MM-DD'), 'PIMS Auditorium');
INSERT INTO PUBLIC_EVENT VALUES (8,  'Independence Day Parade',   TO_DATE('2025-08-14','YYYY-MM-DD'), 'Parade Ground');
INSERT INTO PUBLIC_EVENT VALUES (9,  'Citizen Feedback Forum',    TO_DATE('2025-09-10','YYYY-MM-DD'), 'Municipal Hall');
INSERT INTO PUBLIC_EVENT VALUES (10, 'Digital Services Launch',   TO_DATE('2025-10-01','YYYY-MM-DD'), 'NUST Auditorium');
COMMIT;

-- ------------------------------------------------------------
-- 9. VENDOR  (10 records)
-- ------------------------------------------------------------
INSERT INTO VENDOR VALUES (1,  'PakConstruct Ltd',    'Construction',      '051-1001001');
INSERT INTO VENDOR VALUES (2,  'GreenScape Co.',      'Landscaping',       '051-2002002');
INSERT INTO VENDOR VALUES (3,  'PowerGrid Solutions', 'Electrical',        '051-3003003');
INSERT INTO VENDOR VALUES (4,  'AquaTech Services',   'Water Supply',      '051-4004004');
INSERT INTO VENDOR VALUES (5,  'CityWaste Mgmt',      'Sanitation',        '051-5005005');
INSERT INTO VENDOR VALUES (6,  'RoadMend Pvt Ltd',    'Road Maintenance',  '051-6006006');
INSERT INTO VENDOR VALUES (7,  'TechInfra Systems',   'IT Infrastructure', '051-7007007');
INSERT INTO VENDOR VALUES (8,  'SafeGuard Security',  'Security Services', '051-8008008');
INSERT INTO VENDOR VALUES (9,  'UrbanLight Co.',      'Street Lighting',   '051-9009009');
INSERT INTO VENDOR VALUES (10, 'EcoSmart Pvt Ltd',    'Environmental',     '051-1010101');
COMMIT;

-- ------------------------------------------------------------
-- 10. CONTRACT  (12 records)
-- ------------------------------------------------------------
INSERT INTO CONTRACT VALUES (1,  1, 4,  TO_DATE('2024-01-01','YYYY-MM-DD'), TO_DATE('2025-12-31','YYYY-MM-DD'));
INSERT INTO CONTRACT VALUES (2,  2, 6,  TO_DATE('2024-03-01','YYYY-MM-DD'), TO_DATE('2025-02-28','YYYY-MM-DD'));
INSERT INTO CONTRACT VALUES (3,  3, 2,  TO_DATE('2024-04-15','YYYY-MM-DD'), TO_DATE('2026-04-14','YYYY-MM-DD'));
INSERT INTO CONTRACT VALUES (4,  4, 3,  TO_DATE('2024-06-01','YYYY-MM-DD'), TO_DATE('2025-05-31','YYYY-MM-DD'));
INSERT INTO CONTRACT VALUES (5,  5, 5,  TO_DATE('2024-07-01','YYYY-MM-DD'), TO_DATE('2025-06-30','YYYY-MM-DD'));
INSERT INTO CONTRACT VALUES (6,  1, 7,  TO_DATE('2024-08-01','YYYY-MM-DD'), TO_DATE('2026-07-31','YYYY-MM-DD'));
INSERT INTO CONTRACT VALUES (7,  2, 1,  TO_DATE('2024-09-01','YYYY-MM-DD'), TO_DATE('2025-08-31','YYYY-MM-DD'));
INSERT INTO CONTRACT VALUES (8,  3, 8,  TO_DATE('2024-10-01','YYYY-MM-DD'), TO_DATE('2025-09-30','YYYY-MM-DD'));
INSERT INTO CONTRACT VALUES (9,  4, 9,  TO_DATE('2024-11-01','YYYY-MM-DD'), TO_DATE('2026-10-31','YYYY-MM-DD'));
INSERT INTO CONTRACT VALUES (10, 5, 10, TO_DATE('2024-12-01','YYYY-MM-DD'), TO_DATE('2025-11-30','YYYY-MM-DD'));
INSERT INTO CONTRACT VALUES (11, 1, 1,  TO_DATE('2025-01-15','YYYY-MM-DD'), TO_DATE('2026-01-14','YYYY-MM-DD'));
INSERT INTO CONTRACT VALUES (12, 2, 3,  TO_DATE('2025-02-01','YYYY-MM-DD'), TO_DATE('2026-01-31','YYYY-MM-DD'));
COMMIT;

-- ------------------------------------------------------------
-- 11. EVENT_ATTENDANCE  (15 records)
-- ------------------------------------------------------------
INSERT INTO EVENT_ATTENDANCE VALUES (1,  1,  1, TO_DATE('2025-03-10','YYYY-MM-DD'), 'Free');
INSERT INTO EVENT_ATTENDANCE VALUES (2,  2,  1, TO_DATE('2025-03-11','YYYY-MM-DD'), 'Free');
INSERT INTO EVENT_ATTENDANCE VALUES (3,  3,  2, TO_DATE('2025-04-15','YYYY-MM-DD'), 'Paid');
INSERT INTO EVENT_ATTENDANCE VALUES (4,  4,  2, TO_DATE('2025-04-16','YYYY-MM-DD'), 'VIP');
INSERT INTO EVENT_ATTENDANCE VALUES (5,  5,  3, TO_DATE('2025-05-01','YYYY-MM-DD'), 'Free');
INSERT INTO EVENT_ATTENDANCE VALUES (6,  6,  4, TO_DATE('2025-05-28','YYYY-MM-DD'), 'Free');
INSERT INTO EVENT_ATTENDANCE VALUES (7,  7,  5, TO_DATE('2025-06-18','YYYY-MM-DD'), 'Paid');
INSERT INTO EVENT_ATTENDANCE VALUES (8,  8,  6, TO_DATE('2025-07-05','YYYY-MM-DD'), 'Free');
INSERT INTO EVENT_ATTENDANCE VALUES (9,  9,  7, TO_DATE('2025-07-20','YYYY-MM-DD'), 'Paid');
INSERT INTO EVENT_ATTENDANCE VALUES (10, 10, 8, TO_DATE('2025-08-10','YYYY-MM-DD'), 'Free');
INSERT INTO EVENT_ATTENDANCE VALUES (11, 11, 9, TO_DATE('2025-09-05','YYYY-MM-DD'), 'Free');
INSERT INTO EVENT_ATTENDANCE VALUES (12, 12, 10,TO_DATE('2025-09-28','YYYY-MM-DD'), 'VIP');
INSERT INTO EVENT_ATTENDANCE VALUES (13, 1,  5, TO_DATE('2025-06-15','YYYY-MM-DD'), 'Free');
INSERT INTO EVENT_ATTENDANCE VALUES (14, 2,  8, TO_DATE('2025-08-12','YYYY-MM-DD'), 'Paid');
INSERT INTO EVENT_ATTENDANCE VALUES (15, 3,  9, TO_DATE('2025-09-08','YYYY-MM-DD'), 'Free');
COMMIT;

-- ============================================================
-- END OF DML SCRIPT
-- ============================================================
