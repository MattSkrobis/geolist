class Task < ActiveRecord::Base
  has_one :location
  belongs_to :list
  validates :title, presence: true
  scope :created, -> {where('id IS NOT NULL')}
  scope :not_assigned, -> {where(assigned: false)}
  # scope :user_assigned, -> {where(list.user == current_user)}
end
