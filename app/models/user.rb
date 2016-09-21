class User < ApplicationRecord
  has_many :wall_posts
  before_create -> { self.auth_token = SecureRandom.hex }
  
end
