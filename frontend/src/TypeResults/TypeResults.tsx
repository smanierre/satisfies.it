import React, { useEffect, useState } from "react";
import styled from "styled-components";

import ResultsContainer from "../StyledComponents/ResultListContainer";
import Result from "./Result";

interface ITypeResultProps {
  searchQuery: string;
}

export interface IMethod {
  ID: number;
  Package: string;
  Name: string;
  Parameters: string[];
  ReceiverName: string;
  ReturnValues: string[];
}

export interface ITypeResult {
  ID: number;
  Package: string;
  Name: string;
  BaseType: string;
  Methods: IMethod[];
}

const Layout = styled.div`
  display: grid;
  grid-template-columns: 3fr [content] 3fr 3fr;
  grid-template-rows: [spacer] 25vh [header] 1fr [content] 3fr;
`;

const ResultHeader = styled.h1`
  grid-column-start: content;
  grid-column-end: span 1;
  grid-row-start: header;
  font-size: 4.2rem;
  font-family: "Open Sans";
`;

const Results: React.FC<ITypeResultProps> = ({ searchQuery }) => {
  const [results, setResults] = useState<ITypeResult[] | null>(null);
  useEffect(() => {
    fetch(`http://localhost:4000/api/type/${searchQuery}`).then(res =>
      res.json().then(data => setResults(data))
    );
  }, [searchQuery]);
  return (
    <Layout>
      <ResultHeader>
        Displaying {results?.length ? results?.length : 0} results for{" "}
        {searchQuery}:
      </ResultHeader>
      <ResultsContainer>
        {results?.map(result => (
          <Result key={result.ID} result={result} />
        ))}
      </ResultsContainer>
    </Layout>
  );
};
export default Results;
