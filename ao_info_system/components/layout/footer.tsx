import { Footer } from "antd/lib/layout/layout";

import styles from "../../styles/layout/footer.module.css"

export default function FooterComponent(){
    return <Footer className={styles.footer}>
    <span className={styles.footer_item}>Copyright © 2022 Athletics Ontario</span>
    <span className={styles.footer_item}>Website by some nerds</span>
  </Footer>
}