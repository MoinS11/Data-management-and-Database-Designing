USE Healthcare_Management
GO



/*INSERT INTO STATEMENTS*/

/*INSURANCE - HMO PPO HSA POS FEE FOR SERVICE*/

INSERT INTO Insurance
VALUES 
(1,'Cigna','HMO'),
(2,'Humana','PPO'),
(3,'United Healthcare','HMO'),
(4,'Kaiser Permanente','POS'),
(5,'Elevance Health','HSA'),
(6,'Aetna','HMO'),
(7,'Centne Corp','Fee for Service'),
(8,'Molina Healthcare','POS'),
(9,'HCSC','Fee for Service'),
(10,'Aflac','PPO')



INSERT INTO Patient ([Patient_ID],[Patient_Name],[Date_Of_Birth],[Phone_Number],[Email_ID],[Insurance_ID],[Street],[City],[State],[Zip_code],[Country_of_Origin],[Country],[Emergency_Contact_Name],[Emergency_Contact_Number],[Gender],[Insurance_Exp_Date])
VALUES
(3,'John Smith','1995-08-03','+18577891237','john.smith@bingo.com',3,'Park Street','Boston','MA',02125,'USA','Germany','Alexis Bledell','+494562378977','Male','2025-03-22'),
(7,'Mark Kelter','1992-12-04','+17798453265','mark.kelter@go.com',7,'Charles Court','Dallas','TX',03217,'USA','France','Jessica Cooper','+336953672384','Male','2027-06-01'),
(5,'Peter Mcdonald','1985-11-09','+15632768980','Peter.mcdonald@right.com',4,'Russell Street','San Fransico','CA',01013,'USA','Italy','Robin Jackson','+398956723419','Male','2029-12-21'),
(8,'Roy Bing','1992-09-02','+449645783241','Roy.bing@click.com',8,'Abbey Road','London','ENG',21987,'UK','UK','Emma Watson','+442365765875','Male','2028-05-12'),
(2,'Julie Geller','1993-03-23','+335633421768','julie.geller@check.com',1,'Michigan Ave','Paris','France',31674,'EU','Ireland','Natalie Portman','+3534562378977','Female','2026-04-13'),
(10,'Ronie Jones','1999-08-21','+333489765129','ronie.jones@bingo.com',2,'Roger Drive','Nice','France',32895,'EU','USA','Lake Bell','+10978654328','Male','2030-09-30'),
(4,'Justin Timberlake','1998-07-31','+13497604512','justin.timberlake@right.com',10,'Main Street','Binghamton','NYU',05097,'USA','USA','Emma Stone','+15693204531','Male','2029-01-19'),
(9,'Jhanvi Shetty','1999-10-13','+917967293675','jhanvi.shetty@go.com',5,'Thakur Village','Kandivali','MH',400101,'India','India','Mahi Rane','+913475582164','Female','2026-02-02'),
(1,'Rick Johnson','1987-06-30','+918878265437','rick.johnson@bingo.com',9,'Borivali','Mumbai','MH',400123,'INDIA','USA','Mila Kunis','+16578340922','Non-Binary','2028-04-05'),
(6,'Rishi Kumar','1998-10-21','+19870138588','rishi.kumar@check.com',6,'Roxbury','Boston','MA',02120,'USA','India','Priya Singh','+912463748910','Male','2031-11-04')



INSERT INTO Doctor([Doctor_ID] ,[Doctor_Name] ,[Date_Of_Birth] ,[Phone_Number],[Email_ID],[Gender],[License_Number],[License_Expiration_Date],[Degree])
VALUES
(1,'John Marshall','1978-02-01',9872123421,'marshall_j@gmail.com','Male','CAR1232','2020-02-01','MBBS'),
(2,'Maria Dmello','1965-10-02',8572212123,'maria_Dmello21@gmail.com','Female','DMD2351','2023-10-02','DMD'),			
(3,'Quincy Joseph','1989-12-14',8892342143,'sweetquincy_42@gmail.com','Female','DCM2021','2022-12-02','DCM'),			
(4,'Chin Yen','1998-11-26',7672321123,'chen.yen@gmail.com','Male','MD2301','2013-11-02','MD'),		
(5,'Mike Pearl','1968-06-12',8098213412,'pearl_m@gmail.com','Male','DMD2211','2025-10-15','DMD'),
(6,'Green Field','1962-04-13',6521234212,'field.green@gmail.com','Female','DCD9051','2026-10-02','DCM'),
(7,'Paul Dewane','1965-05-14',3399997791,'paulDewane42@gmail.com','Male','CAR2351','2020-11-02','MBBS'),
(8,'Plank Oto','1965-06-15', 3682135276 , 'otoPlank21@gmail.com','Non-Binary','DMD1022','2024-04-02','DMD'),
(9,'Parthiv Patel','1965-07-16',8542134651,'PPatel1965@gmail.com','Male','MD5063','2026-11-02','MD'),
(10,'Manuel Ani','1965-11-18',9821233212,'Ani_Manuel6205@gmail.com','Male','DMD0321','2023-10-02','DMD')


