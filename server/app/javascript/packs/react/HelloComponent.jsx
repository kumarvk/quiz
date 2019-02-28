import React from 'react'
import PropTypes from 'prop-types'
import ReactDOM from 'react-dom'

export default class HelloComponent extends React.Component {

  constructor(props) {
    super(props)
  }

  static get propTypes() {
    return {
      email: PropTypes.string.isRequired
    }
  }

  render() {
    const email = this.props.email;
    return (
      <div>
        Hello {email}!
      </div>
    )
  }

  static injectToPage(selector, props) {
    $(() => {
      let div = $('<div>')
      let x = $(selector)
      if (x.length > 0) {
        x.replaceWith(div)
        ReactDOM.render(
          <HelloComponent email={props.email} />,
          div[0],
        )
      }
    })
  }
}