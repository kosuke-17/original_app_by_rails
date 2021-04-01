FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              { person.hiragana }
    name                  { person.first.kanji }
    name_kana             { person.first.katakana }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    profile               {Faker::Lorem.sentence}
    job_id                { Faker::Number.between(from: 2, to: 8) }

    after(:build) do |user|
      user.user_image.attach(io: File.open("public/images/user_test_image.jpg"), filename: "user_test_image.ipg", content_type: "image/jpg")
    end
  end
end