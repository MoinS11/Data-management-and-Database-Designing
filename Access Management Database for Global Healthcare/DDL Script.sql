CREATE DATABASE Healthcare_Management


USE Healthcare_Management
GO

CREATE TABLE Insurance(
	Insurance_ID int NOT NULL,
	Provider_Name varchar(55) NOT NULL,
	Insurance_Type varchar(55),

	CONSTRAINT Insurance_PK PRIMARY KEY (Insurance_ID)
)

CREATE TABLE Patient(
	Patient_ID int NOT NULL,
	Patient_Name varchar(30) NOT NULL,
	Date_Of_Birth Date NOT NULL,
	Phone_Number nvarchar(15) NOT NULL,
	Email_ID nvarchar(50) NOT NULL,
	Insurance_ID int NOT NULL,
	Insurance_Exp_Date DATE,

	/*Patient Address*/
	Street nvarchar(100) NOT NULL,
	City varchar(100) NOT NULL,
	[State] varchar(100) NOT NULL,
	Zip_code nvarchar(50) NOT NULL,
	Country nvarchar(50) NOT NULL,

	/*Place of Birth*/
	Country_of_Origin varchar(100) NOT NULL,

	/*Emergency Information*/
	Emergency_Contact_Name varchar(100) NOT NULL,
	Emergency_Contact_Number nvarchar(20) NOT NULL,

	/*Table Check Constraint for Gender*/
	Gender varchar(10)
		CONSTRAINT Gender_Chk CHECK (Gender IN ('Male','Female','Non-Binary')) 
	
	CONSTRAINT Patient_PK PRIMARY KEY (Patient_ID)
	CONSTRAINT Patient_FK FOREIGN KEY (Insurance_ID)
			references Insurance(Insurance_ID),
	
)	
		

CREATE TABLE Doctor(
	Doctor_ID int NOT NULL,
	Doctor_Name varchar(55) NOT NULL,
	Date_Of_Birth Date NOT NULL,
	Phone_Number nvarchar(15) NOT NULL,
	Email_ID nvarchar(50) NOT NULL,
	Gender varchar(10) 
		CONSTRAINT Doctor_Gender_Chk CHECK (Gender IN ('Male','Female','Non-Binary')) ,
	License_Number nvarchar(20) NOT NULL,
	License_Expiration_Date Date NOT NULL,
	Degree nvarchar(50) NOT NULL
		CONSTRAINT Doctor_PK PRIMARY KEY (Doctor_ID),
	[Status] varchar(20)  NULL
)


CREATE TABLE Healthcare_Facility(
	Facility_ID INT IDENTITY (1,1) NOT NULL,
	Facility_Name nvarchar(100) NOT NULL,
	Facility_Category varchar(30) NOT NULL
		CONSTRAINT Facility_Category_Chk CHECK (Facility_Category IN ('Clinic','Hospital')),	
	City varchar(100) NOT NULL,
	[State] varchar(100) NOT NULL,
	Zip_code nvarchar(50) NOT NULL,
	Country varchar(100) NOT NULL,
		CONSTRAINT Healthcare_Facility_PK PRIMARY KEY (Facility_ID)
)

CREATE TABLE Employment (
	Employment_ID int IDENTITY(1,1) UNIQUE NOT NULL,
	Emp_Start_Date Date NOT NULL,
	Emp_End_Date Date,
	Facility_ID INT NOT NULL,
	Doctor_ID INT NOT NULL,
		
		CONSTRAINT Employment_PK PRIMARY KEY (Employment_ID),
		CONSTRAINT Employment_FK1 FOREIGN KEY (Facility_ID) REFERENCES [Healthcare_Facility] (Facility_ID),
		CONSTRAINT Employment_FK2 FOREIGN KEY (Doctor_ID) REFERENCES [Doctor](Doctor_ID)
)


CREATE TABLE Diagnosis (
	Diagnosis_ID int UNIQUE NOT NULL,
	Symptom varchar(150) NOT NULL,
	Treatment varchar(150) NOT NULL,
	Severity varchar(20) 
				CONSTRAINT Severity_Chk CHECK (Severity IN ('High','Mid','Low')),
				CONSTRAINT Diagnosis_PK PRIMARY KEY (Diagnosis_ID)
)


