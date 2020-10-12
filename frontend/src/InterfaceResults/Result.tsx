import React from "react";
import styled from "styled-components";
import { Link } from "react-router-dom";

import { ICustomTypeResult } from "../types";

const ResultContainer = styled(Link)`
  width: 100%;
  height: 50px;
  line-height: 50px; ${/*Just to center the text vertically*/""}
  flex-shrink: 0;
  color: #f8f8f8;
  padding: 3px;
  padding-left: 15px;
  font-size: 1.6rem;
`;

const Result: React.FC<{ result: ICustomTypeResult }> = ({ result }) => (
  <ResultContainer to={`/interface/${result.id}`}>
    <li>{`${result.type.package}.${result.type.name}`}</li>
  </ResultContainer>
);

export default Result;
