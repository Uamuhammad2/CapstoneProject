//These are the interfaces defining what is contained within an mdb file.
import moment from 'moment';
export interface Athlete {
    Ath_no : number;
    Ath_Sex : string;
    Ath_age: number;
    First_name : string;
    Last_name : string;

    //TODO rest of data
}

export interface Division{
    Div_name : string;
    Div_no : number;

    //TODO rest of data
}

export interface Entry{
    Ath_no : number;
    Comp_no : number;
    Team_no : number;
    Div_no : number;

    Event_name : string;
    Full_Eventname : string;
    Event_gender : string;
    Team_Abbr : string;
    First_name : string;
    Last_name : string;

    //TODO rest of data
}

export interface Meet{
    Meet_start : Date;
    Meet_end : Date;
    Meet_header1 : string;
    Meet_header2 : string;
    Meet_location : string;
    Meet_name : string;
}

export interface Result{
    Ath_no : number;
    Comp_no : number;
    Div_no : number;

    Event_gender : string;
    Event_name : string;
    Full_Eventname : string;

    First_name : string;
    Last_name : string;

    Reg_no : string;

    //relay data

    Res_place : number;
    Team_Abbr : string;
    Team_no : number;

    //TODO get rest of data
}

export interface Team {
    Team_no: number;
    Team_abbr : string;
    Team_name : string;
    //TODO get rest of data
}
export interface ICompetition {

    id: any;
    name: string
    subname: string
    start: Date | moment
    end: Date | moment
    event: string
    facility: string
    location: string
    comptype: string
    compsubtype: string
    season: string
}

export interface IMember {

    id: string
    firstname: string
    lastname: string
    dob: Date | moment
    gender: 'Male' | 'Female'
    club: string
    role: string
}