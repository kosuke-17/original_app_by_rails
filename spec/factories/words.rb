FactoryBot.define do
  factory :word do
    title    {Faker::Name.initials}
    note     {Faker::Lorem.sentence}
    genre_id {Faker::Number.between(from: 2, to: 10)}
    association :user
    
    after(:build) do |word|
      word.image.attach(io: File.open('public/images/word_test_image.jpg'), filename: 'word_test_image.jpg')
    end
  end
end