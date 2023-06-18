drop table dentist;
drop table Item;
drop table Employee;
drop table Surgery;
drop table Service;
drop table Patient;
drop table Surgery_item;
drop table surgery_service;
drop table Surgery_Employee;

   
   
-- Table: Item
CREATE TABLE Item (
    Itemid int PRIMARY KEY,
    IName varchar(25) );
    
-- Table: Employee
CREATE TABLE Employee (
    Empid int PRIMARY KEY,
    EName varchar(20),
    ESurname varchar(20),
    ESalary int,
    EComm int);
    
-- Table: Patient
CREATE TABLE Patient (
    Patientid int  PRIMARY KEY,
    PName varchar(20),
    PSurname varchar(20),
    PSex varchar(10),
    Pphone int);    
    
-- Table: Service
CREATE TABLE Service (
    Serviceid int PRIMARY KEY,
    SerName varchar(25),
    price int);
 
  
-- Table: Surgery
CREATE TABLE Surgery (
    Surgeryid int  PRIMARY KEY,
    SName varchar(25),
    SCost int ,
    Patient_Patientid int,
    SDuration int  ,
    FOREIGN KEY (Patient_Patientid) REFERENCES Patient (Patientid)
);

-- Table: Dentist
CREATE TABLE Dentist (

    Dentistid int  PRIMARY KEY,
    DName varchar(20),
    DSurname varchar(20),
    DSex varchar(10),
    Surgery_Surgeryid int,
    FOREIGN KEY (Surgery_Surgeryid)REFERENCES Surgery (Surgeryid));
    

-- Table: Surgery_item
CREATE TABLE Surgery_item (
    Surgeryitemid int  PRIMARY KEY,
    Item_Itemid   int,
    Surgery_Surgeryid  int,
    FOREIGN KEY (Surgery_Surgeryid) REFERENCES Surgery (Surgeryid),
    FOREIGN KEY (Item_Itemid) REFERENCES item (itemid));
    
    
    
-- Table: Surgery_Employee
CREATE TABLE Surgery_Employee (
    SurgeryEmpid int  PRIMARY KEY,
    Employee_Empid   int,
    Surgery_Surgeryid   int,
    FOREIGN KEY (Employee_Empid) REFERENCES Employee (Empid),
    FOREIGN KEY (Surgery_Surgeryid) REFERENCES Surgery (Surgeryid));
    
    
    
    
-- Table: Surgery_Service
CREATE TABLE Surgery_Service (
    SurgeryServiceid int  PRIMARY KEY,
    Surgery_Surgeryid  int,
    Service_Serviceid  int,
   FOREIGN KEY (Surgery_Surgeryid) REFERENCES Surgery (Surgeryid),
    FOREIGN KEY (Service_Serviceid) REFERENCES Service (Serviceid)
);    
    
    
INSERT INTO  Dentist values
(1,'Nick','JOHNSON','MALE',1);
INSERT INTO Dentist values
(2,'Samantha','CHESHIRE','FEMALE',1);
INSERT INTO Dentist values
(3,'Tony','GRAHAM','MALE',2);
INSERT INTO Dentist values
(4,'Katherine','MURPHY','FEMALE',2);
INSERT INTO Dentist values
(5,'Zoe','BLACKBURN','FEMALE',3);
INSERT INTO Dentist values
(6,'Adam','THOMPSON','MALE',3);


/* ALTER TABLE Item 
    MODIFY (IName VARCHAR2(25)) ;*/ 
   
INSERT INTO Item values
(1,'mouth mirror');
INSERT INTO Item values
(2,'polishing paste');
INSERT INTO Item values
(3,'low speed handpiece');
INSERT INTO Item values
(4,'high speed handpiece');
INSERT INTO Item values
(5,'sonic scaler');
INSERT INTO Item values
(6,'cotton pliers');
INSERT INTO Item values
(7,'towner scaler');
INSERT INTO Item values
(8,'gracey curette');
INSERT INTO Item values
(9,'curved sicle scaler');
INSERT INTO Item values
(10,'curette');
INSERT INTO Item values
(11,'gauze');
INSERT INTO Item values
(12,'root elevators');
INSERT INTO Item values
(13,'extraction forceps');
INSERT INTO Item values
(14,'extraction forcep');


    
INSERT INTO Employee values
(1,'Daniel','THOM',5000,NULL);
INSERT INTO Employee values
(2,'Tina','JACKSON',3000,100);
INSERT INTO Employee values
(3,'Christian','SMITH',6700,250);
INSERT INTO Employee values
(4,'Julia','HARRIS',5500,NULL);
INSERT INTO Employee values
(5,'Thomas','BLACK',3500,150);
INSERT INTO Employee values
(6,'Marie','HARRY',2500,200);


    

INSERT INTO Patient values
(1,'Alex','JONES','MALE',254568);
INSERT INTO Patient values
(2,'Lucy','HARDING','FEMALE',254569);
INSERT INTO Patient values
(3,'Ben','EVANS','MALE',254570);
INSERT INTO Patient values
(4,'Karen','TYSAN','FEMALE',254571);
INSERT INTO Patient values
(5,'Bill','Hoffman','MALE',254572);


