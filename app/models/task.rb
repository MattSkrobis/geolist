class Task < ActiveRecord::Base
  has_one :location
  belongs_to :list
  scope :created, -> {where('id IS NOT NULL')}
end
