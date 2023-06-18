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
    
    -- Table: Dentist
CREATE TABLE Dentist (

    Dentistid int  PRIMARY KEY,
    DName varchar(20),
    DSurname varchar(20),
    DSex varchar(10));
   -- FOREIGN KEY (Surgery_Surgeryid)REFERENCES Surgery (Surgeryid));
 
  
-- Table: Surgery
CREATE TABLE Surgery (
    Surgeryid int  PRIMARY KEY,
    SName varchar(25),
    SCost int ,
    Patient_Patientid int,
    Dentist_dentistid int,
    SDuration int  ,
    FOREIGN KEY (Patient_Patientid) REFERENCES Patient (Patientid),
    FOREIGN KEY (Dentist_dentistid)REFERENCES Dentist (Dentistid)
);


    

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
(1,'Nick','JOHNSON','MALE');
INSERT INTO Dentist values
(2,'Samantha','CHESHIRE','FEMALE');
INSERT INTO Dentist values
(3,'Tony','GRAHAM','MALE');
INSERT INTO Dentist values
(4,'Katherine','MURPHY','FEMALE');
INSERT INTO Dentist values
(5,'Zoe','BLACKBURN','FEMALE');
INSERT INTO Dentist values
(6,'Adam','THOMPSON','MALE');


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
(4,'PER ODONT CS',1700);
INSERT INTO Service values
(5,'ORAL AND MAXILLOFACIAL',3000);








INSERT INTO Surgery values
(1,'root canal',150,2,1,30);
INSERT INTO Surgery values
(2,'dental implants',1500,4,3,120);
INSERT INTO Surgery values
(3,'wisdom tooth extraction',200,1,5,95);
INSERT INTO Surgery values
(4,'reconstructive',1000,3,4,60);
INSERT INTO Surgery values
(5,'cosmetic',2500,5,2,90);
INSERT INTO Surgery values
(6,'extraction',350,2,1,85);
INSERT INTO Surgery values
(7,'dentures',400,4,6,40);
INSERT INTO Surgery values
(8,'bridge',150,1,6,45);
INSERT INTO Surgery values
(9,'veneers',200,3,1,50);
INSERT INTO Surgery values
(10,'crown',170,5,3,60);


    
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



select * from surgery;
select * from Surgery_Service;
select * from Surgery_Employee;
select * from service;
select* from Patient;
select * from employee;
select * from item;
select * from Dentist;







/*
select * from surgery;
select * from Surgery_Service;
select * from Surgery_Employee;
select * from service;
select* from Patient;
select * from employee;
select * from item;
select * from Dentist;*/



--queries--

--find dentist name whom include a 
select pname from patient
where pname LIKE '%a%';


--Show all data about people working in surgery that 'root canal'
select DName,Dsurname,dsex,dentistid, SName
from Dentist d ,Surgery s
where d.Surgery_Surgeryid = s.surgeryid and sname = 'root canal';

--Find patient had more then 1 surgery
select patient_patientid, count(surgeryid)
from surgery 
having count(surgeryid)>1
group by patient_patientid;

--For each Surgery in each patient show maximal surgery cost 
select SName,max(SCost),Patient_Patientid
from Surgery
group by SName,Patient_Patientid
order by Patient_Patientid desc;

                 
 -- find surgery which cost more then the average cost            
 select SName,scost
from Surgery s
where SCost > (select avg(SCost)
             from Surgery);   
             
             
             
           
 /*select SName,scost
from Surgery s
where SCost > (select avg(SCost)
             from Surgery
             where patient_patientid =s.patient_patientid);*/


--Using operator ANY choose service earning more then  in service 2                       
select SerName,Serviceid,price
from Service
where price> any (select price
                from Service
                where Serviceid =2);
 
            
 
 --Choose people earning more then  whom surgeryid= 3.
 select EName,ESalary
from Employee
where ESalary> all (select ESalary
                from Employee e , surgery_employee se
                where e.empid=se.employee_empid and surgeryempid =3); 
                
                
 
 --Find the employee with the lowest average salary
select Empid
from Employee
group by Empid
having avg(ESalary)=(select min(avg(ESalary))
                 from Employee
                 group by Empid);              
                 
                 
 --Find all items which is not used .                               

