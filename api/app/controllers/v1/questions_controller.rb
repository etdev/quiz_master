module V1
  class QuestionsController < ApplicationController
    def index
      @questions = Question
        .all
        .page(params[:page])

      render json: @questions, meta: meta_data(@questions)
    end

    def create
      @question = Question.create(question_params)
      if @question.save
        render json: @question
      else
        render json: default_error(@question.errors)
      end
    end

    private

    def question_params
      params.require(:question).permit(:content, :answer)
    end
  end
end
