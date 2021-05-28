FactoryBot.define do
  factory :user do
    username { "MyString" }
    password { "MyString" }
    email { "MyString" }
    admin { false }
  end
end
