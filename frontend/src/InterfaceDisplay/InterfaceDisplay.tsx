import React, { useEffect, useState } from "react";
import styled from "styled-components";
import { Link } from "react-router-dom";

import { apiRoot } from "../index";
import { ICustomTypeResult } from "../types";

const Container = styled.div`
  display: grid;
  grid-template-columns: 3fr [content] 6fr 3fr;
  grid-template-rows: 15vh [title] 100px [content] 1fr;
  font-size: 1.6rem;
  color: #f8f8f8;
`;

const InterfaceName = styled.h2`
  grid-column-start: content;
  grid-column-end: span 1;
  grid-row-start: title;
  font-size: 3.6rem;
  border-bottom: 1px solid #01cedf;
`;

const InterfaceDetails = styled.div`
  display: grid;
  grid-column-start: content;
  grid-column-end: span 1;
  grid-row-start: content;
  grid-template-columns: 1fr [methods] 5fr 1fr [implementers] 5fr 1fr;
  grid-template-rows: [type] 100px [lists] 50%;
`;

const Type = styled.h3`
  grid-column-start: methods;
  grid-row-start: type;
  font-size: 2.4rem;
`;

const ScrollableList = styled.ul<{ alignment: string }>`
  margin-top: 50px;
  overflow: auto;
  padding-left: 20px;
  border: 1px solid #01cedf;
  grid-column-start: ${(props) =>
    props.alignment === "methods" ? "methods" : "implementers"};
  grid-column-end: span 1;
  grid-row-start: lists;
  height: 40vh;
  list-style-type: none;

  & li a {
    color: #f8f8f8;

    &:visited {
      color: #9c9c9c;
    }
  }
`;

const MethodsTitle = styled.h4`
  grid-column-start: methods;
  grid-column-end: span 1;
  grid-row-start: lists;
`;

const ImplementersTitle = styled.h4`
  grid-column-start: implementers;
  grid-column-end: span 1;
  grid-row-start: lists;
`;
const InterfaceDisplay: React.FC<{ id: string }> = ({ id }) => {
  const [Interface, setInterface] = useState<ICustomTypeResult | null>(null);
  const [Implementers, setImplementers] = useState<ICustomTypeResult[] | null>(
    null
  );
  useEffect(() => {
    fetch(`${apiRoot}/interface/${id}`).then((res) =>
      res.json().then((data) => setInterface(data))
    );
    fetch(`${apiRoot}/implementers/${id}`).then((res) =>
      res.json().then((data) => {
        data?.implementers
          ? setImplementers(data.implementers)
          : setImplementers(null);
      })
    );
  }, [id]);
  return (
    <Container>
      <InterfaceName>
        {Interface?.type.package
          ? `${Interface?.type.package}.${Interface?.type.name}`
          : ""}
      </InterfaceName>
      <InterfaceDetails>
        <Type>Type: Interface</Type>
        <MethodsTitle>Methods</MethodsTitle>
        <ScrollableList alignment="methods">
          {Interface?.type.methods.map((method) => (
            <li key={method.name}>
              {method.name}({method.parameters.join(", ")}){" "}
              {method.return_values.length > 1
                ? `(${method.return_values.join(", ")})`
                : method.return_values}
            </li>
          ))}
        </ScrollableList>
        <ImplementersTitle>Implementers</ImplementersTitle>
        <ScrollableList alignment="implementers">
          {Implementers?.map((implementer) => (
            <li key={implementer.id}>
              <Link to={`/type/${implementer.id}`}>
                {implementer.type.package}.{implementer.type.name}
              </Link>
            </li>
          ))}
        </ScrollableList>
      </InterfaceDetails>
    </Container>
  );
};

export default InterfaceDisplay;
