FactoryBot.define do
    factory :developer do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      email { Faker::Internet.email }
      github_username { Faker::Internet.username }
      phone_number { Faker::PhoneNumber.phone_number }
      website { Faker::Internet.url }
      country { Faker::Address.country }
      category
    end
  end