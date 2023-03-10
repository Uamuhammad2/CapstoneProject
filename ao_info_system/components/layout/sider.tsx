import { Menu } from "antd";
import Sider from "antd/lib/layout/Sider";
import Link from 'next/link'
import Image from 'next/image'

import logo from "../../public/logo.png"
import styles from "../../styles/layout/sider.module.css"

//TODO make this dynamic
const items = [
    { label: <Link href="/">Home</Link>, key: 'home' },
    { label: <Link href="/mdb">MDB</Link>, key: 'mdb' },
    { label: <Link href="/competition">Competition</Link>, key: 'comp' },
    { label: <Link href="/member">Members</Link>, key: 'members' },
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

export default function SiderComponent(){
    return <Sider>
        <Link href="#" className={styles.logo}>
            <Image src={logo} alt="logo"/>
        </Link>
        <Menu items = {items} theme="dark"/>
  </Sider>

}