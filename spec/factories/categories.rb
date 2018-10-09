FactoryBot.define do
    factory :category do
      name { Faker::ProgrammingLanguage.unique.name }

    end
  end