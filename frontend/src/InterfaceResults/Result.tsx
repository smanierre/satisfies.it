import React from "react";
import styled from "styled-components";

import { IInterfaceResult } from "./InterfaceResults";

const ResultContainer = styled.li`
  width: 50%;
  background-color: blue;
  margin: 10px auto;
  display: inline-block;
  height; 50px;
`;

const Result: React.FC<{ result: IInterfaceResult }> = ({ result }) => (
  <ResultContainer>{`${result.Package}.${result.Name}`}</ResultContainer>
);

export default Result;
