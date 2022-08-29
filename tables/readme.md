### to do
write TRIGGERS to update Club(club_points) and Member_Athlete(total_points) AFTER INSERT into any of the * _Results tables

# Tables

## Club
Information about clubs should be given through a Trackie API and updated infrequently (maybe after creating a new meet tuple)
- club_code (PK)
  - 4 letter abbreviation of the club name
- club_name
  - the club's full name (max 50 characters)
- club_points
  - the total of all *_Result(event_score) for each tuple containing this club_code in the * Result(club_affil) field
  - require a TRIGGER to update this field when a new result tuple is entered
  - club points are only valid for the year, so the field should be set to 0 on Jan 01 of every year

## Facility
Unsure if Trackie provides information on facilities. May have to be updated manually as there aren't many facilities in Ontario and new ones rarely come up
- attributes are self explanatory
- long/lat attribute is for calculating distance

## Notes
whenever a note is required, a new note tuple is created and associated to the table who required it.
all tables use the same Note table to store their notes

## Member_Athlete
an athlete that is associated with Athletics Canada and has an AC number
Trackie API will be provided to populate all fields except total_points

- total points
  - Top x Athletes under certain competition tiers are awarded n points based on their standing and the tier of competition
  - this field is the total of the points they earned in the current year
  - clarified under Competition_Category(award)
  - points are only valid for the year, so the field should be set to 0 on Jan 01 of every year

## Non_Mmeber_Athlete
whenever a result without an AC number attached is read from the mdb, a new Non_Mmeber_Athlete tuple is created with all attributes grabbed from the mdb entry

## Competition_Category
a table of championship awards will be provided by AO outlining the level/scale of tournaments as well as their type and the amount of points each placement is awarded
- comp_level
  - International, National, Provincial, etc
- comp_type
  - Olympic, Championship, etc
- the following fields store INT values denoting the amount of points awarded for that placing
- when a new result tuple is created, a TRIGGER must fire to update that athlete's championship points

## Meet
still unsure of how this will be created, it may need to be done manually by an admin
- schedule_link will
  - a hyperlink to a pdf with the event schedule 

# *Results Tables*
each result will have similar fields denoting generic data about the meet/athlete/etc
mdb.Results(Event_name) will denote which table the result is entered in to

- meet_id
  - match mdb.Meet(Meet_name) to dbo.Meet(primary_name) to get the dbo.meet_id
- member_athlete
  - if mdb.Results(Reg_no) exists, it should match to an athlete in our database
  - else, it should be left NULL
- non_member_athlete
  - NULL if member_athlete is NOT NULL
  - else create a new Non_Member_Athlete tuple and associate that id here
- division
  - for athletes under 30, division is calculated as current_year - birth_year
  - for athletes over 30, division is calculated as DATEDIFF(year, (SELECT dob FROM dbo.MemberAthlete WHERE dbo.MemberAthlete(ac_num) = currentResult(Reg_no)), mdb.Meet(Meet_start))
  - ie. current_date - birth_date
- facility_id
  - match the facility name with the one in the database and input the id here
- club_affil
  - 4 character club code matches to one in the database
- event_round
  - P for preliminary, F for final, S for semifinal, Q for quaterfinal
- event_season
  - I for indoor, O for outdoor, matched with the meet
- event_sex
  - mdb.Results(Event_gender)
- is_active
  - check whether the current athlete's membership is currently active
- claimable
  - the default is 1 (true) and is set to false if a claim attempt has been made and declined
- event_score
  - the amount of points this performance won for their club - TRIGGER will use this for calculations
- event_placement
- notes

## Dash_Result
- event_distance
  - mdb.Results(Event_dist)
- event_wind
  - mdb.Results(Res_wind)
- event_heat
  - mdb.Results(Res_heat)
- event_lane
  - mdb.Results(Res_lane)
