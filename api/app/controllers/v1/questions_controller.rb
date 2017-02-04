module V1
  class QuestionsController < ApplicationController
    def index
      @questions = Question
        .all
        .page(params[:page])

      render json: @questions, meta: meta_data(@questions)
    end
  end
end
