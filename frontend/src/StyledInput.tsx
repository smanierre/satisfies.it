import styled from "styled-components"

const StyledInput = styled.input`
    outline: 0;
    border: none;
    border-bottom: 1px solid white;
    width: 100%;
    background-color: transparent;
    font-size: 2rem;
    transition-property: border-bottom, margin;
    transition-duration: 0.05s;
    &:focus{
        border-bottom: 3px solid white;
        margin-bottom: -3px;
    }
`

export default StyledInput