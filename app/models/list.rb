class List < ActiveRecord::Base
  belongs_to :user, inverse_of: :lists
  has_many :tasks
  validates :name, presence: true

  accepts_nested_attributes_for :tasks

  def owner
    User.find(self.owner_id).to_s
  end
end
