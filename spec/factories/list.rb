FactoryGirl.define do
  factory :list do
    sequence(:name) { |n| "name_#{n}" }
    user_id { create(:user).id }
  end
end
