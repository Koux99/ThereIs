FactoryBot.define do
  factory :post do
    title {Faker::Lorem.characters(number: 20)}
    lead_text {Faker::Lorem.characters(number: 40)}
    text {Faker::Lorem.sentence}
    association :user
    
    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end