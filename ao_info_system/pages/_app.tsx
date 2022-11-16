import '../styles/globals.css'
import "antd/dist/antd.dark.less"

import type { AppProps } from 'next/app'
import Layout, { Content, Footer, Header } from 'antd/lib/layout/layout'

import styles from "../styles/layout/main.module.css"

import SiderComponent from '../components/layout/sider'
import FooterComponent from '../components/layout/footer'

function MyApp({ Component, pageProps }: AppProps) {
  return <Layout className={styles.layout} hasSider>
    <SiderComponent />
    <Layout>
      <Header>header</Header>
      <Content className={styles.content}><Component {...pageProps} /></Content>
      <FooterComponent />
    </Layout>
  </Layout>
}

export default MyApp
