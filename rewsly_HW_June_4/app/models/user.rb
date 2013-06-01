class User < ActiveRecord::Base
  validates :email_address, :uniqueness => true
  has_many :stories
end
