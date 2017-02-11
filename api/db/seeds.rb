def seed_categories
  category_data_file = Rails.root.join("lib", "seed_data", "categories.yml")
  YAML.load(File.read(category_data_file))
end

def seed_questions
  question_data_file = Rails.root.join("lib", "seed_data", "questions.yml")
  YAML.load(File.read(question_data_file))
end

# generate seed categories
seed_categories.each do |category_attrs|
  Category.find_or_create_by!(category_attrs)
end

# generate seed questions
seed_questions.each do |question_attrs|
  Question.find_or_create_by!(question_attrs)
end
