FactoryGirl.define do
  factory :question do
    name { "#{Faker::Name.name} Question" }
    content { "#{Faker::Lorem.words([5..10].sample).join(' ')}?" }
    category
    answer { Faker::Number.between(1, 10_000) }
  end

  factory :category do
    name { Faker::Name.name }
  end
end