select itemid
from item
where not exists (select surgeryitemid
                  from surgery_item s
                  where s.item_itemid=item.itemid ) ;
   

select itemid
from item
minus
select item_itemid
from surgery_item;

                          
 select  name,itemid
 from item 
 where itemid not in (select item_itemid
                      from surgery_item);


--Find the average salary ( monthly), and average yearly income for each employee
select avg(ESalary),avg((12*ESalary+nvl(EComm,0))) as avgannsal,empid
from Employee
group by empid;

--for each dentist show how many patient they have 
select dentistid, count(patient_patientid)
from surgery s,dentist d
where d.surgery_surgeryid = s.surgeryid
group by dentistid;



/*
SELECT COUNT(patient_patientid)
from surgery

select dentistid 
from dentist,surgery
where dentist.surgery_surgeryid=surgery.surgeryid
having dentistid =(SELECT COUNT(patient_patientid)
from surgery
group by patient_patientid)
group by dentistid;*/

------
/*select Dname,dentistid
from dentist d ,surgery s
where d.surgery_surgeryid = s.surgeryid 
having count(surgeryid) = (select count(patient_patientid)
from surgery
--where d.surgery_surgeryid = s.surgeryid
group by surgeryid)
group by surgery_surgeryid;*/


/*SELECT dname
FROM dentist d , surgery s
WHERE d.surgery_surgeryid = s.surgeryid
HAVING COUNT (patient_patientid) = (  SELECT  (COUNT (patient_patientid))
                                    FROM dentist d1 , surgery s1
                                   WHERE d1.surgery_surgeryid = s1.surgeryid
                                GROUP BY surgeryid)
GROUP BY dname;*/







--triggers

-- count number of dentist and show names 

CREATE OR REPLACE TRIGGER NumberOfDentist
AFTER INSERT OR UPDATE OR DELETE ON DENTIST
DECLARE
person number;
nodent exception;
CURSOR dentCursor
IS
SELECT DNAME,DSURNAME FROM dentist;
firstName DENTIST.DNAME%TYPE;
lastName DENTIST.DSURNAME%TYPE;
BEGIN
select count(dentistid)into person from dentist;
if person = 0 then raise nodent;
else
OPEN dentCursor;
LOOP
FETCH dentCursor INTO firstName,lastName;
EXIT
WHEN dentCursor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('First Name - Last Name = '||INITCAP(firstName)||RPAD(' ',2,' ')||INITCAP(lastName));
END LOOP;
--close dentCursor;
end if;
exception when nodent then DBMS_OUTPUT.PUT_LINE('THERE IS CURRENTLY NO DENTIST IN THE HOSPITAL DATABASE');
END;

INSERT INTO DENTIST VALUES(7,'JONY','JSON','MALE',3);
DELETE FROM DENTIST WHERE DENTISTID=7;


--show surgery cost
-- EMP SURGERY / DEPT PATIENT 
DROP TRIGGER COST_OF_SUR;
SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER COST_OF_SUR
AFTER INSERT OR UPDATE ON SURGERY
DECLARE
NAMEP Varchar2(10); IDPATIENT INT; SURCOST INT;
NOCOST EXCEPTION;
CURSOR Cur_PAT IS SELECT PATIENTID, PNAME FROM PATIENT;
BEGIN
SELECT (SUM(NVL(SCOST), 0)) INTO SURCOST
FROM SURGERY WHERE PATIENT_PATIENTID = IDPATIENT;
IF SURCOST=0 THEN RAISE EXCEPTION NOCOST;
ELSE
OPEN Cur_PAT;
LOOP
FETCH Cur_PAT INTO IDPATIENT, NAMEP;
EXIT WHEN Cur_PAT%NOTFOUND;
SELECT NVL(SUM(SCOST), 0) INTO SURCOST
FROM SURGERY WHERE PATIENT_PATIENTID = IDPATIENT;
dbms_output.put_line('COST_of_SURGERY' || NAMEP

|| ' is ' || SURsal);
SURCOST := 0;
END LOOP;
CLOSE Cur_PAT;
END;






