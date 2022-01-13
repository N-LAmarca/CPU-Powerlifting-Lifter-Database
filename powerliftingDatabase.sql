DROP DATABASE POWERLIFTINGDATABASE;
CREATE DATABASE IF NOT EXISTS POWERLIFTINGDATABASE;
USE POWERLIFTINGDATABASE;

CREATE TABLE IF NOT EXISTS ATHLETE
	(cpuNumber			int 			NOT NULL,
	 name			VARCHAR(30)		NOT NULL,
     sex				long			NOT NULL,
     club			VARCHAR(30),
     birthYear			int				NOT NULL,
     province				VARCHAR(30)		NOT NULL,
     nationalQT			boolean			NOT NULL,
     PRIMARY KEY (cpuNumber));
     
CREATE TABLE IF NOT EXISTS COMPETITION
	(compName			VARCHAR(100) 	NOT NULL,
     location		VARCHAR(100) 	NOT NULL,
     date				datetime		NOT NULL,
     primary key(compName));
     
CREATE TABLE IF NOT EXISTS COMPETITIONHISTORY
	(meet			VARCHAR(100) 	NOT NULL,
	 athleteId			int 			NOT NULL,
     weightClass		int				NOT NULL,
	 bodyweight			double				NOT NULL,
	 ageCategory		VARCHAR(30) 	NOT NULL,
     unequpped			boolean				NOT NULL,
     eventType			VARCHAR(30) 	NOT NULL,
    squat1			double 			NOT NULL,
    squat2			double 			,
    squat3			double 			,
    bench1			double 			NOT NULL,
    bench2			double 			,
    bench3			double 			,
    deadlift1			double 			NOT NULL,
    deadlift2			double 			,
    deadlift3			double 			,
    total			double 			NOT NULL,
    glPoints		double			NOT NULL,
    primary key(meet, athleteID),
    foreign key(meet) references COMPETITION(compName),
    foreign key(athleteId) references ATHLETE(cpuNumber),
     CONSTRAINT competitionHistoryMeetCascade
     FOREIGN KEY (meet)
     REFERENCES COMPETITION (compName)
     ON DELETE CASCADE,
     CONSTRAINT competitionHistoryAthleteCascade
     FOREIGN KEY (athleteId)
     REFERENCES ATHLETE(cpuNumber)
     ON DELETE CASCADE);
     
INSERT INTO ATHLETE (cpuNumber, name, sex, club, birthYear, province, nationalQT)
VALUES (152512,	"Nicolas L'Amarca", "M", "King's Fitness", 1997, "AB", true),
		(250711, "Meagan Wiebe", "F", "King's Fitness", 1998, "AB", true);
        
INSERT INTO COMPETITION (compName, location, date)
VALUES ("2017 Strength Edge Qualifier", "Calgary, AB",	"2017-06-11 00:00:00"),
	   ("2017 Alberta Provincials", "Edmonton, AB",	"2017-07-08 00:00:00"),
       ("2017 Western Canadian Championship", "Winnipeg, MB",	"2017-09-08 00:00:00"),
	   ("2018 Canadian Powerlifting Union National Championships", "Calgary, AB",	"2018-02-19 00:00:00"),
	   ("2018 Alberta Provincials", "Calgary, AB",	"2018-06-30 00:00:00"),
       ("2019 Body Performance Spring Showdown", "Calgary, AB",	"2019-05-04 00:00:00"),
       ("2019 Alberta Provincials", "Edmonton, AB",	"2019-06-22 00:00:00"),
       ("2019 Western Canadian Championship", "Saskatoon, SK", "2019-09-06 00:00:00"),
       ("2020 Alberta Provincials", "Calgary, AB",	"2020-09-23 00:00:00"),
       ("2020 Cowtown Showdown", "Calgary, AB",	"2020-09-18 00:00:00"),
       ("2021 Alberta Provincials", "Edmonton, AB",	"2021-12-03 00:00:00");
       
INSERT INTO COMPETITIONHISTORY(meet, athleteId, weightClass, bodyweight, ageCategory, unequpped, eventType, squat1, squat2, squat3, bench1, bench2, bench3, deadlift1, deadlift2, deadlift3, total, glPoints)
VALUES ("2017 Strength Edge Qualifier", 152512, 74, 71.30, "junior", true, "3-lift", 150, 160, -162.5, 125, 132.5, -137.5, 185, 197.5, -200, 490,  73.34),
	   ("2017 Alberta Provincials",  152512, 74, 72.20, "junior", true, "3-lift", 155, 165, 170, 127.5, 135, -137.5, 190, -200, -200, 495,  73.61),
       ("2017 Western Canadian Championship",  152512, 74, 71.40, "junior", true, "3-lift", 157.5, 165, 170, 127.5, 135, -140, 187.5, 197.5, 202.5, 507.5,  75.91),
	   ("2018 Canadian Powerlifting Union National Championships",  152512, 74, 70.48, "junior", true, "3-lift", 165, 175, -180, 127.5, -132.5, -137.5, 200, 210, 215, 512.5,  77.18),
	   ("2018 Alberta Provincials",  152512, 74, 70.58, "junior", true, "3-lift", -165, 165, 170, 130, 135, -140, 200, 207.5, -212.5, 512.5,  77.12),
       ("2019 Body Performance Spring Showdown", 250711, 57, 56.90, "junior", true, "3-lift", 102.5, 110, 117.5, 45, 50, -52.5, 110, 117.5, 125, 292.5, 68.70),
       ("2019 Alberta Provincials", 250711, 57, 56.50, "junior", true, "3-lift", 105, -112.5, 115, 47.5, 52.5, -55, 125, 132.5, -147.5, 300, 70.84),
        ("2019 Alberta Provincials", 152512, 74, 71.8, "junior", true, "3-lift", 170, 175, 180, 140, 148, -151, 210, 217.5, -225, 545.5,  81.35),
       ("2019 Western Canadian Championship", 250711, 63, 59.4, "junior", true, "3-lift", 115, -120, 125, 50, 52.5, 55, 127.5, 135, 140, 320, 72.84),
       ("2020 Alberta Provincials",  250711, 63, 60.3, "junior", true, "3-lift", 130, 135, -140, 55, 57.5, 60, 130, 137.5, 142.5, 337.5, 76.03),
       ("2020 Alberta Provincials", 152512, 74, 72.3, "junior", true, "3-lift", 180, 190, -195, 150, 158.5, 161, 215, 222.5, -227.5, 573.5,  85.22),
       ("2020 Cowtown Showdown", 152512, 74, 72.9, "open", true, "3-lift", 190, 200, 207.5, 157.5, 165, -170, 215, 230, 240, 612.5,  90.62),
       ("2021 Alberta Provincials", 152512, 74, 73.4, "open", true, "3-lift", 195, 205, -210, 157.5, 165, -167.5, 225, 240, -242.5, 610, 89.93),
       ("2021 Alberta Provincials",  250711, 63, 63.5, "junior", true, "3-lift", 135, 143, -148, -60, 62.5, 60, 140, 147.5, 155, 360.5, 78.47);
	   
       
