import React from "react";
import styled from "styled-components";
import { Link } from "react-router-dom";

import { ITypeResult } from "./TypeResults";

const ResultContainer = styled(Link)`
  width: 100%;
  color: #f8f8f8;
  padding: 3px;
  font-size: 1.6rem;
`;

const Result: React.FC<{ result: ITypeResult }> = ({ result }) => (
  <ResultContainer to={`/type/${result.ID}`}>
    <li>{`${result.Package}.${result.Name}`}</li>
  </ResultContainer>
);

export default Result;
