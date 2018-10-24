import React, { Component } from 'react';
import RepoTile from '../components/RepoTile'
class RepoShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      repos: []
    }
  }

  componentDidMount() {
    fetch(`/api/v1/repos`)
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage);
        throw(error);
      }
    })
      .then(response => response.json())
      .then(body => {
        this.setState({
          repos: body
      });
    })
    .catch(error => console.error('Error:', error));
  }


  render() {
    let repos = this.state.repos.map(repo => {
    return(
      <RepoTile
        key={repo.id}
        name={repo.name}
        description={repo.description}
        language={repo.language}
        contributors={repo.contributors}
      />
    )
  })
    return(
      <div>
        <h1 className="index_header">
          Weekly Trending Repositories!
        </h1>
        {repos}
      </div>
    )
  }
}

export default RepoShowContainer;
