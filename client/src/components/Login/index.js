import React from "react";
import { Link } from "react-router-dom";
import axios from "axios";

class Login extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: "",
      error: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }


  async handleSubmit(e) {
    const email = this.refs.email.value;
    const password = this.refs.password.value;
    axios.post('http://localhost:3000/users/sign_in', {
    "user": {
      email: email,
      password: password
    }
    })
    .then(function (response) {
      console.log(response);
      this.setState({
        error: response.data
      });
      if (response.status === 200 && response.data.id) {
      window.localStorage.setItem('userId', response.data.id);
      this.props.history.push("/question");
    }
    }.bind(this))
    .catch(function (error) {
      console.log(error);
    });
  }

  render() {
    return (
      <div>
        <div className="container">
          <div className="row">
            <div className="col-md-3 col-lg-3 col-sm-3 col-xs-12" />
            <div className="col-md-6 col-lg-6 col-sm-6 col-xs-12 login_registration_box">
              <h1 className="text-center">Login</h1>
              {this.state.error === 'Invalid email or password.' ? <div className="alert alert-danger" role="alert">
                  <strong>{this.state.error}</strong>
                </div> : '' }
              <label>
                <b>Email</b>
              </label>
              <input
                type="text"
                ref="email"
                placeholder="Enter Email"
                name="email"
                required
              />

              <label>
                <b>Password</b>
              </label>
              <input
                type="password"
                ref="password"
                placeholder="Enter Password"
                name="psw"
                required
              />

              <button
                type="submit"
                onClick={this.handleSubmit}
                className="registerbtn mt-4"
              >
                Login
              </button>
              <h4 className="text-center mt-2">
                <Link className="text-info signup" to="/register">
                  Sign Up
                </Link>
              </h4>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Login;
