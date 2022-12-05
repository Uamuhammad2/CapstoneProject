import { Typography, Dropdown, Button, Space, Input, Tag, Table, Modal, Form, DatePicker, Select } from 'antd';
import { DownOutlined, PlusOutlined } from '@ant-design/icons';
import type { NextPage } from 'next'
import { ColumnsType } from 'antd/lib/table';
import { IMember } from '../types/mdb';
import moment from 'moment';
import { MenuProps } from 'rc-menu';
const { Title } = Typography;
import { useState } from "react";
import { cloneDeep, isEqual, random, uniqueId } from "lodash";
import { Option } from 'antd/lib/mentions';


const Competition: NextPage = () => {

    const apiData: IMember[] = [
        {
            id: '1',
            firstname: 'Pearl',
            lastname: 'Ryan',
            dob: new Date(),
            gender: 'Male',
            club: 'Blue Devils Athletics Club',
            role: 'U20'
        },
        {
            id: '2',
            firstname: 'Harriet',
            lastname: 'Campbell',
            dob: new Date(),
            gender: 'Male',
            club: 'Blue Devils Athletics Club',
            role: 'U16'
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
        { label: 'Search by Name', key: 'firstname' }, // remember to pass the key prop
        { label: 'Search by Member#', key: 'id' },
    ];

    const columns: ColumnsType<IMember> = [
        {
            title: 'First Name',
            dataIndex: 'firstname',
            key: 'firstname'
        },
        {
            title: 'Last Name',
            dataIndex: 'lastname',
            key: 'lastname',
        },
        {
            title: 'DOB',
            dataIndex: 'dob',
            key: 'dob',
            render: (v) => moment(v).format("YYYY-MM-DD")
        },
        {
            title: 'Gender',
            dataIndex: 'gender',
            key: 'gender',
        },
        {
            title: 'Club',
            dataIndex: 'club',
            key: 'club',
        },
        {
            title: 'Role',
            dataIndex: 'role',
            key: 'role',
        },
        {
            title: 'Action',
            key: 'action',
            render: (_, record, index) => (
                <Space size="middle">
                    <a onClick={(e) => handleEdit(record, index)}>View</a>
                    <a>Update Note</a>
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

    const handleEdit = (record: IMember, index: number) => {
        setEditIndex(index);
        let r = cloneDeep(record);
        r.dob = moment(r.dob);
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
                    <Button type="text">
                        Export
                    </Button>
                    <Button
                        type="primary"
                        icon={<PlusOutlined />}
                        onClick={showModal}
                    >
                        Add New Members
                    </Button>
                </div>
            </div>
            <br />
            <Table rowKey="id" columns={columns} dataSource={filteredData} />
            <Modal visible={visible} onOk={form.submit} onCancel={handleCancel}>
                <Form form={form} onFinish={handleSubmit} labelCol={{ span: 8 }}
                    wrapperCol={{ span: 16 }}>
                    <Form.Item name="id">
                        <Input type="hidden" />
                    </Form.Item>
                    <Form.Item label="First Name" name="firstname">
                        <Input />
                    </Form.Item>
                    <Form.Item label="Last Name" name="lastname">
                        <Input />
                    </Form.Item>
                    <Form.Item name="dob" label="DOB" >
                        <DatePicker />
                    </Form.Item>
                    <Form.Item name="gender" label="Gender" rules={[{ required: false }]}>
                        <Select>
                            <Option value="male">male</Option>
                            <Option value="female">female</Option>
                            <Option value="other">other</Option>
                        </Select>
                    </Form.Item>
                    <Form.Item label="Club" name="club">
                        <Input />
                    </Form.Item>
                    <Form.Item label="Role" name="role">
                        <Input />
                    </Form.Item>
                </Form>

            </Modal>
        </>
    )
}

export default Competition
