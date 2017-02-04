FactoryGirl.define do
  factory :question do
    content { "#{Faker::Lorem.words([5..10].sample).join(' ')}?" }
    answer { Faker::Number.between(1, 10_000) }
  end
end
