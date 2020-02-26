import * as React from "react"
import GlobalStyle from "./GlobalStyle"
import ContentContainer from "./ContentContainer"
import Search from "./Search"

const App: React.FC = () => (
    <>
    <GlobalStyle />
    <ContentContainer>
        <Search />
    </ContentContainer>
    </>
)

export default App