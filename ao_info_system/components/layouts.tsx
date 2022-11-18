import { Layout } from "antd";
import { Header, Content } from "antd/lib/layout/layout";
import { ReactNode } from "react";
import FooterComponent from "./layout/footer";
import SiderComponent from "./layout/sider";

import styles from "../styles/layout/main.module.css"

export function DefaultLayout(page : ReactNode){
return <Layout className={styles.layout} hasSider>
  <SiderComponent />
  <Layout>
    <Header>header</Header>
    <Content className={styles.content}>{page}</Content>
    <FooterComponent />
  </Layout>
  </Layout>
}

export function LoginLayout(page : ReactNode){
    return <Layout>
    <Content>
    {page}
    </Content>
</Layout>;
}