class Article < ActiveRecord::Base
  validates :articleId,
  			    :title, 
            :content, 
            presence: true
            
  acts_as_votable
       
  def self.search(search)
    if search
      # where(["title LIKE ? OR content[0] LIKE ?", "%#{search}%", "%#{search}%"])
      where("lower(title) LIKE lower('% #{search} %') 
             OR lower(content[1]) LIKE lower('% #{search} %') 
             OR lower(content[2]) LIKE lower('% #{search} %') 
             OR lower(content[3]) LIKE lower('% #{search} %')
             OR lower(content[4]) LIKE lower('% #{search} %')")
    else
      none
    end
  end            
end
