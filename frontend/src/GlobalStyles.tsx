import { createGlobalStyle } from "styled-components";

export default createGlobalStyle`
    html {
        margin: 0;
        height: 100%;
        font-size: 62.5%;
        font-family: Roboto;
    }
    body {
        background-color: #444;
        position: relative;
        height: 100%;
        margin: 0;
        overflow: hidden;
    }
`;
