class Article < ActiveRecord::Base
  validates :articleId,
  			:title, 
            :content, 
            presence: true
end
