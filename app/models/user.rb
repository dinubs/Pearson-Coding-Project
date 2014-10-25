class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :links

  validates :email, presence: true
end
