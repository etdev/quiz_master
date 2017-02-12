class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :content, :name, :description
  belongs_to :category
end
