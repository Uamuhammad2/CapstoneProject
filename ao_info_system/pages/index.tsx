import Layout, { Content, Footer, Header } from 'antd/lib/layout/layout'
import Sider from 'antd/lib/layout/Sider'
import type { NextPage } from 'next'
import Link from 'next/link'
import Image from 'next/image'

import styles from "../styles/Home.module.css"

import logo from "../public/logo.png"
import { Menu } from 'antd'

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

const Home: NextPage = () => {
  return (
<Layout className={styles.layout} hasSider>
    <Sider className={styles.sider}>
      <Link href="#" className={styles.logo}>
        <Image src={logo}/>
      </Link>
      <Menu items = {items} theme="dark"/>
    </Sider>
    <Layout>
    <Content className={styles.content}>main content</Content>
    <Footer>footer</Footer>
    </Layout>
</Layout>
  )
}

export default Home