- event_mark
  - mdb.Results(Res_mark) - given in seconds.miliseconds
  - need to convert to [time](https://docs.microsoft.com/en-us/sql/t-sql/data-types/time-transact-sql?view=sql-server-ver16) format before entering


## Run_Result
- event_distance
  - mdb.Results(Event_dist)
- event_heat
  - mdb.Results(Res_heat)
- event_lane
  - mdb.Results(Res_lane)
- event_mark
  - mdb.Results(Res_mark) - given in minutes:seconds.miliseconds
  - need to convert to [time](https://docs.microsoft.com/en-us/sql/t-sql/data-types/time-transact-sql?view=sql-server-ver16) format before entering


## Hurdles_Result
- event_distance
  - mdb.Results(Event_dist)
- event_hurdle_height
  - mdb.Results(Event_note)
- event_wind
  - mdb.Results(Res_wind)
  - 400m hurdles has no wind
- event_heat
  - mdb.Results(Res_heat)
- event_lane
  - mdb.Results(Res_lane)
- event_mark
  - mdb.Results(Res_mark) - given in seconds.miliseconds OR minutes:seconds.miliseconds
  - need to convert to [time](https://docs.microsoft.com/en-us/sql/t-sql/data-types/time-transact-sql?view=sql-server-ver16) format before entering

## SteepleChase_Result
- event_distance
  - mdb.Results(Event_dist)
- event_hurdle_height
  - mdb.Results(Event_note)
- event_heat
  - mdb.Results(Res_heat)
- event_lane
  - mdb.Results(Res_lane)
- event_mark
  - mdb.Results(Res_mark) - given in minutes:seconds.miliseconds
  - need to convert to [time](https://docs.microsoft.com/en-us/sql/t-sql/data-types/time-transact-sql?view=sql-server-ver16) format before entering

## RaceWalk_Result
- event_distance
  - mdb.Results(Event_dist)
- event_heat
  - mdb.Results(Res_heat)
- event_lane
  - mdb.Results(Res_lane)
- event_mark
  - mdb.Results(Res_mark) - given in minutes:seconds.miliseconds
  - need to convert to [time](https://docs.microsoft.com/en-us/sql/t-sql/data-types/time-transact-sql?view=sql-server-ver16) format before entering

## Highjump_Result
- event_heat
  - mdb.Results(Res_heat)
- event_lane
  - mdb.Results(Res_lane)
- event_mark
  - mdb.Results(Res_mark)
## PoleVault_Result
- event_heat
  - mdb.Results(Res_heat)
- event_lane
  - mdb.Results(Res_lane)
- event_mark
  - mdb.Results(Res_mark)
## LongJump_Result
- event_heat
  - mdb.Results(Res_heat)
- event_lane
  - mdb.Results(Res_lane)
- event_mark
  - mdb.Results(Res_mark)
- - event_wind
  - mdb.Results(Res_wind)
## TripleJump_Result
- event_heat
  - mdb.Results(Res_heat)
- event_lane
  - mdb.Results(Res_lane)
- event_mark
  - mdb.Results(Res_mark)
- event_wind
  - mdb.Results(Res_wind)
## ShotPut_Result
- event_heat
  - mdb.Results(Res_heat)
- event_lane
  - mdb.Results(Res_lane)
- event_mark
  - mdb.Results(Res_mark)
- implement_weight
  - mdb.Results(Event_note)
## Discus_Throw Result
- event_heat
  - mdb.Results(Res_heat)
- event_lane
  - mdb.Results(Res_lane)
- event_mark
  - mdb.Results(Res_mark)
- implement_weight
  - mdb.Results(Event_note)
## JavelinThrow_Result
- event_heat
  - mdb.Results(Res_heat)
- event_lane
  - mdb.Results(Res_lane)
- event_mark
  - mdb.Results(Res_mark)
- implement_weight
  - mdb.Results(Event_note)
## HammerThrow_Result
- event_heat
  - mdb.Results(Res_heat)
- event_lane
  - mdb.Results(Res_lane)
- event_mark
  - mdb.Results(Res_mark)
- implement_weight
  - mdb.Results(Event_note)
## Relay_Result
- total_distance
  - mdb.Results(Event_dist)
- event_heat
  - mdb.Results(Res_heat)
- event_lane
  - mdb.Results(Res_lane)
- event_mark
  - mdb.Results(Res_mark) - given in minutes:seconds.miliseconds
  - need to convert to [time](https://docs.microsoft.com/en-us/sql/t-sql/data-types/time-transact-sql?view=sql-server-ver16) format before entering
## MedleyRelay_Result
- total_distance
  - mdb.Results(Event_dist)
- event_heat
  - mdb.Results(Res_heat)
- event_lane
  - mdb.Results(Res_lane)
- event_mark
  - mdb.Results(Res_mark) - given in minutes:seconds.miliseconds
  - need to convert to [time](https://docs.microsoft.com/en-us/sql/t-sql/data-types/time-transact-sql?view=sql-server-ver16) format before entering
## Tetrathlon_Result

## Pentathlon_Result

## Male_Heptathlon_Result

## Female_Heptathlon_Result

## Decathlon_Result
