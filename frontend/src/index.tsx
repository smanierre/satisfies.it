import * as React from "react";
import * as ReactDOM from "react-dom";

import Landing from "./landing";
import GlobalStyles from "./GlobalStyles";

const Index: React.FC = () => (
  <>
    <GlobalStyles />
    <Landing />
  </>
);

ReactDOM.render(<Index />, document.getElementById("root"));
