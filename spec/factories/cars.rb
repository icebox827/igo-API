FactoryBot.define do
  factory :car do
    make { "MyString" }
    model { "MyString" }
    year { 1 }
    color { "MyString" }
    transmission { "MyString" }
    image_url { "MyString" }
    seats { 1 }
    user_id { 1 }
  end
end
