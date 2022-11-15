import type { NextPage } from 'next'

import MDBReader from 'mdb-reader'

import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'

function myfunc(event: React.ChangeEvent<HTMLInputElement>){
    if(event.target.files){
        const file = event.target.files[0];
        console.log(event.target.files[0])
        const reader = new FileReader();

        reader.onload = (result) =>{
            let data : ArrayBuffer = result.target?.result as ArrayBuffer;

            if(data){
                const mdb = new MDBReader(Buffer.from(data));
                console.log(mdb);
                console.log(mdb.getTableNames());
            }
        }

        reader.readAsArrayBuffer(file);
    }
}

const Home: NextPage = () => {
  return (
    <div className={styles.container}>
        <form>
            <input type="file" onChange={myfunc} accept=".mdb"/>
        </form>
    </div>
  )
}

export default Home
