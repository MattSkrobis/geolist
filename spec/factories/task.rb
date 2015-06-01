FactoryGirl.define do
  factory :task do
    sequence(:title) { |n| "List_#{n}" }
    list { create(:list) }
  end
end
