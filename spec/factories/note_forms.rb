require 'faker'

FactoryBot.define do
  factory :note_form do
    association :user_id, factory: :user
    content { Faker::Lorem.sentence }
    tag_name { Faker::Lorem.word }
    genre_id { 2 }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/sample1.png')) }
  end
end
