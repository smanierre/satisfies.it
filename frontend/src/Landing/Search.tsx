import React from "react";
import styled from "styled-components";

const StyledInput = styled.input`
  padding: 0;
  transform: translateY(-107%);
  transition: all 0.4s ease-in-out;
  width: 590px;
  border: none;
  border-bottom: 1px solid #01cedf;
  appearance: none;
  background: none;
  color: white;
  font-size: 2.4rem;
`;


const Search: React.FC<{updateQuery: React.Dispatch<React.SetStateAction<string>>, placeholder: string}> = ({ updateQuery, placeholder }) => {
  return <StyledInput placeholder={placeholder} onChange={e => {updateQuery(e.target.value)}} />
}
export default Search;
