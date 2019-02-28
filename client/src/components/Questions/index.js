import React from "react";
import { Link, Redirect } from "react-router-dom";
import axios from "axios";

class Question extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
      next: 0,
      answer: ''
    }
    this.nextQuestion = this.nextQuestion.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  componentWillMount() {
    axios.get('http://localhost:3000/user_activity/get_questions')
    .then(function (response) {
      console.log(response);
      if (response.status === 200) {
        this.setState({ data: response.data })
      //this.props.history.push("/question");
      }
    }.bind(this))
    .catch(function (error) {
      console.log(error);
    });
  }

  onlogout = () => {
  window.localStorage.removeItem('userId');
  this.props.history.push(`/`);
  };

  nextQuestion(questionId) {
    const nextVal = this.state.next;
    const userId = window.localStorage.getItem('userId');
    const answer = this.state.answer;
    axios.post('http://localhost:3000/user_activity/save_user_answers', {
    "user_answer": {
      question_id: questionId,
      user_id: userId,
      answer: answer
    }
    })
    .then(function (response) {
    }.bind(this))
    .catch(function (error) {
      console.log(error);
    });
    if(nextVal < 4) {
    this.setState({
      next: this.state.next+1
    });
  }else{
    this.props.history.push(`/thankyou`);
  }
  }

  handleChange(e) {
    const optionValue = e.target.value;
    this.setState({
      answer: optionValue
    });
  }


  render() {
    return (
      <div>
        <nav className="navbar navbar-expand-lg navbar-light bg-light">
          <a className="float-right w-100 text-right" href="#" onClick={this.onlogout}>Logout</a>
          <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span className="navbar-toggler-icon"></span>
          </button>
        </nav>
                  

        {this.state.data.length && this.state.data.map((question,index) => {
          if(index === this.state.next) {
          return (
            <div className="container">
            <form>
            <div className="form-group card shadow p-4 mt-5">
              <label >{question.title}</label><br/>
              {question.options.map((op,index) =>  
              <div className="form-check d-inline-block pr-2">
              <input className="form-check-input" type="radio" name="answer" value={op} onChange={(e) => this.handleChange(e)} />
                <label class="form-check-label" for="exampleRadios1">
                  {op}
                </label>
              </div>
              )}
            </div>
            <button type="submit" class="btn btn-primary" onClick={(questionId) => this.nextQuestion(question.id)}>Next</button>
          </form>
          </div>
          )
        }
        }
        )}
      </div>
    );
  }
}

export default Question;
