class UserActivityController < ApplicationController

  def save_user_answers
    user_answer = UserAnswer.new(user_answer_params)
    if user_answer.save
      flash.now[:success] = "answer save successfully."
    else	
      user_answer.errors.full_messages.join(', ')
    end
  end

  def get_questions
    ques = Question.all
    render json: ques
  end

  private
  def user_answer_params
    params.require(:user_answer).permit(:question_id, :user_id, :answer)
  end
end
