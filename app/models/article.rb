class Article < ActiveRecord::Base
  validates :articleId,
  			:title, 
            :content, 
            presence: true
            
  def self.search(search)
    if search
      where(['title LIKE ?', "%#{search}%"]).where(['content[1] LIKE ?', "%#{search}%"])
    else
      non
    end
  end            
end
