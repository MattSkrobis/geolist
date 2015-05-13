FactoryGirl.define do
  factory :task do
    sequence(:title) { |n| "List_#{n}" }
    list_id { create(:list).id }
  end
end
