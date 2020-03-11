import React from "react";
import styled from "styled-components";

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
  return (
    <Container
      onSubmit={e => {
        e.preventDefault();
      }}
    >
      <img src="./logo.svg" alt="Satisfies.it" />
      <Search placeholder="Search" />
      <Dropdown />
    </Container>
  );
};

export default Landing;
