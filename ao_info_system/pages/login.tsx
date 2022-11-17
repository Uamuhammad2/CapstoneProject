import { Button, Form, Input } from "antd";
import Image from 'next/image'
import { LoginLayout } from "../components/layouts";
import { NextPageWithLayout } from "./_app";

import logo from "../public/logo.png"

const Login : NextPageWithLayout = () =>{
    //TODO move styling to css file
    return <div style={{
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        height: "100vh"
    }}>
        <Form style={{width: "50vw", height: "50vh"}}>
        <Image src={logo} alt="logo"/>
    <Form.Item label="Username"><Input/></Form.Item>
    <Form.Item label="Password"><Input.Password/></Form.Item>
    <Form.Item><Button type="primary" htmlType='submit'>Submit</Button></Form.Item>
  </Form>
  </div>
}

Login.getLayout = LoginLayout;

export default Login;