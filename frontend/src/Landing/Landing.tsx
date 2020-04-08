import React, { useState } from "react";
import styled from "styled-components";
import { useHistory } from "react-router-dom";

import Search from "./Search";
import Dropdown from "./Dropdown";

const Container = styled.form`
  position: absolute;
  top: 40%;
  left: 50%;
  transform: translate(-437px, -50%);
  margin: 0;
  padding: 0;
`;

const Landing: React.FC = () => {
  const history = useHistory();
  const [searchQuery, setSearchQuery] = useState("");
  const [searchType, setSearchType] = useState("interface");
  return (
    <Container
      onSubmit={(e) => {
        e.preventDefault();
        if (searchQuery === "") {
          history.push(`/results/${searchType}/ `);
        } else {
          history.push(`/results/${searchType}/${searchQuery}`);
        }
      }}
    >
      <img src="./logo.svg" alt="Satisfies.it" />
      <Search placeholder="Search for..." updateQuery={setSearchQuery} />
      <Dropdown setType={setSearchType} />
    </Container>
  );
};

export default Landing;
