FactoryBot.define do
  sequence :email do |n|
    "person_#{n}@example.com"
  end

  factory :user do
    email
    password do
      pw_length = User.password_length.first
      ("0".."z").to_a.shuffle[0, pw_length].join
    end
  end
end
