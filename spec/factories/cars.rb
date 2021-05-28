FactoryBot.define do
  factory :car do
    make { "MyString" }
    model { "MyString" }
    year { 1 }
    color { "MyString" }
    transmission { "MyString" }
    seats { 1 }
    image_url { "MyString" }
    user_id { "MyString" }
  end
end
