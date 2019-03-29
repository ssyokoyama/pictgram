class User < ApplicationRecord
  validates :password, length: { in: 8..32 }
  validates :email, format: {with: /\A[\w+\-~.]+@[a-z\d\-.]+\.[a-z]+\z/i}
validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i}
  validates :name, presence: true, length: { maximum: 15 }
  has_secure_password

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'

end
