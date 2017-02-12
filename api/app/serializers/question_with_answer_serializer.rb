class QuestionWithAnswerSerializer < ActiveModel::Serializer
  attributes :id, :content, :name, :description, :answer, :category_id
end
