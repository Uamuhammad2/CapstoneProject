CREATE TABLE Club(
	club_code VARCHAR(4) NOT NULL UNIQUE,
	club_name VARCHAR (50) NOT NULL UNIQUE,
	club_points INT, -- total *_Result(event_score) for every result with this club affiliation for the calendar year
	PRIMARY KEY (club_code)
)

CREATE TABLE Facility(
	facility_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	facility_name VARCHAR(100) NOT NULL,
	street_address VARCHAR (255) NOT NULL,
	city VARCHAR (20) NOT NULL,
	province VARCHAR (2) NOT NULL,
	postal_code VARCHAR (7) NOT NULL,
	long DECIMAL(7,5) NOT NULL,
	lat DECIMAL(7,5) NOT NULL,
	contact VARCHAR(255) NOT NULL,
	PRIMARY KEY (facility_id),
)

CREATE TABLE Notes(
	note_id INT IDENTITY (1,1) NOT NULL UNIQUE,
	note_content VARCHAR(255),
	PRIMARY KEY (note_id)
)

CREATE TABLE Member_Athlete(
	ac_num INT UNIQUE,
	fname VARCHAR(50) NOT NULL,
	lname VARCHAR(50) NOT NULL,
	dob date NOT NULL,
	sex VARCHAR(1) NOT NULL,
	current_club VARCHAR(4) NOT NULL,
	current_disability VARCHAR(3) NULL,
	notes INT NULL,
	member_since date NOT NULL,
	is_active bit NOT NULL,
	total_points INT NOT NULL, -- total championship points, based on competition category and placement

	PRIMARY KEY (ac_num),
	FOREIGN KEY (current_club) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),
)

CREATE TABLE Non_Member_Athlete(
	athlete_id INT IDENTITY(1,1) UNIQUE,
	fname VARCHAR(50) NOT NULL,
	lname VARCHAR(50) NOT NULL,
	dob date NOT NULL,
	sex VARCHAR(1) NOT NULL,
	claimable BIT NOT NULL,

	PRIMARY KEY (athlete_id),
)

CREATE TABLE Competition_Category(
	category_id INT IDENTITY(1,1) NOT NULL,
	comp_level VARCHAR(20),
	comp_type VARCHAR(20),
	first_place INT,
	second_place INT,
	third_place INT,

	PRIMARY KEY(category_id),
	FOREIGN KEY (award) REFERENCES Competition_Points(point_id),
)


