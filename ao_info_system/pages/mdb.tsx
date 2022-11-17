import type { NextPage } from 'next'

import MDBReader from 'mdb-reader'

import React, { FunctionComponent } from 'react'
import { Athlete, Division, Entry, Meet, Result, Team } from '../types/mdb'
import { Button, Dropdown, Form, Input, Space, Table, Tabs, Upload, UploadFile, UploadProps } from 'antd';
import { Tab } from 'rc-tabs/lib/interface';

function RenderTable(props : any){
    if(Object.keys(props.db).length == 0){
        return <h1>Invalid State</h1>
    }
    const mdb = props.db as MDBReader;
    const name = props.name as string;
    const table = mdb.getTable(name);

    const dataSource = table.getData().map((e, index) => {
        return {
            ...e,
            key: props.id == "_index" ? index : e[props.id]
        }
    })
    const cols = table.getColumnNames().map((name, index) =>{
        return {title: name,
            dataIndex: name,
            key: name
        }
    })
    return <Table dataSource={dataSource} columns={cols}/>
}

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

    const [fileList, setFileList] = React.useState<UploadFile[]>([]);

    const uploadProps : UploadProps = {
        multiple: false,
        onChange: info =>{
            let newList = [...info.fileList];
            newList = newList.slice(-1);
            setFileList(newList);
            if(newList.length == 0){
                setDb({});
            }
        },
        beforeUpload: file =>{
            const reader = new FileReader();
    
            reader.onload = (result) =>{
                let data : ArrayBuffer = result.target?.result as ArrayBuffer;
    
                if(data){
                    setDb(new MDBReader(Buffer.from(data)))
                }
            }
    
            reader.readAsArrayBuffer(file);
            return false;
        }
    }

    const tabItems: Tab[] = [
        {
            key: "1",
            label: "Athletes",
            children: <RenderTable db={db} name="Athlete" id="Ath_no"/>
        },
        {
            key: "2",
            label: "Divisions",
            children: <RenderTable db={db} name="Divisions" id="Div_no"/>
        },
        {
            key: "3",
            label: "Entries",
            children: <RenderTable db={db} name="Entries" id="_index"/>
        },
        {
            key: "4",
            label: "Meet",
            children: <RenderTable db={db} name="Meet" id="Meet_name"/>
        },
        {
            key: "5",
            label: "Results",
            children: <RenderTable db={db} name="Results" id="_index"/>
        },
        {
            key: "6",
            label: "Teams",
            children: <RenderTable db={db} name="Team" id="Team_no"/>
        },
    ];

  return (
    <div>
        <Form
        name="basic"
        >
            <Form.Item label="MDB File:" name="file">
                <Upload {...uploadProps} fileList={fileList}><Button>Select File</Button></Upload>
            </Form.Item>
        </Form>
        <Tabs items = {tabItems} hidden={!Object.keys(db).length}/>
    </div>
  )
}

export default Home
