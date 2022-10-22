class Entity < ApplicationRecord
  has_many :tasks
  belongs_to :user, foreign_key: "user_id"

  validates :name, presence: true, uniqueness: true
  validates :status, presence: true
end