-- to be clarified about championship points
CREATE TABLE Meet(
	meet_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	primary_name VARCHAR(255) NOT NULL,
	secondary_name VARCHAR(255) NOT NULL,
	starts_on DATE NOT NULL,
	ends_on DATE NOT NULL,
	facility_id INT NOT NULL,
	comp_type INT NOT NULL,
	schedule_link VARCHAR (50),
	PRIMARY KEY(meet_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (comp_type) REFERENCES Competition_Category(category_id),
)


-- start of results ---------------------------------------------------------------------
CREATE TABLE Dash_Result( -- 50m, 60m, 80m, 100m, 150m, 200m, 300m
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	current_disability VARCHAR(3),
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_score INT, -- amount of points won for the club for this performance
	event_placement INT,
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	-- event specific metrics
	event_distance INT NOT NULL,
	event_wind DECIMAL (2,1) NOT NULL,
	event_heat INT NOT NULL,
	event_lane INT NOT NULL,
	event_mark TIME NOT NULL,
);

CREATE TABLE Run_Result( -- 400m, 600m, 800m, 1000m, 1200m, 1500m, 1609m, 2000m, 3000m, 5000m
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	current_disability VARCHAR(3),
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_score INT, -- amount of points won for the club for this performance
	event_placement INT,
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	-- event specific metrics
	event_distance INT NOT NULL,
	event_heat INT NOT NULL,
	event_lane INT NOT NULL,
	event_mark TIME NOT NULL,
);

CREATE TABLE Hurdles_Result(
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	current_disability VARCHAR(3),
	division VARCHAR(3) NOT NULL, -- calculate on entry
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_score INT, -- amount of points won for the club for this performance
	event_placement INT,
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	-- event specific metrics
	event_distance INT NOT NULL,
	event_hurdle_height VARCHAR(7) NOT NULL,
	event_heat INT NOT NULL,
	event_lane INT NOT NULL,
	event_mark TIME NOT NULL,
	event_wind DECIMAL(2,1), -- 400m + hurdles has no wind

);

CREATE TABLE SteepleChase_Result(
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	current_disability VARCHAR(3),
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_score INT, -- amount of points won for the club for this performance
	event_placement INT,
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	-- event specific metrics
	event_distance INT NOT NULL,
	event_hurdle_height VARCHAR(7) NOT NULL,
	event_heat INT NOT NULL,
	event_lane INT NOT NULL,
	event_mark TIME NOT NULL,
);

CREATE TABLE RaceWalk_Result(
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	current_disability VARCHAR(3),
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_score INT, -- amount of points won for the club for this performance
	event_placement INT,
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	event_distance INT NOT NULL,
	event_heat INT NOT NULL,
	event_lane INT NOT NULL,
	event_mark TIME NOT NULL,
);

CREATE TABLE HighJump_Result(
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	current_disability VARCHAR(3),
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_score INT, -- amount of points won for the club for this performance
	event_placement INT,
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	event_heat INT NOT NULL,
	event_lane INT NOT NULL,
	event_mark VARCHAR(5) NOT NULL, 
);

CREATE TABLE PoleVault_Result(
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	current_disability VARCHAR(3),
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_score INT, -- amount of points won for the club for this performance
	event_placement INT,
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	event_heat INT NOT NULL,
	event_lane INT NOT NULL,
	event_mark VARCHAR(6) NOT NULL, 
);

CREATE TABLE LongJump_Result(
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	current_disability VARCHAR(3),
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_score INT, -- amount of points won for the club for this performance
	event_placement INT,
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	event_heat INT NOT NULL,
	event_lane INT NOT NULL,
	event_mark VARCHAR(6) NOT NULL,
	event_wind DECIMAL(2,1) NOT NULL,
);

CREATE TABLE TripleJump_Result(
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	current_disability VARCHAR(3),
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_score INT, -- amount of points won for the club for this performance
	event_placement INT,
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	event_heat INT NOT NULL,
	event_lane INT NOT NULL,
	event_mark VARCHAR(6),
	event_wind DECIMAL(2,1),
);

CREATE TABLE ShotPut_Result(
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	current_disability VARCHAR(3),
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_score INT, -- amount of points won for the club for this performance
	event_placement INT,
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	event_heat INT NOT NULL,
	event_lane INT NOT NULL,
	event_mark VARCHAR(6),
	implement_weight VARCHAR(7) NOT NULL,
);

CREATE TABLE DiscusThrow_Result(
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	current_disability VARCHAR(3),
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_score INT, -- amount of points won for the club for this performance
	event_placement INT,
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	event_heat INT NOT NULL,
	event_lane INT NOT NULL,
	event_mark VARCHAR(6),
	implement_weight VARCHAR(7) NOT NULL,
);

CREATE TABLE JavelinThrow_Result(
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	current_disability VARCHAR(3),
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_score INT, -- amount of points won for the club for this performance
	event_placement INT,
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	event_heat INT NOT NULL,
	event_lane INT NOT NULL,
	event_mark VARCHAR(6),
	implement_weight VARCHAR(7) NOT NULL,
);

CREATE TABLE HammerThrow_Result(
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	current_disability VARCHAR(3),
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_score INT, -- amount of points won for the club for this performance
	event_placement INT,
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	event_heat INT NOT NULL,
	event_lane INT NOT NULL,
	event_mark VARCHAR(6),
	implement_weight VARCHAR(7) NOT NULL,
);

CREATE TABLE Relay_Result(
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete_1 INT,
	non_member_athlete_1 INT,
	member_athlete_2 INT,
	non_member_athlete_2 INT,
	member_athlete_3 INT,
	non_member_athlete_3 INT,
	member_athlete_4 INT,
	non_member_athlete_4 INT,
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_score INT, -- amount of points won for the club for this performance
	event_placement INT,
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete_1) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete_1) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (member_athlete_2) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete_2) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (member_athlete_3) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete_3) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (member_athlete_4) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete_4) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	total_distance INT NOT NULL,
	event_heat INT NOT NULL,
	event_lane INT NOT NULL,
	event_mark TIME NOT NULL,

);

