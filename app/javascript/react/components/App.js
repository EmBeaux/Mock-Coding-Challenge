import React from 'react'
import ReactDom from 'react-dom'
import { Route, IndexRoute, Router, browserHistory } from 'react-router'
import RepoShowContainer from '../containers/RepoShowContainer'

export const App = (props) => {
  return (
    <div>
      <Router history={browserHistory}>
        <Route path="/repos" component={RepoShowContainer}/>
      </Router>
    </div>
  )
}

export default App;
