import React from "react";
import styled from "styled-components";
import { Link } from "react-router-dom";

import { ICustomTypeResult } from "../types";

const ResultContainer = styled(Link)`
  width: 100%;
  color: #f8f8f8;
  padding: 3px;
  font-size: 1.6rem;
`;

const Result: React.FC<{ result: ICustomTypeResult }> = ({ result }) => (
  <ResultContainer to={`/interface/${result.id}`}>
    <li>{`${result.type.package}.${result.type.name}`}</li>
  </ResultContainer>
);

export default Result;
