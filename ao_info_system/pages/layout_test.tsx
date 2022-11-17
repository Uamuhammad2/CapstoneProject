import { Layout } from "antd";
import { NextPageWithLayout } from "./_app";


const Login : NextPageWithLayout = () =>{
    return <h1>Test</h1>
}

Login.getLayout = (page) =>{
    return <Layout>
        {page}
    </Layout>;
}

export default Login;