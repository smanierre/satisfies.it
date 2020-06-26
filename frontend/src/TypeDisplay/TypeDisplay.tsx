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
  grid-template-columns: 1fr [methods] 5fr 1fr [implementees] 5fr 1fr;
  grid-template-rows: [type] 100px [lists] 50%;
`;

const TypeName = styled.h3`
  grid-column-start: methods;
  grid-row-start: type;
  font-size: 2.4rem;
`;

const ScrollableList = styled.ul<{ alignment: string }>`
  margin-top: 50px;
  overflow: auto;
  padding-left: 20px;
  border: 1px solid #01cedf;
  height: 40vh;
  grid-column-start: ${(props) =>
    props.alignment === "methods" ? "methods" : "implementees"};
  grid-column-end: span 1;
  grid-row-start: lists;
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

const ImplementeesTitle = styled.h4`
  grid-column-start: implementees;
  grid-column-end: span 1;
  grid-row-start: lists;
`;

const TypeDisplay: React.FC<{ id: string }> = ({ id }) => {
  const [Type, setType] = useState<ICustomTypeResult | null>(null);
  const [Implementees, setImplementees] = useState<ICustomTypeResult[] | null>(
    null
  );
  useEffect(() => {
    fetch(`${apiRoot}/type/${id}`).then((res) =>
      res.json().then((data) => setType(data))
    );
    fetch(`${apiRoot}/implementees/${id}`).then((res) =>
      res
        .json()
        .then((data) =>
          data?.implementees
            ? setImplementees(data.implementees)
            : setImplementees(null)
        )
    );
  }, [id]);
  return (
    <Container>
      <InterfaceName>
        {Type?.type.package ? `${Type?.type.package}.${Type?.type.name}` : ""}
      </InterfaceName>
      <InterfaceDetails>
        <TypeName>Type: {Type?.type.base_type}</TypeName>
        <MethodsTitle>Methods</MethodsTitle>
        <ScrollableList alignment="methods">
          {Type?.type.methods
            ? Type?.type.methods.map((method) => (
                <li key={method.name}>
                  {method.name}({method.parameters.join(", ")}){" "}
                  {method.return_values.length > 1
                    ? `(${method.return_values.join(", ")})`
                    : method.return_values}
                </li>
              ))
            : null}
        </ScrollableList>
        <ImplementeesTitle>Implements</ImplementeesTitle>
        <ScrollableList alignment="implementers">
          {Implementees?.map((implementee) => (
            <li key={implementee.id}>
              <Link to={`/interface/${implementee.id}`}>
                {implementee.type.package}.{implementee.type.name}
              </Link>
            </li>
          ))}
        </ScrollableList>
      </InterfaceDetails>
    </Container>
  );
};

export default TypeDisplay;