-- decrease price
drop trigger DECSERPRICE;
 CREATE OR REPLACE TRIGGER DECSERPRICE 
AFTER  INSERT ON SERVICE

DECLARE IDSERVICE INT;
DECLARE NAMESER VARCHAR(30);
DECLARE NUMBEROFSERVICES INT;
DECLARE MAXSER EXCEPTION; 
 declare CURSOR SERCURSOR IS SELECT SERVICEID FROM SERVICE WHERE PRICE =(SELECT MIN(PRICE) FROM SERVICE);
BEGIN
SELECT NUMBEROFSERVICES = COUNT(SERVICEID) FROM SERVICE;
IF NUMBEROFSERVICES>2 THEN RAISE MAXSER ;

OPEN SERCURSOR;
BEGIN
FETCH SERCURSOR INTO IDSERVICE;
SELECT NAMESER = SERNAME FROM SERVICE;
IF NAMESER = 'PROSTHODONTICS'
UPDATE SERVICE 
SET PRICE=PRICE-50
WHERE NAMESER ='PROSTHODONTICS';
END
CLOSE SERCURSOR;

exception when MAXSUR then DBMS_OUTPUT.PUT_LINE('THERE IS MAX NUMBER OF SERVICE');
END;

INSERT INTO Service values
(6,'PROSTHODONTICS',2500);







--Procedure

--Create procedure NOcomm showing on the screen names of people who do not have specified commision
drop procedure nocomm;
CREATE OR REPLACE PROCEDURE NOcomm
AS

PersonID number;
PersonNAME varchar2(10);

CURSOR NOCOMM IS
SELECT EMPid
FROM EMPLOYEE
WHERE ECOMM IS NULL;

BEGIN
OPEN NOCOMM;
LOOP
FETCH NOCOMM INTO PersonID;
EXIT WHEN NOCOMM%NOTFOUND;

SELECT ENAME INTO PersonNAME
FROM EMPLOYEE
WHERE EMPID = PersonID;

dbms_output.put_line(PersonNAME || ' with ID ' || PersonID);

END LOOP;
CLOSE NOCOMM;
END;



--Create procedure that  changing surgery for all root canal to „bridge”
-- ROOT CANAL BRIDGE 

drop procedure RcToBrd;
create procedure RcToBrd
as
noRootcanal exception;
IDSURGERY number;
countRootcanal number;
cursor RC is select SURGERYID from SURGERY where SNAME='root canal';
begin
select count(SURGERYID) into countRootcanal from SURGERY where SNAME='root canal';
if countRootcanal=0 then raise noRootcanal;
else open RC;
loop
fetch RC into IDSURGERY;
exit when RC%NOTFOUND;
update SURGERY
set SNAME = 'bridge'
where SURGERYID = IDSURGERY;
end loop;
close RC;
end if;
exception when noRootcanal then dbms_output.put_line('No Root Canal found');
end;

execute RcToBrd;

select * from SURGERY;


--
drop procedure RAISESAL;
CREATE OR REPLACE PROCEDURE RAISESAL
AS
NOENDODONTICORTHODONTIC EXCEPTION;
X NUMBER;
IDP NUMBER;
CURSOR serid IS
SELECT serviceid
FROM service
WHERE sername IN('ENDODONTIC','ORTHODONTIC');
BEGIN

SELECT COUNT(serviceid) INTO X
FROM service
WHERE sername IN('ENDODONTIC','ORTHODONTIC');
IF X = 0 THEN RAISE NOENDODONTICORTHODONTIC;
ELSE
OPEN serid;
LOOP
FETCH serid INTO IDP;
EXIT WHEN serid%NOTFOUND;

UPDATE service SET price = price*1.1
WHERE serviceid = IDP AND sername = 'ENDODONTIC';

UPDATE service SET price = price*1.2
WHERE serviceid = IDP AND sername = 'ORTHODONTIC';

END LOOP;
CLOSE serid;
END IF;
EXCEPTION WHEN NOENDODONTICORTHODONTIC THEN
DBMS_OUTPUT.PUT_LINE('NOBODY WORKS AS NOENDODONTIC or ORTHODONTIC');
END;




desc dentist;































