CREATE TABLE MedleyRelay_Result(
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete_1 INT,
	non_member_athlete_1 INT,
	member_athlete_2 INT,
	non_member_athlete_2 INT,
	member_athlete_3 INT,
	non_member_athlete_3 INT,
	member_athlete_4 INT,
	non_member_athlete_4 INT,
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_score INT, -- amount of points won for the club for this performance
	event_placement INT,
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete_1) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete_1) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (member_athlete_2) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete_2) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (member_athlete_3) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete_3) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (member_athlete_4) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete_4) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),
	-- idk what to put here
	total_distance INT NOT NULL,
	event_heat INT NOT NULL,
	event_lane INT NOT NULL,
	event_mark TIME NOT NULL,
);

/*
CREATE TABLE Triathlon_Result(	
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_placement INT,
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	total_points INT NOT NULL,
);
*/

CREATE TABLE Tetrathlon_Result(
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_placement INT, -- must calculate
	event_score INT, -- must calculate amount of points won for the club for this performance
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	hurdle_result INT NOT NULL,
	hurdle_points INT NOT NULL,
	highjump_result INT NOT NULL,
	highjump_points INT NOT NULL,
	shotput_result INT NOT NULL,
	shotput_points INT NOT NULL,
	dash_result INT NOT NULL,
	dash_points INT NOT NULL,

	FOREIGN KEY(hurdle_result) REFERENCES Hurdles_Result(result_id),
	FOREIGN KEY(highjump_result) REFERENCES HighJump_Result(result_id),
	FOREIGN KEY(shotput_result) REFERENCES ShotPut_Result(result_id),
	FOREIGN KEY(dash_result) REFERENCES Dash_Result(result_id),
);

CREATE TABLE Pentathlon_Result(	
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_placement INT, -- must calculate
	event_score INT, -- must calculate amount of points won for the club for this performance
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	hurdle_result INT NOT NULL,
	hurdle_points INT NOT NULL,
	highjump_result INT NOT NULL,
	highjump_points INT NOT NULL,
	shotput_result INT NOT NULL,
	shotput_points INT NOT NULL,
	longjump_result INT NOT NULL,
	longjump_points INT NOT NULL,
	dash_result INT NOT NULL,
	dash_points INT NOT NULL,

	FOREIGN KEY(hurdle_result) REFERENCES Hurdles_Result(result_id),
	FOREIGN KEY(highjump_result) REFERENCES HighJump_Result(result_id),
	FOREIGN KEY(shotput_result) REFERENCES ShotPut_Result(result_id),
	FOREIGN KEY(longjump_result) REFERENCES LongJump_Result(result_id),
	FOREIGN KEY(dash_result) REFERENCES Dash_Result(result_id),
);

CREATE TABLE Male_Heptathlon_Result(
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_placement INT, -- must calculate
	event_score INT, -- must calculate amount of points won for the club for this performance
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	dash_result INT NOT NULL,
	dash_points INT NOT NULL,
	longjump_result INT NOT NULL,
	longjump_points INT NOT NULL,
	shotput_result INT NOT NULL,
	shotput_points INT NOT NULL,
	highjump_result INT NOT NULL,
	highjump_points INT NOT NULL,
	hurdle_result INT NOT NULL,
	hurdle_points INT NOT NULL,
	polevault_result INT NOT NULL,
	polevault_points INT NOT NULL,
	run_result INT NOT NULL,
	run_points INT NOT NULL,

	FOREIGN KEY(dash_result) REFERENCES Dash_Result(result_id),
	FOREIGN KEY(longjump_result) REFERENCES LongJump_Result(result_id),
	FOREIGN KEY(shotput_result) REFERENCES ShotPut_Result(result_id),
	FOREIGN KEY (highjump_result) REFERENCES HighJump_Result(result_id),
	FOREIGN KEY(hurdle_result) REFERENCES Hurdles_Result(result_id),
	FOREIGN KEY(polevault_result) REFERENCES PoleVault_Result(result_id),
	FOREIGN KEY(run_result) REFERENCES Run_Result(result_id),
);

