import * as React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter as Router, Switch, Route, Link } from "react-router-dom";

import Navbar from "./StyledComponents/Navbar";
import Landing from "./Landing/Landing.tsx";
import InterfaceResults from "./InterfaceResults/InterfaceResults";
import TypeResults from "./TypeResults/TypeResults";
import GlobalStyles from "./GlobalStyles";
import InterfaceDisplay from "./InterfaceDisplay/InterfaceDisplay";
import TypeDisplay from "./TypeDisplay/TypeDisplay";

const Index: React.FC = () => {
  return (
    <>
      <GlobalStyles />
      <Router>
        <Navbar>
          <Link to="/">Placeholder Home</Link>
        </Navbar>
        <Switch>
          <Route exact path="/">
            <Landing />
          </Route>
          <Route
            path="/results/interface/:query"
            render={routeProps => {
              let query: string = "";
              if (typeof routeProps.match.params.query === "string") {
                query = routeProps.match.params.query;
              }
              return <InterfaceResults searchQuery={query} />;
            }}
          />
          <Route
            path="/results/type/:query"
            render={routeProps => {
              let query: string = "";
              if (typeof routeProps.match.params.query === "string") {
                query = routeProps.match.params.query;
              }
              return <TypeResults searchQuery={query} />;
            }}
          />
          <Route
            path="/interface/:id"
            render={routeProps => {
              let id: string = "";
              if (typeof routeProps.match.params.id === "string") {
                id = routeProps.match.params.id;
              }
              return <InterfaceDisplay id={id} />;
            }}
          />
          <Route
            path="/type/:id"
            render={routeProps => {
              let id: string = "";
              if (typeof routeProps.match.params.id === "string") {
                id = routeProps.match.params.id;
              }
              return <TypeDisplay id={id} />;
            }}
          />
        </Switch>
      </Router>
    </>
  );
};

ReactDOM.render(<Index />, document.getElementById("root"));
