import styled from "styled-components";

const ResultListContainer = styled.ul`
  display: flex;
  height: 40vh;
  flex-direction: column;
  grid-column-start: content;
  grid-column-end: span 1;
  grid-row-start: content;
  padding: 0;
  list-style-type: none;
  & a:nth-child(2n) {
    background-color: #333;
  }
  overflow: auto;
`;

export default ResultListContainer;