/*HEALTHCARE FACILITY*/
Insert into Healthcare_Facility 
VALUES 
('Brigham and Womens Hospital','Hospital','Boston','MA',02115,'USA'),
('Nanavati Hospital','Hospital','Mumbai','MH',400052,'India'),
('Childcare','Clinic','London','LN',10210,'UK'),
('Wondercare','Hospital','Paris','FR',2698,'Europe'),
('Mayo Clinic','Clinic','Italy','FR',31569,'Europe'),
('Toronto General Hospital','Hospital','Toronto','CN',9860,'USA'),
('UMC Utrecht','Hospital','Copenhagen','NH',7456,'Denmark'),
('Royal Melbourne Hospital','Hospital','Melbourn','AU',6542,'Australia'),
('National University Hospital','Hospital','Singapore','SG',789,'Singapore'),
('Grande Ospedale Metropolitano Niguarda','Clinic','Milan','FR',9874,'Europe')


/*EMPLOYMENT*/

INSERT into Employment (Emp_Start_Date,Facility_ID,Doctor_ID)
VALUES
('2012-02-12',1,1),
('2021-03-24',2,2),
('2022-06-10',3,3),
('2001-07-09',4,4),
('2018-10-30',5,5)


INSERT into Employment (Emp_Start_Date,Emp_End_Date,Facility_ID,Doctor_ID)
VALUES
('2012-09-12','2024-09-12',6,6),
('2012-11-12','2028-12-01',7,7),
('2012-12-12','2023-05-06',8,8),
('2006-01-15','2026-01-12',9,9),
('2000-11-24','2027-11-28',10,10)


/*DIAGNOSIS*/

INSERT INTO Diagnosis
VALUES
(1, 'Chest Pain','Rest at home with antibiotics','Low'),
(2, 'Back Pain','Rest at home with antibiotics','Mid'),
(3, 'Chest Pain','Rest at home with antibiotics','Low'),
(4, 'Blurry vision',' diabetes medication or insulin therapy','High'),
(5, 'Fever','Rest and drink plenty of fluids','High'),
(6, 'Varicose veins','Sclerotherapy','Low'),
(7, 'Headache','Antibiotics','Mid'),
(8, 'Nosebleeds','heart-healthy diet with less salt with medicines','High'),
(9, 'Back Pain','Rest at home','High'),
(10, 'Fever','Rest and drink plenty of fluids','Low'),
(11,'Headache','Antibiotics','High'),
(12,'Blurry vision','diabetes medication or insulin therapy','Mid'),
(13,'Fever','Rest and drink plenty of fluids','Low'),
(14,'Back Pain','Rest at home with antibiotics','High'),
(15,'Chest Pain','Rest at home with antibiotics','Mid'),
(16,'Varicose veins','Sclerotherapy','High'),
(17,'Varicose veins','Sclerotherapy','Low'),
(18,'Nosebleeds','heart-healthy diet with less salt with medicines','Mid'),
(19,'Chest Pain','Rest at home with antibiotics','High'),
(20,'Fever','Rest and drink plenty of fluids','Mid'),
(21,'Back Pain','Rest at home with antibiotics','Low'),
(22,'Headache','Antibiotics','Low'),
(23,'Fever','Rest and drink plenty of fluids','Mid'),
(24,'Blurry vision','diabetes medication or insulin therapy','High'),
(25,'Varicose veins','Sclerotherapy','Mid'),
(26,'Blurry vision','diabetes medication or insulin therapy','Low'),
(27,'Fever','Rest and drink plenty of fluids','Mid'),
(28,'Nosebleeds','heart-healthy diet with less salt with medicines','High'),
(29,'Back Pain','Rest at home with antibiotics','Low'),
(30,'Chest Pain','Rest at home with antibiotics','Low')


