class User < ApplicationRecord
  has_secure_password

  has_many :projects
  has_many :likes
  has_many :projects_liked, through: :likes, source: :projects

  validates :email, :username, uniqueness: true
  validates_presence_of :name, :username

  def self.find_or_create_by_omniauth(auth_hash)
    oauth_email=auth_hash['info']['email']
    username=auth_hash['info']['nickname']
    # image= auth_hash['info']['image']
    # location = auth_hash['extra']['location']
    self.where(email: auth_hash['info']['email']).first_or_create do |user|
    user.password=SecureRandom.hex
    # user.image=auth_hash['extra']['raw_info']['avatar_url']
    user.location=auth_hash['extra']['raw_info']['location']
    user.username=auth_hash['info']['nickname']
    user.uid=auth_hash['uid']
    user.image=auth_hash['info']['image']
    user.name=auth_hash['info']['name']
    user.github="https://github.com/#{user.username}"
    end
  end
end
