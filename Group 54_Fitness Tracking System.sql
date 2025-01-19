CREATE database Fitness_Tracking_System;
USE Fitness_Tracking_System;

CREATE table USERS(
  user_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  First_Name varchar(50),
  Last_Name varchar(50),
  email varchar(50) unique,
  province varchar(20),
  city varchar(20),
  Age int,
  height float,
  weight float,
  BMI float
);
INSERT INTO USERS (User_id, First_name, Last_name, Email, Province, City, Age, Weight, Height, BMI)
VALUES
    (001, 'Kamal', 'Silva', 'kaml@gmail.com', 'Western', 'Kalutara', 23, 60, 154, 18),
    (002, 'Amal', 'Perera', 'Amalperera@gmail.com', 'Southern', 'Matara', 23, 55, 154, 17),
    (003, 'Sera', 'Silva', 'Serasilva@gmail.com', 'Western', 'Kalutara', 20, 45, 152, 14),
    (004, 'Kasun', 'Abesinghe', 'Abesignhe@gmail.com', 'Uva', 'Badulla', 25, 55, 155, 18.4),
    (005, 'Uma', 'Hansini', 'Uma123@gmail.com', 'Southern', 'Galle', 19, 43, 149, 13.9),
    (006, 'Hirun', 'Perera', 'Hirun78@gmail.com', 'Central', 'Kandy', 21, 69, 150, 17.5),
    (007, 'Gihara', 'Rathnaweera', 'Gihara78@gmail.com', 'Central', 'Kandy', 20, 40, 140, 17.5);
    
UPDATE Users SET First_Name = 'amala', email = 'Amalaperera@gmail.com' WHERE user_id =002;
UPDATE Users SET height= 152.5, BMI=13.5 WHERE user_id = 003;
delete from users where user_id = 006;

CREATE TABLE  Contact_Details (
User_id INT NOT NULL,
Phone_number VARCHAR(15),
PRIMARY KEY(User_id ,Phone_number),
FOREIGN KEY (User_id) REFERENCES USERS(user_id)
ON DELETE CASCADE
ON UPDATE CASCADE
);
INSERT INTO Contact_Details (User_id, Phone_number)
VALUES
    (001, '710890876'),
    (002, '728900874'),
    (003, '724569789'),
    (003, '710874567'),
    (004, '723540789'),
	(005,'771818546'),
	(005,'771818540');
 
 UPDATE Contact_Details SET Phone_number = '773540889' WHERE user_id = 004 and phone_number='723540789';
UPDATE Contact_Details SET Phone_number = '771818547' WHERE user_id = 005 and phone_number ='771818540';
delete from Contact_Details  where user_id = 003 and phone_number ='710874567';

CREATE TABLE workout_List (
    Workout_id VARCHAR(10) PRIMARY KEY NOT NULL,
    Workout_name VARCHAR(50)
);

INSERT INTO workout_List (Workout_id, Workout_name)
VALUES 
('W001', 'workout1'),
('W002', 'workout2'),
('W003', 'workout3'),
('W004', 'workout4'),
('W005', 'workout55'),
('W006', 'workout6'),
('W007', 'workout7');

update workout_list set workout_name = 'workout' where workout_id = 'W006';
update workout_list set workout_name = 'workout5' where workout_id = 'W005';
delete FROM workout_list where workout_id ='W006';
    
CREATE TABLE Workout (
User_id INT NOT NULL,
Workout_id VARCHAR(10) NOT NULL,
Start_time TIME,
Calories_burned INT,
Hours INT,
Minutes INT,
Seconds INT,
PRIMARY KEY (User_id, Workout_id));

INSERT INTO workout (User_id, Workout_id, Start_time, Calories_burned, Hours, Minutes, Seconds)
VALUES 
(001, 'W001', '07:00:00', 600, 1, 10, 0),
(001, 'W002', '08:00:00', 250, 0, 30, 20),
(002, 'W001', '07:30:00', 700, 1, 30, 10),
(003, 'W003', '17:00:00', 300, 0, 30, 15),
(004, 'W004', '16:30:00', 450, 2, 15, 20),
(005, 'W002', '16:30:00', 400, 1, 45, 25),
(005, 'W001', '15:30:00', 400, 1, 40, 30),
(001, 'W003', '07:30:00', 600, 1, 10, 0),
(001, 'W004', '07:50:00', 650, 1, 10, 0),
(001, 'W005', '07:20:00', 300, 1, 10, 0),
(001, 'W007', '06:00:00', 400, 1, 10, 0);