CREATE TABLE Visit (
	Visit_ID INT IDENTITY(1,1) UNIQUE NOT NULL,
	Visit_Date Date NOT NULL,
	Purpose varchar(100) NOT NULL,
	Patient_ID INT NOT NULL,
	Doctor_ID INT NOT NULL,
	Facility_ID INT NOT NULL,
	Diagnosis_ID int NOT NULL,
	
		CONSTRAINT Visit_PK PRIMARY KEY (Visit_ID),
		CONSTRAINT Visit_FK1 FOREIGN KEY (Patient_ID) REFERENCES [Patient] (Patient_ID),
		CONSTRAINT Visit_FK2 FOREIGN KEY (Doctor_ID) REFERENCES [Doctor](Doctor_ID),
		CONSTRAINT Visit_FK3 FOREIGN KEY (Facility_ID)REFERENCES[Healthcare_Facility](Facility_ID),
		CONSTRAINT Visit_FK4 FOREIGN KEY (Diagnosis_ID) REFERENCES Diagnosis(Diagnosis_ID)
)




CREATE TABLE Test(
	Test_ID int IDENTITY (1,1) NOT NULL,
	Test_Name varchar(100) NOT NULL,
	Test_Category varchar(100) NOT NULL
				CONSTRAINT Test_Category_Chk CHECK (Test_Category IN ('Blood Test','X-Ray','Sonography','Covid Test')),
	Test_Provider varchar(100) NOT NULL
		 CONSTRAINT Test_PK PRIMARY KEY (Test_ID),
)

CREATE TABLE Report(
	Report_ID int IDENTITY (1,1) NOT NULL,
	Results nvarchar(120) NOT NULL,
	Report_Date Date NOT NULL,
	Diagnosis_ID INT NOT NULL,
	Test_ID INT NOT NULL,
		  
		  CONSTRAINT Report_PK PRIMARY KEY (Report_ID),
		  CONSTRAINT Report_FK1 FOREIGN KEY (Diagnosis_ID) REFERENCES [Diagnosis](Diagnosis_ID),
		  CONSTRAINT Report_FK2 FOREIGN KEY (Test_ID) REFERENCES [Test](Test_ID),
)

CREATE TABLE Drug(
	Drug_ID INT IDENTITY(1,1) NOT NULL,
	Drug_Name nvarchar(100) NOT NULL,
	Drug_Manufacturer nvarchar(120) NOT NULL,
		   CONSTRAINT Drug_PK PRIMARY KEY (Drug_ID),
)

CREATE TABLE Prescription(
	Prescription_ID int IDENTITY(1,1) NOT NULL,
	Diagnosis_ID INT NOT NULL,
	Drug_ID INT NOT NULL,
		  CONSTRAINT Prescription_PK PRIMARY KEY (Prescription_ID),
		  CONSTRAINT Prescription_FK1 FOREIGN KEY (Diagnosis_ID) REFERENCES [Diagnosis](Diagnosis_ID),
		  CONSTRAINT Prescription_FK2 FOREIGN KEY (Drug_ID) REFERENCES [Drug](Drug_ID),
)

CREATE TABLE [Updated_Diagnosis](
        [Updated_Diagnosis_ID] int NOT NULL Primary Key Identity(1,1),
		[Diagnosis_ID] int NOT NULL,
		[Symptom] varchar(150) NOT NULL,
		[Treatment] varchar(150) NOT NULL,
		[Severity] varchar(20) NULL,
		[Updated_Severity] varchar(20) NULL,
		ChangeDate Datetime NULL
)

--- Triggers----

CREATE trigger doc_License_status on dbo.Doctor
after insert 
as 
declare @Exp_date as date
declare @doc_id as int
declare new_status Cursor for Select doctor.Doctor_ID, doctor.License_Expiration_Date from Doctor
open new_status;
Fetch next from new_status into @doc_id, @Exp_date;
while @@Fetch_Status=0
begin 
	if(@Exp_date)> GETDATE()
	begin
		update doctor set Status='License Active' where doctor.Doctor_ID=@doc_id;
	end
	if(@Exp_date)< GETDATE()
	begin
		update doctor set Status='License Expired' where doctor.Doctor_ID=@doc_id;
	end
	Fetch next from new_status into @doc_id,@Exp_date;
