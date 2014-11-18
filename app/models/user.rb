class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :links

  validates :email, :password, presence: true
  
  acts_as_voter
end