ALTER TABLE Workout
ADD CONSTRAINT fk_user_id
FOREIGN KEY (User_id) REFERENCES Users(User_id);

ALTER TABLE Workout
ADD CONSTRAINT fk_workout_id
FOREIGN KEY (Workout_id) REFERENCES Workout_List(Workout_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

update workout set Start_time = '16:35:00',Calories_burned='350' where workout_id = 'W004' and user_id=004;
update workout set Calories_burned='420' where workout_id = 'W002' and user_id= 005;
delete FROM workout where workout_id ='W001' and user_id= 005;

CREATE TABLE Nutrition_log (
    User_id int not null,
    Log_date_time DATETIME not null,
    Calories_Taken INT,
    PRIMARY KEY (User_id, Log_date_time),
    FOREIGN KEY (User_id) REFERENCES Users(User_id)
    ON DELETE CASCADE
	ON UPDATE CASCADE);

INSERT INTO Nutrition_log (User_id, Log_date_time, Calories_Taken) VALUES 
(001, '2024-03-28 08:00:00', 500),
(002, '2024-03-28 12:30:00', 700),
(003, '2024-03-28 09:45:00', 600),
(001, '2024-03-27 18:00:00', 800),
(004, '2024-03-28 07:15:00', 400),
(005, '2024-03-28 10:00:00', 550);

update nutrition_log set log_date_time='2024-03-2 09:40:00',
Calories_Taken=550 where user_id=003 and Log_date_time='2024-03-28 09:45:00' ;
update nutrition_log set log_date_time='2024-03-27 18:30:00',
Calories_Taken=450 where user_id=001 and Log_date_time='2024-03-27 18:00:00' ;
delete FROM nutrition_log where user_id= 005 and Log_date_time= '2024-03-28 10:00:00'; 

CREATE TABLE exercise_List (
    Exercise_id VARCHAR(10) PRIMARY KEY NOT NULL,
    Exercise_name VARCHAR(255));

INSERT INTO exercise_List (Exercise_id, Exercise_name)
VALUES 
('E001', 'Running'),
('E002', 'Weightlifting'),
('E003', 'Yoga'),
('E004', 'Cycling'),
('E005', 'Swimming'),
('E006', 'Jumping Rope');

update exercise_List set Exercise_name = 'jumping' where Exercise_id = 'E003';
update exercise_List set Exercise_name ='walking' where Exercise_id = 'E004';
delete from exercise_List where Exercise_id='E005';

CREATE TABLE Exercise (
    Workout_id VARCHAR(10) not null,
    Exercise_id VARCHAR(10) not null,
    Category VARCHAR(50),
    Calories_burned_per_minute FLOAT,
    PRIMARY KEY (Workout_id, Exercise_id),
	FOREIGN KEY (Workout_id) REFERENCES Workout(Workout_id),
    FOREIGN KEY (Exercise_id) REFERENCES Exercise_list(Exercise_id)
    ON DELETE CASCADE
ON UPDATE CASCADE );

INSERT INTO Exercise (Workout_id, Exercise_id, Category, Calories_burned_per_minute) VALUES 
('W001', 'E001', 'Cardio', 10.5),
('W001', 'E002', 'Strength Training', 5.75),
('W002', 'E003', 'Flexibility', 6.25),
('W003', 'E004', 'Cardio', 8.0),
('W004', 'E004', 'Cardio', 12.3),
 ('W003', 'E001', 'Cardio', 12.3);
 
update exercise set Exercise_id= 'E006' where Exercise_id = 'E002' and workout_id='W001' ;
update exercise set Calories_burned_per_minute=8.00 where Exercise_id = 'E003' and workout_id='W002';
delete from exercise where Exercise_id='E005' and workout_id='W004';

CREATE TABLE Exercise_log (
    Log_id VARCHAR(10) PRIMARY KEY not null,
    Exercise_id VARCHAR(10) NOT NULL,
    Sets INT,
    Repetitions INT,
    Weight FLOAT,
    FOREIGN KEY (Exercise_id) REFERENCES Exercise(Exercise_id)
    ON DELETE CASCADE
ON UPDATE CASCADE);

INSERT INTO Exercise_log (Log_id, Exercise_id, Sets, Repetitions, Weight) VALUES 
('L001', 'E001', 10, 3, 20),
('L002', 'E003', 8, 3, NULL),
('L003', 'E004', 12, 2, 15),
('L004', 'E001', 10, 4, 5),
('L005', 'E003', 8, 4, 3),
('L006', 'E001', 3, 7, 2);

update Exercise_log set  Sets=15 , Repetitions=20, weight=14 
where log_id='L003' and Exercise_id='E004';
update Exercise_log set  Sets=5 , Repetitions=2, weight=4 
where log_id='L004' and Exercise_id='E001';
delete from Exercise_log where log_id='L005' and Exercise_id='E003';

CREATE TABLE Heart_Rate_Record (
    Log_id VARCHAR(10) NOT NULL,
    Heart_Rate INT,
    Recorded_time TIME,
    PRIMARY KEY(Log_id , Recorded_time),
    FOREIGN KEY (Log_id) REFERENCES Exercise_log(Log_id)
    ON DELETE CASCADE
ON UPDATE CASCADE
);
INSERT INTO Heart_Rate_Record (Log_id, Heart_Rate, Recorded_time)
VALUES 
('L001', 100, '12:00:00'),
('L001', 120, '11:00:00'),
('L002', 100, '11:15:00'),
('L003', 120, '12:00:00'),
('L004', 125, '08:00:00');

update Heart_Rate_Record set Heart_Rate='80'and Recorded_time='10:00:00' 
where Log_id='L002' and Recorded_time='11:15:00';
update Heart_Rate_Record set Heart_Rate='90'and Recorded_time='10:00:00' 
where Log_id='L003' and Recorded_time='12:00:00';
delete from Heart_Rate_Record where log_id='L004' and Recorded_time='08:00:00';

CREATE TABLE Equipment_List (
    Equipment_id VARCHAR(10) PRIMARY KEY NOT NULL,
    Equipment_name VARCHAR(255)
	);
INSERT INTO Equipment_List (Equipment_id, Equipment_name)
VALUES 
('EQ001', 'Treadmills'),
('EQ002', 'Bench'),
('EQ003', 'Dumbbells'),
('EQ004', 'Exercise Bike'),
('EQ005', 'Leg Extension machine'),
('EQ006', 'Rowing Machine');

update Equipment_List set Equipment_name='Leg Press Machine' 
where Equipment_id='EQ002';
update Equipment_List set Equipment_name='Power Rack' 
where Equipment_id='EQ003';
delete from Equipment_List where Equipment_id='EQ005';

CREATE TABLE Equipment (
    Equipment_id VARCHAR(10) NOT NULL,
    Exercise_id VARCHAR(10) NOT NULL,
    Duration INT,
    PRIMARY KEY (Equipment_id , Exercise_id),
    FOREIGN KEY (Exercise_id) REFERENCES Exercise(Exercise_id),
    FOREIGN KEY (Equipment_id) REFERENCES Equipment_list(Equipment_id)
    ON DELETE CASCADE
ON UPDATE CASCADE
);
INSERT INTO Equipment (Equipment_id, Exercise_id, Duration)
VALUES 
('EQ001', 'E001', 3),
('EQ002', 'E001', 10),
('EQ002', 'E006', 2),
('EQ003', 'E003', 5),
('EQ004', 'E003', 7),
('EQ004', 'E004', 5);

update Equipment set Exercise_id='E006' 
where Exercise_id='E003' and Equipment_id='EQ004';
update Equipment set Duration='9' 
where Exercise_id='E002' and Equipment_id='EQ006';
delete from Equipment  
where Exercise_id='E004' and Equipment_id='EQ004';

CREATE TABLE Location (
    Location_id VARCHAR(10) PRIMARY KEY NOT NULL,
    Location_name VARCHAR(255),
    Province VARCHAR(255),
    City VARCHAR(255)
   
);

INSERT INTO Location (Location_id, Location_name, Province, City)
VALUES 
('A001', 'Area 1', 'Western', 'Kalutara'),
('A002', 'Area 2', 'Southern', 'Matara'),
('A003', 'Area 3', 'Southern', 'Galle'),
('A004', 'Area 4', 'North', 'Jaffna'),
('A005', 'Area 5', 'Estern', 'Baticalo'),
('A006', 'Area 6', 'central', 'Kandy');

delete from Location where Location_id='A003';
update Location set  Location_name='A003',Province='central', City='Nuwaraeliya'
where Location_id='A004';
update Location set  Province='north', City='MUlathiw'where Location_id='A006';

CREATE TABLE Location_content (
    Equipment_id VARCHAR(10) NOT NULL,
    Location_id VARCHAR(10) NOT NULL,
    Quantity INT,
    PRIMARY KEY (Equipment_id ,Location_id),
    FOREIGN KEY (Equipment_id) REFERENCES Equipment(Equipment_id),
    FOREIGN KEY (Location_id) REFERENCES Location(Location_id)
    ON DELETE CASCADE
ON UPDATE CASCADE
);
INSERT INTO Location_content (Equipment_id, Location_id, Quantity)
VALUES 
('EQ001', 'A001', 1),
('EQ001', 'A002', 2),
('EQ002', 'A001', 1),
('EQ003', 'A002', 3),
('EQ004', 'A006', 4),
('EQ004', 'A005', 1);

update Location_content set Quantity =5 
where Equipment_id='EQ002' and Location_id='A001';
update Location_content set Quantity =7 
where Equipment_id='EQ003' and Location_id='A002';
delete from Location_content 
where Equipment_id='EQ004' and Location_id='A005';

-- Simple Queries
-- 1. Select operation
SELECT * FROM Exercise;
-- 2. Project operation
SELECT Calories_burned, Hours FROM workout;
-- 3. Cartesian product operation
SELECT u.First_name, w.Workout_name
FROM Users As u
CROSS JOIN Workout_list As w;
-- 4. Creating a user view
CREATE VIEW User_Details AS
SELECT User_id, First_name, Last_name, Age, Weight, Height
FROM Users;
-- 5. Renaming operation
select Equipment_id as E_ID, Location_id as L_ID from Location_content;
-- 6. Aggregation function (Average)
SELECT AVG(Weight) AS AverageWeight
FROM Users;
-- 7. Use of LIKE keyword
select *from workout  where Hours like '%1%';


-- complex  Queries
-- 1.UNION
SELECT E.Equipment_id FROM Equipment_list as E
UNION
SELECT LC.Location_id FROM Location_content as LC;

-- 2.INTERSECTION
SELECT User_id FROM Users
INTERSECT
SELECT User_id FROM workout;

-- 3.Set Difference
SELECT location_id FROM location
EXCEPT
SELECT location_id FROM location_content;

-- division
-- Find users who have done all workouts
SELECT u.User_ID, u.First_Name
FROM Users AS u
WHERE NOT EXISTS (SELECT w.Workout_ID FROM Workout_List AS w
    WHERE NOT EXISTS (SELECT *FROM Workout AS wo
	WHERE wo.Workout_ID = w.Workout_ID AND wo.User_ID = u.User_ID
    ));

-- inner join
CREATE VIEW Inner_Join_View AS
SELECT u.First_Name, w.Workout_name
FROM Users AS u
INNER JOIN Workout AS wo ON u.User_ID = wo.User_ID
INNER JOIN Workout_List AS w ON wo.Workout_ID = w.Workout_ID;

-- natural join
CREATE VIEW Natural_Join_View AS
SELECT u.First_Name, e.Exercise_id
FROM Users AS u
NATURAL JOIN Workout AS wo
NATURAL JOIN Exercise AS e;

-- Left join
CREATE VIEW Left_Outer_join AS 
SELECT u.First_Name, w.Workout_name FROM Users AS u
LEFT JOIN Workout AS wo ON u.User_ID = wo.User_ID
LEFT JOIN Workout_List AS w 
ON wo.Workout_ID = w.Workout_ID;

-- Right join
CREATE VIEW Right_Outer_join AS 
SELECT u.First_Name, w.Workout_name FROM Users AS u
RIGHT JOIN Workout AS wo ON u.User_ID = wo.User_ID
RIGHT JOIN Workout_List AS w 
ON wo.Workout_ID = w.Workout_ID;

-- Full Outer join 
CREATE VIEW full_outer AS
SELECT u.First_Name, w.Workout_name
FROM Users AS u
LEFT OUTER JOIN Workout AS wkt ON u.User_ID = wkt.User_ID
LEFT OUTER JOIN Workout_List AS w ON wkt.Workout_ID = w.Workout_ID
UNION
SELECT u.First_Name, w.Workout_name
FROM Workout AS wkt
RIGHT OUTER JOIN Users AS u ON u.User_ID = wkt.User_ID
RIGHT OUTER JOIN Workout_List AS w ON wkt.Workout_ID = w.Workout_ID;

-- CREATE VIEW Outer_Union_View AS
CREATE VIEW outer_union AS
SELECT E.Equipment_id,  E.Exercise_id
FROM Equipment as E
UNION
SELECT LC.Equipment_id, LC.Location_id
FROM Location_content as LC;

-- nested queries 
SELECT u.First_Name, w.Workout_Id
FROM (SELECT * FROM Users WHERE Age > 20) AS u
INNER JOIN (SELECT * FROM Workout WHERE Hours >= 1) 
AS w ON u.User_ID = w.User_ID;

-- 
SELECT u.First_Name, AVG(w.Calories_burned) 
AS AvgCaloriesBurned
FROM Users AS u
INNER JOIN Workout AS w ON u.User_ID = w.User_ID
GROUP BY u.First_Name;
-- 

SELECT First_Name FROM Users
WHERE User_ID IN (
    SELECT User_ID FROM Workout
    INTERSECT
    SELECT User_ID FROM Nutrition_Log
);


-- tunning
-- 1.UNION
-- before tunning
Explain SELECT E.Equipment_id FROM Equipment_list as E
UNION
SELECT LC.Location_id FROM Location_content as LC;

-- after tuning
 Explain SELECT Equipment_id FROM Equipment
UNION All
 SELECT Location_id FROM Location_content;
 
 
 -- 2.INTERSECTION
 -- before tunning
Explain SELECT User_id FROM Users
INTERSECT
SELECT User_id FROM workout;

-- After Tunning 
explain SELECT DISTINCT u.User_id 
FROM Users AS u
INNER JOIN workout AS w ON u.User_id = w.User_id;

-- 3.Set Difference
-- before tunning
Explain SELECT location_id FROM location
EXCEPT
SELECT location_id FROM location_content;

-- after tunning
Explain SELECT l.Location_id
FROM location AS l
LEFT JOIN location_content AS lc ON l.Location_id = lc.Location_id
WHERE lc.Location_id IS NULL;


-- division
-- before tunning
Explain SELECT u.User_ID, u.First_Name
FROM Users AS u WHERE NOT EXISTS (SELECT w.Workout_ID
    FROM Workout_List AS w
    WHERE NOT EXISTS (SELECT * FROM Workout AS wo 
    WHERE wo.Workout_ID = w.Workout_ID AND wo.User_ID = u.User_ID
    ));
-- after tunning
Explain SELECT u.User_ID, u.First_Name
FROM Users AS u
LEFT JOIN (SELECT wo.User_ID, wo.Workout_ID FROM Workout AS wo
    LEFT JOIN Workout_List AS wl ON wo.Workout_ID = wl.Workout_ID
) AS joined ON u.User_ID = joined.User_ID
GROUP BY u.User_ID, u.First_Name
HAVING COUNT(joined.Workout_ID) = (SELECT COUNT(*) FROM Workout_List);

-- inner join
-- before tunning
Explain SELECT u.First_Name, w.Workout_name
FROM Users AS u
INNER JOIN Workout AS wo ON u.User_ID = wo.User_ID
INNER JOIN Workout_List AS w ON wo.Workout_ID = w.Workout_ID;

-- after tunning 
CREATE INDEX idx_User_ID ON Users(User_ID);
CREATE INDEX idx_Workout_ID ON Workout(Workout_ID);
Explain SELECT u.First_Name, w.Workout_name
FROM Users AS u
INNER JOIN Workout AS wo ON u.User_ID = wo.User_ID
INNER JOIN Workout_List AS w ON wo.Workout_ID = w.Workout_ID;

-- Natural join
Explain SELECT u.First_Name, e.Exercise_id
FROM Users AS u
NATURAL JOIN Workout AS wo
NATURAL JOIN Exercise AS e;

-- after tunning
Explain SELECT u.First_Name, e.Exercise_id
FROM Users AS u
INNER JOIN Workout AS wo ON u.User_ID = wo.User_ID
INNER JOIN Exercise AS e ON wo.Workout_id = e.Workout_id;

-- Right Join
-- before tunning
Explain SELECT u.First_Name, w.Workout_name FROM Users AS u
RIGHT JOIN Workout AS wo ON u.User_ID = wo.User_ID
 RIGHT JOIN Workout_List AS w ON wo.Workout_ID = w.Workout_ID;
 
 -- after tuning
CREATE INDEX idx_workout_user_id ON Workout(User_id);
Explain SELECT u.First_Name, w.Workout_name FROM Users AS u
RIGHT JOIN Workout AS wo ON u.User_ID = wo.User_ID
RIGHT JOIN Workout_List AS w ON wo.Workout_ID = w.Workout_ID;

-- Nested 
-- before tunning
Explain SELECT u.First_Name, w.Workout_Id
FROM (SELECT * FROM Users WHERE Age > 20) AS u
INNER JOIN (SELECT * FROM Workout WHERE Hours >= 1
) AS w ON u.User_ID = w.User_ID;

-- after tunning
Explain SELECT u.First_Name, w.Workout_Id
FROM Users AS u
INNER JOIN Workout AS w ON u.User_ID = w.User_ID
WHERE u.Age > 20 AND w.Hours >= 1;

-- number 9  tuning

explain SELECT u.First_Name, w.Workout_name
FROM Users AS u
LEFT OUTER JOIN Workout AS wkt ON u.User_ID = wkt.User_ID
LEFT OUTER JOIN Workout_List AS w ON wkt.Workout_ID = w.Workout_ID
UNION
SELECT u.First_Name, w.Workout_name
FROM Workout AS wkt
RIGHT OUTER JOIN Users AS u ON u.User_ID = wkt.User_ID
RIGHT OUTER JOIN Workout_List AS w ON wkt.Workout_ID = w.Workout_ID;


-- after tuning
Explain SELECT u.First_Name, w.Workout_name
FROM Users AS u
LEFT JOIN Workout AS wkt ON u.User_ID = wkt.User_ID
LEFT JOIN Workout_List AS w ON wkt.Workout_ID = w.Workout_ID
UNION ALL
SELECT u.First_Name, w.Workout_name FROM Workout AS wkt
RIGHT JOIN Users AS u ON u.User_ID = wkt.User_ID
RIGHT JOIN Workout_List AS w ON wkt.Workout_ID = w.Workout_ID;

-- 10 tunning
Explain SELECT u.First_Name,
AVG(w.Calories_burned) AS AvgCaloriesBurned
FROM Users AS u INNER JOIN
Workout AS w ON u.User_ID = w.User_ID WHERE
w.Calories_burned IS NOT NULL GROUP BY u.First_Name;
    
    -- after tunning
Explain SELECT u.First_Name, AVG(w.Calories_burned) 
AS AvgCaloriesBurned
FROM Users AS u
INNER JOIN Workout AS w ON u.User_ID = w.User_ID
GROUP BY u.First_Name;





