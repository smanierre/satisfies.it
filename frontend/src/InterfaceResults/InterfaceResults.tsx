import React, { useEffect, useState } from "react";

import Container from "../StyledComponents/ResultListContainer";
import Result from "./Result";

interface IInterfaceResultProps {
  searchQuery: string;
}

export interface IMethod {
  ID: number;
  Package: string;
  Name: string;
  Paramaters: string[];
  ReceiverName: string;
  ReturnValues: string[];
}

export interface IInterfaceResult {
  ID: number;
  Package: string;
  Name: string;
  Implementable: boolean;
  Methods: IMethod[];
}

const Results: React.FC<IInterfaceResultProps> = ({ searchQuery }) => {
  const [results, setResults] = useState<IInterfaceResult[] | null>(null);
  useEffect(() => {
    fetch(`http://localhost:4000/api/interface/${searchQuery}`).then(res =>
      res.json().then(data => setResults(data))
    );
  }, [searchQuery]);
  return (
    <>
      <h1>Results for {searchQuery}:</h1>
      <Container>
        {results?.map(result => (
          <Result key={result.ID} result={result} />
        ))}
      </Container>
    </>
  );
};
export default Results;
