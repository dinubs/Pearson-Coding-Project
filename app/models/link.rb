class Link < ActiveRecord::Base
  belongs_to :user

  validates :article_title,
   			:website_title,
   			:date_accessed,
   			:url,
   			:category,
   			:presence => true
end
