module V1
  class GuessChecksController < ApplicationController
    def show
      @question = Question.find_by(id: params[:id])

      if @question.correct_answer?(params[:guess])
        render json: { result: "correct" }
      else
        render json: { result: "incorrect" }
      end
    end
  end
end
