class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  validates :name, presence: true

  accepts_nested_attributes_for :tasks
end
