import React from "react";
import styled from "styled-components";

const ContainerSpan = styled.span`
  transform: translateY(-104%);
  width: 200px;
  border-bottom: 1px solid #01cedf;
  display: inline-block;
  font-size: 2.4rem;
  color: white;
`;

const StyledDropdown = styled.select`
  border: none;
  appearance: none;
  background: none;
  border: none;
  color: white;
  font-size: 2.4rem;

  &:focus + span {
    transform: rotate(180deg);
  }
`;

const ArrowSpan = styled.span`
  display: inline-block;
  transition: all 0.3s;
`;

const Dropdown: React.FC<{
  setType: React.Dispatch<React.SetStateAction<string>>;
}> = ({ setType }) => (
  <ContainerSpan>
    <StyledDropdown
      onChange={e => {
        document.querySelector("input")?.focus();
        setType(e.target.value);
      }}
    >
      <option value="interface">Interfaces</option>
      <option value="type">Concrete Types</option>
    </StyledDropdown>
    <ArrowSpan>&#9660;</ArrowSpan>
  </ContainerSpan>
);
export default Dropdown;
