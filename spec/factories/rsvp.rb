FactoryBot.define do
  factory :rsvp do
    name 'Foo Bar'
    sequence :access_key do |n|
      "Snake#{n}"
    end

    factory :rsvp_with_guests do
      number_of_guests 1
    end

    after(:create) do |rsvp, evaluator|
      create_list(:guest, evaluator.number_of_guests, rsvp: rsvp)
    end
  end
end