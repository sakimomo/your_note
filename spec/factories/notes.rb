FactoryBot.define do
  factory :note do
    association :user, factory: :user
    content  { Faker::Lorem.sentence }
    genre_id { 2 }

    after(:build) do |note|
      note.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      note.save
    end
  end
end