CREATE TABLE Female_Heptathlon_Result(
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_placement INT, -- must calculate
	event_score INT, -- must calculate amount of points won for the club for this performance
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	hurdle_result INT NOT NULL,
	hurdle_points INT NOT NULL,
	highjump_result INT NOT NULL,
	highjump_points INT NOT NULL,
	shotput_result INT NOT NULL,
	shotput_points INT NOT NULL,
	dash_result INT NOT NULL,
	dash_points INT NOT NULL,
	longjump_result INT NOT NULL,
	longjump_points INT NOT NULL,
	javelinthrow_result INT NOT NULL,
	javelinthrow_points INT NOT NULL,
	run_result INT NOT NULL,
	run_points INT NOT NULL,

	FOREIGN KEY(hurdle_result) REFERENCES Hurdles_Result(result_id),
	FOREIGN KEY (highjump_result) REFERENCES HighJump_Result(result_id),
	FOREIGN KEY(shotput_result) REFERENCES ShotPut_Result(result_id),
	FOREIGN KEY(dash_result) REFERENCES Dash_Result(result_id),
	FOREIGN KEY(longjump_result) REFERENCES LongJump_Result(result_id),
	FOREIGN KEY(javelinthrow_result) REFERENCES JavelinThrow_Result(result_id),
	FOREIGN KEY(run_result) REFERENCES Run_Result(result_id),
);

CREATE TABLE Decathlon_Result(
	result_id INT IDENTITY(1,1) NOT NULL UNIQUE,
	meet_id INT NOT NULL, 
	member_athlete INT,
	non_member_athlete INT,
	division VARCHAR(3) NOT NULL,
	facility_id INT NOT NULL,
	club_affil VARCHAR(4) NOT NULL,
	event_round VARCHAR(1), -- P for prelim, F for final, S for semifinal, Q for quarterfinal
	event_season VARCHAR(1), -- I for indoor, O for outdoor
	event_sex VARCHAR(1) NOT NULL,
	is_active BIT NOT NULL, -- check to see if the athlete's current membership is active
	claimable BIT, -- defaults to true if result belongs to non-member athlete
	event_placement INT, -- must calculate
	event_score INT, -- must calculate amount of points won for the club for this performance
	notes INT NULL,

	PRIMARY KEY (result_id),
	FOREIGN KEY(meet_id) REFERENCES Meet(meet_id),
	FOREIGN KEY (member_athlete) REFERENCES Member_Athlete(ac_num),
	FOREIGN KEY (non_member_athlete) REFERENCES Non_Member_Athlete(athlete_id),
	FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
	FOREIGN KEY (club_affil) REFERENCES Club(club_code),
	FOREIGN KEY (notes) REFERENCES Notes(note_id),

	dash_result INT NOT NULL,
	dash_points INT NOT NULL,
	longjump_result INT NOT NULL,
	longjump_points INT NOT NULL,
	shotput_result INT NOT NULL,
	shotput_points INT NOT NULL,
	highjump_result INT NOT NULL,
	highjump_points INT NOT NULL,
	run_result_1 INT NOT NULL,
	run_points_1 INT NOT NULL,

	hurdle_result INT NOT NULL,
	hurdle_points INT NOT NULL,
	discusthrow_result INT NOT NULL,
	discusthrow_points INT NOT NULL,
	polevault_result INT NOT NULL,
	polevault_points INT NOT NULL,
	javelinthrow_result INT NOT NULL,
	javelinthrow_points INT NOT NULL,
	run_result_2 INT NOT NULL,
	run_points_2 INT NOT NULL,

	FOREIGN KEY(dash_result) REFERENCES Dash_Result(result_id),
	FOREIGN KEY(longjump_result) REFERENCES LongJump_Result(result_id),
	FOREIGN KEY(shotput_result) REFERENCES ShotPut_Result(result_id),
	FOREIGN KEY (highjump_result) REFERENCES HighJump_Result(result_id),
	FOREIGN KEY(run_result_1) REFERENCES Run_Result(result_id),

	FOREIGN KEY(hurdle_result) REFERENCES Hurdles_Result(result_id),
	FOREIGN KEY(discusthrow_result) REFERENCES DiscusThrow_Result(result_id),
	FOREIGN KEY(polevault_result) REFERENCES PoleVault_Result(result_id),
	FOREIGN KEY(javelinthrow_result) REFERENCES JavelinThrow_Result(result_id),
	FOREIGN KEY(run_result_2) REFERENCES Run_Result(result_id),
);


