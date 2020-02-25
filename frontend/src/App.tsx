import * as React from "react"
import { TextField } from "@material-ui/core"

const App: React.FC = () => {
    const [text, setText] = React.useState("")
    return <><p>{text}</p><TextField onChange={e => {setText(e.target.value)}}/></>
}

export default App