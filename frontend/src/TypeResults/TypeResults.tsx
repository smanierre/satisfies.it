import React from "react";

import Container from "../StyledComponents/ResultListContainer";

interface ITypeResultProps {
  searchQuery: string;
}

const TypeResults: React.FC<ITypeResultProps> = ({ searchQuery }) => (
  <Container />
);

export default TypeResults;
