import type { NextPage } from 'next'

import MDBReader, { Table } from 'mdb-reader'

import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'
import React, { FunctionComponent } from 'react'
import { Athlete, Division, Entry, Meet, Result, Team } from '../types/mdb'

interface RenderProps {
    current : number;
    mdb : any;
}

interface TableProps{
    table : Table;
}

interface TableData{
    tableName : string;
    friendlyName :string;
    component : FunctionComponent<TableProps>;
}

const TABLES : TableData[] = [
    {
        tableName: "Athlete",
        friendlyName: "Athletes",
        component: AthletesTable
    },
    {
        tableName: "Divisions",
        friendlyName: "Divisions",
        component: DivisionsTable
    },
    {
        tableName: "Entries",
        friendlyName: "Entries",
        component: EntriesTable
    },
    {
        tableName: "Meet",
        friendlyName: "Meet",
        component: MeetsTable
    },
    {
        tableName: "Results",
        friendlyName: "Results",
        component: ResultsTable
    },
    {
        tableName: "Team",
        friendlyName: "Teams",
        component: TeamsTable
    }
];

function AthletesTable(props : TableProps){
    const rows = props.table.getData() as unknown as Athlete[];
    return <table>
        <thead>
            <tr>
                <th colSpan={5}>Athletes</th>
            </tr>
            <tr>
                <th>ID #</th>
                <th>Sex</th>
                <th>Age</th>
                <th>First Name</th>
                <th>Last Name</th>
            </tr>
        </thead>
        <tbody>
        {rows.map( (a) => <tr key = {a.Ath_no}>
            <td>{a.Ath_no}</td>
            <td>{a.Ath_Sex}</td>
            <td>{a.Ath_age}</td>
            <td>{a.First_name}</td>
            <td>{a.Last_name}</td>
        </tr>)}
        </tbody>
    </table>;
}

function DivisionsTable(props : TableProps){
    const rows = props.table.getData() as unknown as Division[];
    return <table>
        <thead>
            <tr>
                <th colSpan={5}>Divisions</th>
            </tr>
            <tr>
                <th>ID #</th>
                <th>Name</th>
            </tr>
        </thead>
        <tbody>
        {rows.map( (div) => <tr key = {div.Div_no}>
            <td>{div.Div_no}</td>
            <td>{div.Div_name}</td>
        </tr>)}
        </tbody>
    </table>;
}

function EntriesTable(props : TableProps){
    const rows = props.table.getData() as unknown as Entry[];
    return <table>
        <thead>
            <tr>
                <th colSpan={9}>Entries</th>
            </tr>
            <tr>
                <th colSpan={4}>IDs</th>
                <th colSpan={6}>Data</th>
            </tr>
            <tr>
                <th>Athlete #</th>
                <th>Competition #</th>
                <th>Team #</th>
                <th>Division #</th>

                <th>Event Name</th>
                <th>Full Name</th>
                <th>Gender</th>
                <th>Team</th>
                <th>Athlete Name</th>
            </tr>
        </thead>
        <tbody>
        {rows.map( (e, index) => <tr key = {index}>
            <td>{e.Ath_no}</td>
            <td>{e.Comp_no}</td>
            <td>{e.Team_no}</td>
            <td>{e.Div_no}</td>

            <td>{e.Event_name}</td>
            <td>{e.Full_Eventname}</td>
            <td>{e.Event_gender}</td>
            <td>{e.Team_Abbr}</td>
            <td>{e.First_name} {e.Last_name}</td>
        </tr>)}
        </tbody>
    </table>;
}

function MeetsTable(props : TableProps){
    const rows = props.table.getData() as unknown as Meet[];
    return <table>
        <thead>
            <tr>
                <th colSpan={4}>Meet</th>
            </tr>
            <tr>
                <th>Start</th>
                <th>End</th>
                <th>Name</th>
                <th>Location</th>
            </tr>
        </thead>
        <tbody>
        {rows.map( (e, index) => <tr key = {index}>
            <td>{e.Meet_start.toDateString()}</td>
            <td>{e.Meet_end.toDateString()}</td>
            <td>{e.Meet_name}</td>
            <td>{e.Meet_location}</td>
        </tr>)}
        </tbody>
    </table>;
}

function ResultsTable(props : TableProps){
    const rows = props.table.getData() as unknown as Result[];
    return <table>
        <thead>
            <tr>
                <th colSpan={9}>Entries</th>
            </tr>
            <tr>
                <th colSpan={4}>IDs</th>
                <th colSpan={7}>Data</th>
            </tr>
            <tr>
                <th>Athlete #</th>
                <th>Competition #</th>
                <th>Team #</th>
                <th>Division #</th>

                <th>Event Name</th>
                <th>Full Name</th>
                <th>Gender</th>
                <th>Team</th>
                <th>Athlete Name</th>
                <th>Place</th>
            </tr>
        </thead>
        <tbody>
        {rows.map( (e, index) => <tr key = {index}>
            <td>{e.Ath_no}</td>
            <td>{e.Comp_no}</td>
            <td>{e.Team_no}</td>
            <td>{e.Div_no}</td>

            <td>{e.Event_name}</td>
            <td>{e.Full_Eventname}</td>
            <td>{e.Event_gender}</td>
            <td>{e.Team_Abbr}</td>
            <td>{e.First_name} {e.Last_name}</td>
            <td>{e.Res_place}</td>
        </tr>)}
        </tbody>
    </table>;
}

function TeamsTable(props : TableProps){
    const rows = props.table.getData() as unknown as Team[];
    return <table>
        <thead>
            <tr>
                <th colSpan={3}>Teams</th>
            </tr>
            <tr>
                <th>#</th>
                <th>Abr.</th>
                <th>Name</th>
            </tr>
        </thead>
        <tbody>
        {rows.map( (e, index) => <tr key = {index}>
            <td>{e.Team_no}</td>
            <td>{e.Team_abbr}</td>
            <td>{e.Team_name}</td>
        </tr>)}
        </tbody>
    </table>;
}

const RenderTable : NextPage<RenderProps> = (props) =>{
    const mdb = props.mdb as MDBReader;
    if(!mdb || Object.keys(mdb).length == 0){
        return <h1>Please select a file!</h1>;
    }
    const current = TABLES[props.current];
    return current.component({table: mdb.getTable(current.tableName)});
};

const Home: NextPage = () => {

    const [db, setDb] = React.useState({});
    const [selected, setSelected] = React.useState(0);

    function onUpload(event: React.ChangeEvent<HTMLInputElement>){
        if(event.target.files){
            const file = event.target.files[0];
            console.log(event.target.files[0])
            const reader = new FileReader();
    
            reader.onload = (result) =>{
                let data : ArrayBuffer = result.target?.result as ArrayBuffer;
    
                if(data){
                    setDb(new MDBReader(Buffer.from(data)))
                }
            }
    
            reader.readAsArrayBuffer(file);
        }
    }

    function onTableChange(event : React.ChangeEvent<HTMLSelectElement>) {
        setSelected(event.target.value as unknown as number)
    }

  return (
    <div className={styles.container}>
        <form>
            <input type="file" onChange={onUpload} accept=".mdb"/> <br/>
            <select onChange={onTableChange} value={selected}>
                {TABLES.map((table, index) => <option key={index} value={index}>{table.friendlyName}</option>)}
            </select>
        </form>
        <RenderTable mdb={db} current = {selected}/>
    </div>
  )
}

export default Home
