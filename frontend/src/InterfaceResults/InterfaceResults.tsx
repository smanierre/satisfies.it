import React, { useEffect, useState } from "react";
import styled from "styled-components";

import { ICustomTypeResult } from "../types";
import { apiRoot } from "../index";
import ResultsContainer from "../StyledComponents/ResultListContainer";
import Result from "./Result";

interface IInterfaceResultProps {
  searchQuery: string;
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

const Results: React.FC<IInterfaceResultProps> = ({ searchQuery }) => {
  const [results, setResults] = useState<ICustomTypeResult[] | null>(null);
  useEffect(() => {
    fetch(`${apiRoot}/interface/${searchQuery}`).then((res) =>
      res.json().then((data) => setResults(data))
    );
  }, [searchQuery]);
  return (
    <Layout>
      <ResultHeader>
        Displaying {results?.length ? results?.length : 0} results for{" "}
        {searchQuery}:
      </ResultHeader>
      <ResultsContainer>
        {results?.map((result) => (
          <Result key={result.id} result={result} />
        ))}
      </ResultsContainer>
    </Layout>
  );
};
export default Results;
