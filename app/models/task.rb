class Task < ActiveRecord::Base
  has_one :location
  belongs_to :list
end
