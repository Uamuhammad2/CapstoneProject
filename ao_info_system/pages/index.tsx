import type { NextPage } from 'next'

import styles from "../styles/Home.module.css"

const Home: NextPage = () => {
  return (
    <div className={styles.content}>
      <span className={styles.welcome}>Welcome to the Admin System</span>
      <span className={styles.message}>Please select an option from the menu on the left!</span>
    </div>
  )
}

export default Home
