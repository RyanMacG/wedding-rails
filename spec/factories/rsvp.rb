FactoryBot.define do
  factory :rsvp do
    name 'Foo Bar'
    sequence :access_key do |n|
      "Snake#{n}"
    end
  end
end