end
Close new_status

Select * 
From Doctor

CREATE TRIGGER Updated_Diag
   ON dbo.Diagnosis
   FOR UPDATE
AS
BEGIN
IF UPDATE(Severity)
BEGIN
INSERT INTO [Updated_Diagnosis](
[Diagnosis_ID],
[Symptom],
[Treatment],
[Severity],
[Updated_Severity],
[ChangeDate])
  SELECT d.Diagnosis_ID
         ,d.Symptom
		 ,d.Treatment
		 ,d.Severity
		 ,i.Severity,
		 GETDATE()
		 FROM DELETED d JOIN INSERTED i on d.Diagnosis_ID = i.Diagnosis_ID
END
END
GO

SELECT * 
FROM dbo.Diagnosis WHERE Diagnosis_ID = 1
UPDATE dbo.Diagnosis set Severity = 'High' WHERE Diagnosis_ID = 1
SELECT * FROM [Updated_Diagnosis]


--View for Patient and Encounter

CREATE VIEW [AllEncounterHistory] 
AS
	select p.Patient_Name, v.Visit_Date, v.Purpose, d.Doctor_Name
	from Patient p 
		JOIN Visit v ON p.Patient_ID = v.Patient_ID
		JOIN Doctor d ON v.Doctor_ID = d.Doctor_ID

select * from [AllEncounterHistory]

-- View for Patient, Test and Test Report

CREATE VIEW [AllTestResults]
AS
select DISTINCT p.Patient_Name, p.Patient_ID, v.Purpose, r.Results, t.Test_Name
from Patient p
	 JOIN Visit v ON p.Patient_ID = v.Patient_ID
	 JOIN Report r ON v.Diagnosis_ID = r.Diagnosis_ID
	 JOIN Test t ON r.Test_ID = t.Test_ID

select * from [AllTestResults]

-- View for Doctor, Doctor Name, Facility and Category

CREATE VIEW [AllDoctorList]
AS
select d.Doctor_ID, d.Doctor_Name, f.Facility_Name, f.Facility_Category
from Doctor d
	JOIN Employment e ON d.Doctor_ID = e.Doctor_ID
	JOIN Healthcare_Facility f ON e.Facility_ID = f.Facility_ID

select * from [AllDoctorList]


--- Functions 


Create function dbo.AGE_Cal (@Date_Of_Birth Date)
returns int
as
begin
	return datediff(year,@Date_Of_Birth,getDate())
end

ALTER TABLE Patient
Drop Column Age;

--- Run after Insert
 Alter table Patient add Age as dbo.Age_cal(Date_Of_Birth) 

select * from Patient;

--- Procedures

CREATE PROCEDURE GetAllPatient_Insurance @PatientName varchar(30)
AS
BEGIN
SELECT p.Patient_Name, i.Provider_Name,i.Insurance_Type,  p.Insurance_Exp_Date
FROM Insurance i
JOIN Patient p
ON i.Insurance_ID = p.Insurance_ID 
WHERE p.Patient_Name = @PatientName
END


EXEC GetAllPatient_Insurance 'John Smith'


CREATE PROCEDURE GetAllPatient_Symptoms @PatientName nvarchar(30)
AS
BEGIN
SELECT p.Patient_Name, d.Symptom, d.Treatment, d.Severity
FROM Visit v
JOIN Patient p 
ON v.Patient_ID = p.Patient_ID
JOIN Diagnosis d
ON v.Diagnosis_ID = d.Diagnosis_ID
WHERE p.Patient_Name = @PatientName
END


EXEC GetAllPatient_Symptoms 'John Smith'


CREATE PROCEDURE GetAllPatient_Facility @PatientName nvarchar(30)
AS
BEGIN
SELECT p.Patient_Name, doc.Doctor_Name, h.Facility_Name, h.Facility_Category
FROM Visit v
JOIN Patient p 
ON v.Patient_ID = p.Patient_ID
    JOIN Diagnosis d
    ON v.Diagnosis_ID = d.Diagnosis_ID
        JOIN Healthcare_Facility h
        ON v.Facility_ID = h.Facility_ID
            JOIN DOCTOR doc
            ON v.Doctor_ID = doc.Doctor_ID
