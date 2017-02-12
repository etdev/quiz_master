module V1
  class QuestionsController < ApplicationController
    def index
      @questions = Question
        .all
        .includes(:category)
        .page(params[:page])

      render json: @questions, meta: meta_data(@questions)
    end

    def show
      @question = Question.find_by(id: params[:id])

      if @question
        render json: @question
      else
        render default_error(["Question does not exist"], :not_found)
      end
    end

    def create
      @question = Question.create(question_params)
      if @question.save
        render json: @question
      else
        render default_error(@question.errors, :unprocessable_entity)
      end
    end

    private

    def question_params
      params.require(:question).permit(:content, :answer, :name, :category_id, :description)
    end
  end
end
