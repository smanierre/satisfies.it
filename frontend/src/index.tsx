import * as React from "react"
import * as ReactDOM from "react-dom"

import App from "./App"
import GlobalStyles from "./GlobalStyles"

const Index:React.FC = () => (
    <>
        <GlobalStyles />
        <App />
    </>
)

ReactDOM.render(<Index />, document.getElementById("root"))