import { DownOutlined, PlusOutlined } from '@ant-design/icons';
import { Button, Dropdown, Input, Space, Table, Typography, Form, DatePicker, Select, Modal } from 'antd';
import { Option } from 'antd/lib/mentions';
import { ColumnsType } from 'antd/lib/table';
import { cloneDeep, uniqueId } from 'lodash';
import moment from 'moment';
import type { NextPage } from 'next';
import { MenuProps } from 'rc-menu';
import { useState } from "react";
import { ICompetition } from '../types/mdb';

const { Title } = Typography;



const Competition: NextPage = () => {

    const apiData: ICompetition[] = [
        {
            id: 1,
            name: 'John',
            subname: 'Brown',
            start: new Date(),
            end: new Date(),
            event: 'event 1',
            facility: 'facility 1',
            location: 'location 1',
            comptype: 'Type 1',
            compsubtype: 'Sub type 1',
            season: 'season 1',
        },
        {
            id: 2,
            name: 'Bob',
            subname: 'Doe',
            start: new Date(),
            end: new Date(),
            event: 'event 2',
            facility: 'facility 2',
            location: 'location 2',
            comptype: 'Type 2',
            compsubtype: 'Sub type 2',
            season: 'season 2',
        },
    ];

    const [filterKey, setfilterKey] = useState('Filter');
    const [searchInput, setSearchInput] = useState('');
    const [data, setData] = useState(cloneDeep(apiData));
    const [filteredData, setFilteredData] = useState(cloneDeep(data));
    const [visible, setVisible] = useState(false);
    const [editIndex, setEditIndex] = useState(-1);
    const [form] = Form.useForm();
    const items = [
        { label: 'Search by Name', key: 'name' }, // remember to pass the key prop
        { label: 'Search by SubName', key: 'subname' },
        { label: 'Search by CompType', key: 'comptype' },
    ];

    const columns: ColumnsType<ICompetition> = [
        {
            title: 'Name',
            dataIndex: 'name',
            key: 'name'
        },
        {
            title: 'SubName',
            dataIndex: 'subname',
            key: 'subname',
        },
        {
            title: 'StartDay',
            dataIndex: 'start',
            key: 'start',
            render: (v) => moment(v).format("YYYY-MM-DD")
        },
        {
            title: 'EndDay',
            dataIndex: 'end',
            key: 'end',
            render: (v) => moment(v).format("YYYY-MM-DD")
        },
        {
            title: 'Event',
            dataIndex: 'event',
            key: 'event',
        },
        {
            title: 'Facility',
            dataIndex: 'facility',
            key: 'facility',
        },
        {
            title: 'Location',
            dataIndex: 'location',
            key: 'location',
        },
        {
            title: 'CompType',
            dataIndex: 'comptype',
            key: 'comptype',
        },
        {
            title: 'CompSubType',
            dataIndex: 'compsubtype',
            key: 'compsubtype',
        },
        {
            title: 'Season',
            dataIndex: 'season',
            key: 'season',
        },
        {
            title: 'Action',
            key: 'action',
            render: (_, record, index) => (
                <Space size="middle">
                    <a onClick={(e) => handleEdit(record, index)}>Update</a>
                    <a>Upload</a>
                    <a>Delete</a>
                </Space>
            ),
        },
    ];

    const handleMenuClick: MenuProps['onClick'] = e => {
        setfilterKey(e.key);
    };

    const onChangeInput: any = (e: any) => {
        setSearchInput(e.target.value);
    };

    const onSearch: any = (e?: any) => {
        console.log(data);
        let filtered = data.filter((r: any) => r[filterKey] && r[filterKey].toLowerCase().indexOf((searchInput || '').toLowerCase()) > -1);
        setFilteredData(filtered);
    };

    const showModal = () => {
        setVisible(true)
    }

    const handleSubmit = (values: any) => {
        console.log(values)
        if (editIndex > -1) {
            //edit case
            let i = data.findIndex(r => r.id == values.id);
            if (i > -1) {
                data[i] = values;
            }
            setEditIndex(-1);
        } else {
            // add case
            values.id = uniqueId('id-');
            data.push(values);
        }
        setData(cloneDeep(data));
        setFilteredData(cloneDeep(data));
        handleCancel();
    }

    const handleCancel = () => {
        setVisible(false)
        form.resetFields()
    };

    const handleEdit = (record: ICompetition, index: number) => {
        setEditIndex(index);
        let r = cloneDeep(record);
        r.start = moment(r.start);
        r.end = moment(r.end);
        form.setFieldsValue(r);
        setVisible(true);
    }

    return (
        <>
            <Title>Athletics Ontario Admin System</Title>
            <div className='flex-space-between'>
                <div className='flex-center'>
                    <Dropdown menu={{ items, onClick: handleMenuClick }}>
                        <Button>
                            <Space>
                                {filterKey}
                                <DownOutlined />
                            </Space>
                        </Button>
                    </Dropdown>
                    <Input placeholder="Search" onChange={onChangeInput} />
                    <Button type="primary" onClick={onSearch}>Search</Button>
                </div>
                <div>
                    <Button
                        type="primary"
                        icon={<PlusOutlined />}
                        onClick={showModal}
                    >
                        Add Competition
                    </Button>
                </div>
            </div>
            <br />
            <Table rowKey="name" columns={columns} dataSource={filteredData} />
            <Modal visible={visible} onOk={form.submit} onCancel={handleCancel}>
                <Form form={form} onFinish={handleSubmit} labelCol={{ span: 8 }}
                    wrapperCol={{ span: 16 }}>
                    <Form.Item name="id">
                        <Input type="hidden" />
                    </Form.Item>
                    <Form.Item label="Name" name="name">
                        <Input />
                    </Form.Item>
                    <Form.Item label="Sub Name" name="subname">
                        <Input />
                    </Form.Item>
                    <Form.Item name="start" label="Start" >
                        <DatePicker />
                    </Form.Item>
                    <Form.Item name="end" label="End" >
                        <DatePicker />
                    </Form.Item>
                    <Form.Item name="facility" label="Facility" >
                        <Input />
                    </Form.Item>
                    <Form.Item name="location" label="Location" >
                        <Input />
                    </Form.Item>
                    <Form.Item name="comptype" label="Comptype" >
                        <Input />
                    </Form.Item>
                    <Form.Item name="compsubtype" label="Compsubtype" >
                        <Input />
                    </Form.Item>
                    <Form.Item name="season" label="Season" >
                        <Input />
                    </Form.Item>
                </Form>

            </Modal>
        </>
    )
}

export default Competition
