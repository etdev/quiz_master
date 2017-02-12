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

    def update
      @question = Question.find(params[:id])
      if @question.update(question_params)
        render json: @question,
               serializer: QuestionWithAnswerSerializer,
               root: :question
      else
        render default_error(["Question does not exist"], :not_found)
      end
    end

    def destroy
      @question = Question.find(params[:id])
      if @question.destroy
        render json: { result: "success" }
      else
        render default_error(["Question does not exist"], :not_found)
      end
    end

    private

    def question_params
      params.require(:question).permit(
        :content,
        :answer,
        :name,
        :category_id,
        :description
      )
    end
  end
end
