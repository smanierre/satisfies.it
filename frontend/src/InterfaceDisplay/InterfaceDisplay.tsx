import React, { useEffect, useState } from "react";
import styled from "styled-components";
import { Link } from "react-router-dom";

import { apiRoot } from "../index";
import { IInterfaceResult } from "../InterfaceResults/InterfaceResults";
import { ITypeResult } from "../TypeResults/TypeResults";

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
  const [Interface, setInterface] = useState<IInterfaceResult | null>(null);
  const [Implementers, setImplementers] = useState<ITypeResult[] | null>(null);
  useEffect(() => {
    fetch(`${apiRoot}/interface/${id}`).then((res) =>
      res.json().then((data) => setInterface(data))
    );
    fetch(`${apiRoot}/implementers/${id}`).then((res) =>
      res
        .json()
        .then((data) =>
          data?.Implementers
            ? setImplementers(data.Implementers)
            : setImplementers(null)
        )
    );
  }, [id]);
  return (
    <Container>
      <InterfaceName>
        {Interface?.Package ? `${Interface?.Package}.${Interface?.Name}` : ""}
      </InterfaceName>
      <InterfaceDetails>
        <Type>Type: Interface</Type>
        <MethodsTitle>Methods</MethodsTitle>
        <ScrollableList alignment="methods">
          {Interface?.Methods.map((method) => (
            <li key={method.ID}>
              {method.Name}({method.Parameters.join(", ")}){" "}
              {method.ReturnValues.length > 1
                ? `(${method.ReturnValues.join(", ")})`
                : method.ReturnValues}
            </li>
          ))}
        </ScrollableList>
        <ImplementersTitle>Implementers</ImplementersTitle>
        <ScrollableList alignment="implementers">
          {Implementers?.map((implementer) => (
            <li key={implementer.ID}>
              <Link to={`/type/${implementer.ID}`}>
                {implementer.Package}.{implementer.Name}
              </Link>
            </li>
          ))}
        </ScrollableList>
      </InterfaceDetails>
    </Container>
  );
};

export default InterfaceDisplay;