WHERE p.Patient_Name = @PatientName
END

EXEC GetAllPatient_Facility 'John Smith'

--- Non Clustered Indexes

--Index on Report Table on Diagnosis ID
CREATE NONCLUSTERED INDEX index_report
ON [dbo].Report (Diagnosis_ID ASC);


--Index on Doctor Table on License Number
CREATE NONCLUSTERED INDEX index_doctor
ON [dbo].Doctor (License_Number ASC);

--Index on Prescription Table on Drug ID

CREATE NONCLUSTERED INDEX index_drugID
ON [dbo].Prescription (Drug_ID ASC);

--- Encryption 
ALTER TABLE Patient
DROP Column [Password];
ALTER TABLE Patient ADD Username varchar(50), [Password] varbinary(max)
GO


CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'DMDDProject@4';

SELECT name KeyName,
  symmetric_key_id KeyID,
  key_length KeyLength,
  algorithm_desc KeyAlgorithm
FROM sys.symmetric_keys;
go


CREATE CERTIFICATE Patpass  
   WITH SUBJECT = 'Patient Sample Password';  
GO 

CREATE SYMMETRIC KEY PatPass_SM 
    WITH ALGORITHM = AES_256  
    ENCRYPTION BY CERTIFICATE PatPass;  
GO  

OPEN SYMMETRIC KEY PatPass_SM  
   DECRYPTION BY CERTIFICATE PatPass;
   
---- Run After Insert
UPDATE dbo.Patient set 
 [Password] = EncryptByKey(Key_GUID('PatPass_SM'),  convert(varbinary, 'Rick_097')  ) WHERE Patient_ID = 1
GO 

UPDATE dbo.Patient set 
 [Password] = EncryptByKey(Key_GUID('PatPass_SM'),  convert(varbinary, 'Julie_459')  ) WHERE Patient_ID = 2
GO 

UPDATE dbo.Patient set 
 [Password] = EncryptByKey(Key_GUID('PatPass_SM'),  convert(varbinary, 'John_721')  ) WHERE Patient_ID = 3
GO 

UPDATE dbo.Patient set 
 [Password] = EncryptByKey(Key_GUID('PatPass_SM'),  convert(varbinary, 'Justin_197')  ) WHERE Patient_ID = 4 
GO 

UPDATE dbo.Patient set 
 [Password] = EncryptByKey(Key_GUID('PatPass_SM'),  convert(varbinary, 'Peter_468')  ) WHERE Patient_ID = 5 
GO 

UPDATE dbo.Patient set 
 [Password] = EncryptByKey(Key_GUID('PatPass_SM'),  convert(varbinary, 'Rishi_883')  ) WHERE Patient_ID = 6 
GO 

UPDATE dbo.Patient set 
 [Password] = EncryptByKey(Key_GUID('PatPass_SM'),  convert(varbinary, 'Mark_379')  ) WHERE Patient_ID = 7 
GO 

UPDATE dbo.Patient set 
 [Password] = EncryptByKey(Key_GUID('PatPass_SM'),  convert(varbinary, 'Roy_121')  ) WHERE Patient_ID = 8 
GO 

UPDATE dbo.Patient set 
 [Password] = EncryptByKey(Key_GUID('PatPass_SM'),  convert(varbinary, 'Jhanvi_908')  ) WHERE Patient_ID = 9 
GO

UPDATE dbo.Patient set 
 [Password] = EncryptByKey(Key_GUID('PatPass_SM'),  convert(varbinary, 'Ronie_631')  ) WHERE Patient_ID = 10 
GO 

OPEN SYMMETRIC KEY PatPass_SM  
   DECRYPTION BY CERTIFICATE PatPass; 


SELECT *, 
    CONVERT(varchar, DecryptByKey([Password]))   
    AS 'Decrypted password'  
    FROM dbo.Patient;  
GO


SELECT * FROM Patient