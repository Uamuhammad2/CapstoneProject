import '../styles/globals.css'
import type { AppProps } from 'next/app'
import Layout, { Content, Footer, Header } from 'antd/lib/layout/layout'
import Sider from 'antd/lib/layout/Sider'

import "antd/dist/antd.dark.less"

import Link from 'next/link'
import Image from 'next/image'

import styles from "../styles/Layout.module.css"

import logo from "../public/logo.png"
import { Menu } from 'antd'

//TODO make the sidebar a component, as well as all the other parts here
const items = [
  { label: 'Home', key: 'home' },
  { label: 'Competitions', key: 'comp' },
  { label: 'Members', key: 'members' },
  { label: 'Rankings', key: 'rankings' },
  { label: 'Push Notifications', key: 'push' },
  {
    label: 'Polls',
    key: 'polls',
    children: [
      { label: 'Create Poll', key: 'polls-create' },
      { label: "Manage Polls", key:"polls-manage"},
      { label: "Awards", key:"polls-awards"}
    ],
  },
];

function MyApp({ Component, pageProps }: AppProps) {
  return <Layout className={styles.layout} hasSider>
  <Sider className={styles.sider}>
    <Link href="#" className={styles.logo}>
      <Image src={logo}/>
    </Link>
    <Menu items = {items} theme="dark"/>
  </Sider>
  <Layout>
    <Header>header</Header>
    <Content className={styles.content}><Component {...pageProps} /></Content>
    <Footer className={styles.footer}>
      <span className={styles.footer_item}>Copyright © 2022 Athletics Ontario</span>
      <span className={styles.footer_item}>Website by some nerds</span>
    </Footer>
  </Layout>
</Layout>
}

export default MyApp