/*VISIT*/
INSERT INTO Visit 
VALUES 
('2022-02-11', 'Cough', 2, 9,7,3),
('2022-02-11','Back Pain', 4,10,3,2),
('2022-03-20', 'Fever', 1,8,4,5 ),
('2022-04-27', 'Pneumonia', 3,5,8,1),
('2022-03-20', 'Diabetes',7,2,10,4),
('2022-01-07', 'Leg Symptoms',6,7,5,6),
('2022-06-01', 'Headache',10,1 , 6, 7 ),
('2022-06-01', 'Hypertension', 9,3,1,8),
('2022-12-15', 'Fever',8,4,2,10),
('2022-05-13','Back Pain', 5,6,9,9),
('2022-05-13','Headache',9,7,10,11),
('2022-09-30','Diabetes',1,9,8,12),
('2022-12-12','Fever',3,1,5,13),
('2022-12-12','Back Pain',5,3,1,14),
('2022-12-12','Pneumonia',7,4,2,15),
('2022-12-12','Leg Symptoms',10,10,6,16),
('2022-01-25','Leg Symptoms',8,7,9,17),
('2022-03-29','Hypertension',6,2,4,18),
('2022-04-02','Cough',4,8,3,19),
('2022-05-21','Fever',2,6,1,20),
('2022-12-28','Back Pain',2,5,7,21),
('2022-04-19','Headache',6,7,1,22),
('2022-04-19','Pneumonia',5,1,8,23),
('2022-06-13','Diabetes',6,8,2,24),
('2022-06-13','Leg Symptoms',9,10,9,25),
('2022-11-15','Diabetes',1,1,10,26),
('2022-08-02','Fever',9,3,7,27),
('2022-08-02','Hypertension',10,8,6,28),
('2022-06-22','Back Pain',2,9,4,29),
('2022-07-22','Cough',3,6,2,30)


INSERT INTO Drug
VALUES
('Zestril','AstraZeneca'),		
('Synthroid','AbbVie'),		
('Lipitor','Viatris'),		
('Glucophage','Merck'),		
('Zocor','Merck'),
('Prilosec','AstraZeneca'),
('Norvasc','Pfizer'),
('Lopressor','Novartis Pharmaceuticals.'),
('Ventolin',' GlaxoSmithKline'),
('Deltasone','Par Pharma')

INSERT INTO Test 
VALUES 
('C-reactive protein (CRP)','Blood Test','Suburban'),
('Tissue transglutaminase IgA, IgG','Blood Test','Apple Clinic'),
('lipid panel (cholesterol test)','Blood Test','Nemours'),
('Hepatic (liver) function panel','Sonography','BWH'),
('IGF binding protein-3 (IGFBP-3)','X-Ray','Common Wealth'),
('Bone membrane','X-Ray','BWH'),
('Covid-19','Covid Test','Sam Diagnostics'),
('Testosterone','Blood Test','Tamco Diagnostics'),
('lactate dehydrogenase (LDH)','Blood Test','Testguide'),
('T3 total (triiodothyronine)','Blood Test','BWH'),
('Chest Xray','X-Ray','Sam Diagnostics'),
('EEG','Sonography','Mayo CLinic'),
('CT-Scan','Sonography','Suburban')



INSERT INTO Report ([Results],[Report_Date],[Diagnosis_ID],[Test_ID])
VALUES
('Positive','2022-04-29',1,11),
('Negative','2022-02-15',2,6),
('Positive','2022-02-14',3,11),
('Negative','2022-03-22',4,3),
('Positive','2022-03-22',5,7),
('Negative','2022-01-09',6,6),
('Positive','2022-06-02',7,13),
('Negative','2022-06-03',8,12),
('Positive','2022-05-15',9,6),
('Negative','2022-12-17',10,6),
('Negative','2022-05-15',11,13),
('Negative','2022-10-01',12,3),
('Positive','2022-12-15',13,7),
('Negative','2022-12-15',14,6),
('Positive','2022-12-16',15,11),
('Positive','2022-12-17',16,6),
('Negative','2022-01-27',17,6),
('Positive','2022-03-30',18,12),
('Positive','2022-04-04',19,11),
('Positive','2022-05-23',20,7),
('Negative','2022-12-30',21,6),
('Negative','2022-04-21',22,13),
('Positive','2022-04-22',23,11),
('Negative','2022-06-15',24,3),
('Positive','2022-06-16',25,6),
('Positive','2022-11-17',26,3),
('Positive','2022-08-04',27,7),
('Negative','2022-08-05',28,12),
('Negative','2022-06-24',29,6),
('Positive','2022-07-24',30,11)




INSERT into Prescription ([Diagnosis_ID],[Drug_ID])
VALUES

(1,3),
(2,4),
(3,2),
(4,5),
(5,6),
(6,7),
(7,8),
(8,9),
(9,10),
(10,1),
(11,5),
(12,9),
(13,3),
(14,2),
(15,7),
(16,4),
(17,10),
(18,1),
(19,8),
(20,6),
(21,3),
(22,5),
(23,5),
(24,8),
(25,3),
(26,1),
(27,2),
(28,8),
(29,10),
(30,10)

