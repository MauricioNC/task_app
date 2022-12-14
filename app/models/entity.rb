class Entity < ApplicationRecord
  has_many :tasks, dependent: :delete_all
  belongs_to :user, foreign_key: "user_id"

  validates :name, presence: true, :uniqueness => {:scope => :user_id}
  validates :status, presence: true
end
