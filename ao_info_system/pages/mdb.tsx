import type { NextPage } from 'next'

import MDBReader, { Table } from 'mdb-reader'

import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'
import React from 'react'

interface RenderProps {
    mdb : any;
}

interface TableProps{
    table : Table;
}

//these should probably be in their own file
interface Athlete {
    Ath_no : number;
    Ath_Sex : string;
    Ath_age: number;
    First_name : string;
    Last_name : string;
}

interface Divisions{
    
}

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

const RenderTable : NextPage<RenderProps> = (props) =>{
    const mdb = props.mdb as MDBReader;
    if(!mdb || Object.keys(mdb).length == 0){
        return <h1>Please select a file!</h1>;
    }
    console.log(mdb.getTableNames());
    console.log(mdb.getTable("Athlete").getData());
    return <div>
        <AthletesTable table= {mdb.getTable("Athlete")}/>
    </div>;
};

const Home: NextPage = () => {

    const [db, setDb] = React.useState({});

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

  return (
    <div className={styles.container}>
        <form>
            <input type="file" onChange={onUpload} accept=".mdb"/>
        </form>
        <RenderTable mdb={db} />
    </div>
  )
}

export default Home
