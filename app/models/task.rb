class Task < ActiveRecord::Base
  has_one :location, inverse_of: :task
  belongs_to :list, inverse_of: :tasks
  validates :title, presence: true
  scope :created, -> { where('id IS NOT NULL') }
  scope :not_assigned, -> { where(assigned: false) }
  scope :assigned, -> { where(assigned: true) }
end
