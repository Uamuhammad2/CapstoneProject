import '../styles/globals.css'

import "../styles/theme.less"

import type { AppProps } from 'next/app'


import { NextPage } from 'next'
import { ReactElement, ReactNode } from 'react'
import { DefaultLayout } from '../components/layouts'

export type NextPageWithLayout<P = {}, IP = P> = NextPage<P, IP> & {
  getLayout?: (page: ReactElement) => ReactNode
}

type AppPropsWithLayout = AppProps & {
  Component: NextPageWithLayout
}

function MyApp({ Component, pageProps }: AppPropsWithLayout) {
  const getLayout = Component.getLayout ?? DefaultLayout;
  return getLayout(<Component {...pageProps} />)
}

export default MyApp
