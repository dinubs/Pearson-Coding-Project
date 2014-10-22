class Article < ActiveRecord::Base
  validates :articleId,
  			:title, 
            :content, 
            presence: true
            
  def self.search(search)
    if search
      where(["title LIKE ?", "%#{search}%"])
    else
      none
    end
  end            
end