CREATE TRIGGER Calc_Club_Points
ON Dash_Result
AFTER
INSERT,UPDATE
AS
BEGIN
	UPDATE Club
	SET club_points = club_points + (SELECT event_score FROM inserted)
	WHERE club_code = (SELECT club_affil FROM inserted)
END
GO

CREATE TRIGGER Calc_Member_Points
ON Dash_Result
AFTER
INSERT,UPDATE
AS
BEGIN
	DECLARE @Placement AS INT
	DECLARE @Category AS INT
	DECLARE @ChampionshipPoints as INT
	DECLARE @myMeet as INT
	SELECT @myMeet = ((SELECT m1.comp_type FROM Meet m1, inserted ins WHERE m1.meet_id = ins.meet_id))
	SELECT @Category = (SELECT Competition_Category.category_id FROM Competition_Category WHERE Competition_Category.category_id = @myMeet)
	SELECT @Placement = (SELECT event_placement FROM inserted)

	
	IF (@Placement = 1)
		BEGIN
		UPDATE Member_Athlete
		SET total_points = total_points + (SELECT first_place FROM Competition_Category WHERE category_id = @Category)
		END
	ELSE IF (@Placement = 2)
		BEGIN
		UPDATE Member_Athlete
		SET total_points = total_points + (SELECT second_place FROM Competition_Category WHERE category_id = @Category)
		END
	ELSE IF (@Placement = 3)
		BEGIN
		UPDATE Member_Athlete
		SET total_points = total_points + (SELECT third_place FROM Competition_Category WHERE category_id = @Category)
		END
END
GO

SELECT * FROM Club
SELECT * FROM Meet
SELECT * FROM Facility
SELECT * FROM Competition_Category
SELECT * FROM Member_Athlete
SELECT * FROM Dash_Result

INSERT INTO Club (club_code, club_name, club_points)
VALUES ('BLUE', 'Blue Devils Athletics Club', 0)

INSERT INTO Facility(facility_name, street_address, city, province, postal_code, lat, long, contact)
VALUES ('Toronto Track and Field Centre', '231 Ian MacDonald Blvd,', 'North York', 'ON', 'M7A 2C5', 43.777492, -79.50721, 'https://www.toronto.ca/data/parks/prd/facilities/complex/460/index.html')

INSERT INTO Competition_Category(comp_level, comp_type, first_place, second_place, third_place)
VALUES ('National', 'Championships', 8, 4, 2)

INSERT INTO Meet(primary_name, secondary_name, starts_on, ends_on, facility_id, comp_type, schedule_link)
VALUES('2021 Ontario Championships', 'U18 Championships', '2021-08-07',  '2021-08-08', 1, 1, 'fakelink')

INSERT INTO Member_Athlete(ac_num, fname, lname, dob, sex, current_club, member_since, is_active, total_points)
VALUES (0756198, 'Sydney', 'Daniels', '2007-05-23', 'F', 'BLUE', '2004-01-20', 1, 0)

INSERT INTO Dash_Result(meet_id, member_athlete, division, facility_id, club_affil, event_round, event_season, event_sex, is_active, claimable, event_score, event_placement, event_distance, event_wind, event_heat, event_lane, event_mark)
VALUES(1, 0756198, 'U18', 1, 'BLUE', 'F', 'O', 'F', 1, 0, 6, 1, 400,-0.4 , 2, 7, '00:01:07.66')