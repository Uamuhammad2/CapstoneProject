# Tables

## Club
Information about clubs should be given through a Trackie API and updated infrequently (maybe after creating a new meet tuple)
- club_code (PK)
  - 4 letter abbreviation of the club name
- club_name
  - the club's full name (max 50 characters)
- club_points
  - the total of all *_Result(event_score) for each tuple containing this club_code in the *Result(club_affil) field
  - club points are only valid for the year, so the field should be set to 0 on Jan 01 of every year

## Facility

## Notes

## Member_Athlete

## Non_Mmeber_Athlete

## Competition_Category

## Meet

# *Results Tables*

## Dash_Result

## Run_Result

## Hurdles_Result

## SteepleChase_Result

## RaceWalk_Result

## Highjump_Result

## PoleVault_Result

## LongJump_Result

## TripleJump_Result

## ShotPut_Result

## Discus_Throw Result

## JavelinThrow_Result

## HammerThrow_Result

## Relay_Result

## MedleyRelay_Result

## Tetrathlon_Result

## Pentathlon_Result

## Male_Heptathlon_Result

## Female_Heptathlon_Result

## Decathlon_Result
