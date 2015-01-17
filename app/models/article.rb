class Article < ActiveRecord::Base

  validates :title, 
            :content,
            :link, 
            presence: true
            
  validates :link, uniqueness: true
  acts_as_votable

       
  def self.search(search)
    if search
      # where(["title LIKE ? OR content[0] LIKE ?", "%#{search}%", "%#{search}%"])
      where("lower(title) LIKE lower('% #{search} %') 
             OR lower(link) LIKE lower('%#{search}%')
             OR lower(content[1]) LIKE lower('% #{search} %') 
             OR lower(content[2]) LIKE lower('% #{search} %') 
             OR lower(content[3]) LIKE lower('% #{search} %')
             OR lower(content[4]) LIKE lower('% #{search} %')
             OR lower(title) LIKE lower('%#{search}%') 
             OR lower(content[1]) LIKE lower('%#{search}%') 
             OR lower(content[2]) LIKE lower('%#{search}%') 
             OR lower(content[3]) LIKE lower('%#{search}%')
             OR lower(content[4]) LIKE lower('%#{search}%')")
    else
      none
    end
  end   
  def self.from_ft
    where("link LIKE '%ft.com%'").count
  end         
end
