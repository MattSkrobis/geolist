class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lists, foreign_key: :owner_id, inverse_of: :user
  has_many :tasks, through: :lists, inverse_of: :user
  has_many :assigned_tasks, class_name: Task, foreign_key: :assignee_id
  
  validates :first_name, :last_name, presence: true

  def to_s
    "#{first_name} #{last_name}"
  end

  def close_to(latitude, longitude, distance_in_meters = 50000)
   self.assigned_tasks.where(%{
    ST_DWithin(
      ST_GeographyFromText(
        'SRID=4326;POINT(' || tasks.longitude || ' ' || tasks.latitude || ')'
      ),
      ST_GeographyFromText('SRID=4326;POINT(%f %f)'),
      %d
    )
  } % [longitude, latitude, distance_in_meters])
  end
end