/*ALTER TABLE Service 
    MODIFY (SerName VARCHAR2(25)) ; */
    
INSERT INTO Service values
(1,'ENDODONTIC',1000);
INSERT INTO Service values
(2,'PROSTHODONTICS',2500);
INSERT INTO Service values
(3,'ORTHODONTIC',2000);
INSERT INTO Service values
(4,'PER�ODONT�CS',1700);
INSERT INTO Service values
(5,'ORAL AND MAXILLOFACIAL',3000);








INSERT INTO Surgery values
(1,'root canal',150,2,30);
INSERT INTO Surgery values
(2,'dental implants',1500,4,120);
INSERT INTO Surgery values
(3,'wisdom tooth extraction',200,1,95);
INSERT INTO Surgery values
(4,'reconstructive',1000,3,60);
INSERT INTO Surgery values
(5,'cosmetic',2500,5,90);
INSERT INTO Surgery values
(6,'extraction',350,2,85);
INSERT INTO Surgery values
(7,'dentures',400,4,40);
INSERT INTO Surgery values
(8,'bridge',150,1,45);
INSERT INTO Surgery values
(9,'veneers',200,3,50);
INSERT INTO Surgery values
(10,'crown',170,5,60);


    
INSERT INTO Surgery_item values 
(1,11,7);
INSERT INTO Surgery_item values 
(2,8,5);
INSERT INTO Surgery_item values 
(3,4,2);
INSERT INTO Surgery_item values 
(4,9,8);
INSERT INTO Surgery_item values 
(5,12,10);
INSERT INTO Surgery_item values 
(6,1,9);
INSERT INTO Surgery_item values 
(7,5,1);
INSERT INTO Surgery_item values 
(8,7,3);
INSERT INTO Surgery_item values 
(9,3,4);
INSERT INTO Surgery_item values 
(10,13,6);
 

    

INSERT INTO Surgery_Employee values
(1,3,6);
INSERT INTO Surgery_Employee values
(2,1,9);
INSERT INTO Surgery_Employee values
(3,4,3);
INSERT INTO Surgery_Employee values
(4,6,2);
INSERT INTO Surgery_Employee values
(5,2,1);
INSERT INTO Surgery_Employee values
(6,5,8);





INSERT INTO Surgery_Service values
(1,4,3);
INSERT INTO Surgery_Service values
(2,2,5);
INSERT INTO Surgery_Service values
(3,10,2);
INSERT INTO Surgery_Service values
(4,7,4);
INSERT INTO Surgery_Service values
(5,6,1);
INSERT INTO Surgery_Service values
(6,1,3);
/*
select * from surgery;
select * from Surgery_Service;
select * from Surgery_Employee;
select * from service;
select* from Patient;
select * from employee;
select * from item;
select * from Dentist;*/



--SET SERVEROUTPUT ON
--TRIGGER

--INSERT TRIGGER WHICH DOESN'T ALLOW TO ADD NEW AN EMPLOYEE ABOVE 2500 SALARY 
GO 
CREATE TRIGGER MIN_SAL ON EMPLOYEE FOR INSERT
AS
IF EXISTS (SELECT 1 FROM INSERTED WHERE ESalary<2500)-- count how many person below 2500
BEGIN
DECLARE E_CURSOR CURSOR FOR SELECT EMPID FROM INSERTED WHERE ESalary<2500;
DECLARE @EMPID INT;
OPEN E_CURSOR
FETCH NEXT FROM E_CURSOR INTO @EMPID;
WHILE @@FETCH_STATUS=0
BEGIN 
DELETE FROM EMPLOYEE WHERE EMPID=@EMPID;
FETCH NEXT FROM E_CURSOR INTO @EMPID;
END;
CLOSE E_CURSOR;
DEALLOCATE E_CURSORS
END;

INSERT INTO EMPLOYEE VALUES(8,'MarY','HAR',2400,200);
SELECT*FROM EMPLOYEE;

-- CHECK ITEM
GO
CREATE TRIGGER ITEMNAM
ON ITEM
FOR INSERT 
AS
DECLARE 
ITEMCURSOR CURSOR FOR SELECT ITEMID FROM ITEM ;
DECLARE @IDITEM INT;
DECLARE @NEWITEM VARCHAR(25);
DECLARE @ITEMNAME VARCHAR(25);
DECLARE @NUMOFITEM INT;
BEGIN 
SELECT @NUMOFITEM =COUNT(ITEMID) FROM ITEM ;
IF @NUMOFITEM> 3
BEGIN 
RAISERROR ('NOT ENOUGH ROOM FOR THE STUFF',16,1);
END;
OPEN ITEMCURSOR ;
FETCH ITEMCURSOR INTO @IDITEM;
SELECT @ITEMNAME =INAME FROM ITEM WHERE ITEMID=@IDITEM;
SELECT @NEWITEM = INAME FROM INSERTED;
IF @ITEMNAME = @NEWITEM PRINT('THE SAME ITEM ALREADY EXISTS'+ ISNULL(@ITEMNAME,'NULL'));
CLOSE ITEMCURSOR;
DEALLOCATE ITEMCURSOR;
END;

