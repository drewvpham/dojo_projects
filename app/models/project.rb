class Project < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :users_liked, through: :likes, source: :users

  validates_presence_of :github, :title, :description, :url

end
