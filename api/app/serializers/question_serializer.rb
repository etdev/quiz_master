class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :content, :name
  belongs_to :category
end
