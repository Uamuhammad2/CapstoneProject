import '../styles/globals.css'

import "../styles/theme.less"

import type { AppProps } from 'next/app'
import Layout, { Content, Footer, Header } from 'antd/lib/layout/layout'

import styles from "../styles/layout/main.module.css"

import SiderComponent from '../components/layout/sider'
import FooterComponent from '../components/layout/footer'
import { NextComponentType, NextPage, NextPageContext } from 'next'
import { ReactElement, ReactNode } from 'react'

export type NextPageWithLayout<P = {}, IP = P> = NextPage<P, IP> & {
  getLayout?: (page: ReactElement) => ReactNode
}

type AppPropsWithLayout = AppProps & {
  Component: NextPageWithLayout
}

function getDefaultLayout(page : ReactNode){
  return <Layout className={styles.layout} hasSider>
  <SiderComponent />
  <Layout>
    <Header>header</Header>
    <Content className={styles.content}>{page}</Content>
    <FooterComponent />
  </Layout>
</Layout>
}

function MyApp({ Component, pageProps }: AppPropsWithLayout) {
  const getLayout = Component.getLayout ?? getDefaultLayout;
  return getLayout(<Component {...pageProps} />)
}

export default MyApp
