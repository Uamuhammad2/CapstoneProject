CREATE TABLE Sport(
	sport_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	season VARCHAR(7) NOT NULL,
	sport_name VARCHAR(50) NOT NULL,
	sport_division1 VARCHAR(50),
	sport_division2 VARCHAR(50),
	PRIMARY KEY(sport_id)
)


CREATE TABLE Multisport(
	multisport_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	multisport_name VARCHAR(50) NOT NULL,
	sport_1 INT NULL,
	sport_2 INT NULL,
	sport_3 INT NULL,
	sport_4 INT NULL,
	sport_5 INT NULL,
	sport_6 INT NULL,
	sport_7 INT NULL,
	sport_8 INT NULL,
	sport_9 INT NULL,
	sport_10 INT NULL,
	PRIMARY KEY(Multisport_ID),
	FOREIGN KEY(sport_1) REFERENCES Sport (sport_id),
	FOREIGN KEY(sport_2) REFERENCES Sport (sport_id),
	FOREIGN KEY(sport_3) REFERENCES Sport (sport_id),
	FOREIGN KEY(sport_4) REFERENCES Sport (sport_id),
	FOREIGN KEY(sport_5) REFERENCES Sport (sport_id),
	FOREIGN KEY(sport_6) REFERENCES Sport (sport_id),
	FOREIGN KEY(sport_7) REFERENCES Sport (sport_id),
	FOREIGN KEY(sport_8) REFERENCES Sport (sport_id),
	FOREIGN KEY(sport_9) REFERENCES Sport (sport_id),
	FOREIGN KEY(sport_10) REFERENCES Sport (sport_id),
)

CREATE TABLE Facility(
	facility_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	facility_name VARCHAR(100) NOT NULL,
	street_address VARCHAR (100) NOT NULL,
	city VARCHAR (20) NOT NULL,
	province VARCHAR (3) NOT NULL,
	postal_code VARCHAR (7) NOT NULL,
	long DECIMAL(18,16) NOT NULL,
	lat DECIMAL(18,16) NOT NULL,
	contact VARCHAR(255) NOT NULL,
	PRIMARY KEY (facility_id),
)

CREATE TABLE Meet(
	meet_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	primary_name VARCHAR(255) NOT NULL,
	pecondary_name VARCHAR(255) NOT NULL,
	starts_on DATE NOT NULL,
	ends_on DATE NOT NULL,
	facility_id INT NOT NULL,
	comp_type VARCHAR(50),
	schedule_link VARCHAR (50),
	PRIMARY KEY(meet_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
)

CREATE TABLE Club(
	club_code VARCHAR(4) NOT NULL UNIQUE,
	club_name VARCHAR (50) NOT NULL UNIQUE
)

CREATE TABLE Athlete(
	ac_num INT NOT NULL UNIQUE,
	fname VARCHAR(20) NOT NULL,
	lname VARCHAR(20) NOT NULL,
	dob date NOT NULL,
	sex VARCHAR(1) NOT NULL,
	current_club VARCHAR(4) NULL,
	disability VARCHAR(10) NULL,
	notes VARCHAR(255) NULL,
	member_since date NOT NULL,
	renewed_on date NULL,

	PRIMARY KEY (ac_num),
	FOREIGN KEY (current_club) REFERENCES Club(club_code)
)


CREATE TABLE Result(
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE, -- PK
	sport_id INT NOT NULL, --FKs
	meet_id INT NOT NULL,
	ac_num INT NOT NULL, 
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL, -- end of FKs
	result_date DATE NOT NULL,
	result_time TIME NOT NULL,
	mark VARCHAR(10),
	wind VARCHAR(10),
	overall_placement INT,
	heat_placement INT,
	notes VARCHAR(255),
	is_multi BIT

	PRIMARY KEY(result_id),
	FOREIGN KEY(sport_id) REFERENCES Sport(sport_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY(ac_num) REFERENCES  Athlete(ac_num),
	FOREIGN KEY(facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY(club_affil) REFERENCES Club(club_code)
)

CREATE TABLE MultisportResult(
	multisport_result_id INT IDENTITY(1,1) NOT NULL UNIQUE, -- PK
	multisport_id INT NOT NULL,
	athlete_id INT NOT NULL,
	result_1 INT,
	score_1 DECIMAL(6,2),
	result_2 INT,
	score_2 DECIMAL(6,2),
	result_3 INT,
	score_3 DECIMAL(6,2),
	result_4 INT,
	score_4 DECIMAL(6,2),
	result_5 INT,
	score_5 DECIMAL(6,2),
	result_6 INT,
	score_6 DECIMAL(6,2),
	result_7 INT,
	score_7 DECIMAL(6,2),
	result_8 INT,
	score_8 DECIMAL(6,2),
	result_9 INT,
	score_9 DECIMAL(6,2),
	result_10 INT,
	score_10 DECIMAL(6,2),
	overall_result INT NOT NULL,
	placement INT NOT NULL,

	PRIMARY KEY(multisport_result_id),
	FOREIGN KEY(athlete_id) REFERENCES Athlete(ac_num),
	FOREIGN KEY(multisport_id) REFERENCES Multisport(multisport_id),
	FOREIGN KEY(result_1) REFERENCES Result(result_id),
	FOREIGN KEY(result_2) REFERENCES Result(result_id),
	FOREIGN KEY(result_3) REFERENCES Result(result_id),
	FOREIGN KEY(result_4) REFERENCES Result(result_id),
	FOREIGN KEY(result_5) REFERENCES Result(result_id),
	FOREIGN KEY(result_6) REFERENCES Result(result_id),
	FOREIGN KEY(result_7) REFERENCES Result(result_id),
	FOREIGN KEY(result_8) REFERENCES Result(result_id),
	FOREIGN KEY(result_9) REFERENCES Result(result_id),
	FOREIGN KEY(result_10) REFERENCES Result(result_id),
)


