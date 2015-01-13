class User < ActiveRecord::Base
  authenticates_with_sorcery!

  before_validation :downcase_email, on: 'create'

  has_many :links

  validates :email, uniqueness: true

  validates :email, :password, presence: true
  
  acts_as_voter

  private
	  def downcase_email
	    self.email = self.email.downcase
	  end
end