INSERT INTO Item values
(15,'extraction forcep1');


--DECREASE PRICE BY 50 FOR SERVICES TO NAME '' AFTER EVERY NEW SERVICE 

GO
CREATE TRIGGER DECSERPRICE ON SERVICE
FOR INSERT
AS
DECLARE @IDSERVICE INT;
DECLARE @NAMESER VARCHAR(30);
DECLARE @NUMBEROFSERVICES INT;
DECLARE SERCURSOR CURSOR FOR SELECT SERVICEID FROM SERVICE WHERE PRICE =(SELECT MIN(PRICE) FROM SERVICE);
BEGIN
SELECT @NUMBEROFSERVICES = COUNT(SERVICEID) FROM SERVICE;
IF @NUMBEROFSERVICES>2
BEGIN RAISERROR ('MAX NUMBER SERVICES',16,1);
END;
OPEN SERCURSOR;
BEGIN
FETCH SERCURSOR INTO @IDSERVICE;
SELECT @NAMESER = SERNAME FROM SERVICE;
IF @NAMESER = 'PROSTHODONTICS'
UPDATE SERVICE 
SET PRICE=PRICE-50
WHERE @NAMESER ='PROSTHODONTICS';
END
CLOSE SERCURSOR;
DEALLOCATE SERCURSOR;
END;

INSERT INTO Service values
(6,'PROSTHODONTICS',2500);




--PROCEDURE

--CHANGES SALARY 
DROP PROCEDURE SALARYCHANGE;
SELECT * INTO CHANEMP FROM EMPLOYEE;
GO 
CREATE PROCEDURE SALARYCHANGE
@EMP VARCHAR(100),
@PER DECIMAL(10,2),
@CURRSAL DECIMAL(10,2) OUTPUT
AS 
BEGIN
DECLARE E_CURSOR CURSOR FOR SELECT EMPID FROM EMPLOYEE WHERE ENAME LIKE @EMP +'%';
DECLARE @IDEMP INT;
OPEN E_CURSOR
FETCH NEXT FROM E_CURSOR INTO @IDEMP;
WHILE @@FETCH_STATUS=0
BEGIN 
SELECT @CURRSAL=ESALARY*(1+@PER/100) FROM EMPLOYEE WHERE EMPID=@IDEMP;
UPDATE CHANEMP SET ESALARY = @CURRSAL WHERE EMPID=@IDEMP;
FETCH NEXT FROM E_CURSOR INTO @IDEMP;
END;
CLOSE E_CURSOR;
DEALLOCATE E_CURSOR;
END;

INSERT INTO Employee values
(7,'Marie','HARRY',2500,200);

declare @CURRSAL DECIMAL(10,2) ;

exec SALARYCHANGE'Marie',20,@CURRSAL output; 

--SHOWS NAME AND DURATION OF SURGERY 
GO
CREATE PROCEDURE GETDURATION
@TIME INT
AS 
BEGIN
DECLARE S_CURSOR CURSOR FOR SELECT SURGERYID FROM SURGERY WHERE SDuration LIKE+@TIME;
DECLARE @SURID INT;
OPEN S_CURSOR 
FETCH NEXT FROM S_CURSOR INTO @SURID;
WHILE @@FETCH_STATUS=0
BEGIN 
SELECT SNAME,SDURATION FROM SURGERY WHERE Surgeryid=@SURID;
FETCH NEXT FROM S_CURSOR INTO @SURID;
END
CLOSE S_CURSOR;
DEALLOCATE E_CURSOR;
END;

--GIVES THE MAXIMUM NUMBER OF PATIENT

GO 
CREATE PROCEDURE MAXPATIENTS
AS
BEGIN
DECLARE P_CURSOR CURSOR FOR SELECT PATIENTID FROM PATIENT;
DECLARE @PID INT;
DECLARE @NPATIENTS INT;
DECLARE @MAXPATIENTS INT=0;
OPEN P_CURSOR
FETCH NEXT FROM P_CURSOR INTO @PID;
WHILE @@FETCH_STATUS=0
BEGIN 
SELECT @NPATIENTS=COUNT(PATIENTID) FROM PATIENT WHERE PATIENTID= @PID;
IF(@NPATIENTS>@MAXPATIENTS)
SELECT @MAXPATIENTS = COUNT(PATIENTID) FROM PATIENT WHERE PATIENTID=@PID;
FETCH NEXT FROM P_CURSOR INTO @PID;
END;
CLOSE P_CURSOR;
DEALLOCATE P_CURSOR;
RETURN @MAXPATIENTS;
END;

DECLARE @MAXIMUM INT;
EXEC @MAXIMUM=MAXPATIENTS;
PRINT @MAXIMUM;