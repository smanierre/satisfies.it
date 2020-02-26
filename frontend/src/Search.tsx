import * as React from "react"
import StyledInput from "./StyledInput"

const Search:React.FC = () => {
    const [searchTerm, setSearchTerm] = React.useState("")

    return <div style={{width:"60%"}}><p>{searchTerm}</p><br /><StyledInput placeholder="Type Name..." type="text" onChange={e => {setSearchTerm(e.target.value)}} /></div>
}

export default Search