class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lists, foreign_key: :owner_id
  has_many :tasks, through: :lists
  has_many :ranges
  has_many :assigned_tasks, class_name: 'Task', foreign_key: :assignee_id
  
  validates :first_name, :last_name, presence: true

  def to_s
    "#{first_name} #{last_name}"
  end
end
