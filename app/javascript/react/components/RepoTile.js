import React from 'react';

const RepoTile = (props) => {
  return (
    <div onClick={props.handleClick}>
      <div className="repo_item">
        <h5>{props.name}</h5>
        <h6>{props.description}</h6>
        <h6>Primary Coding Language: {props.language}</h6>
        <p>{props.contributors}</p>
      </div>
      <hr/>
    </div>
  )
}

export default RepoTile;
