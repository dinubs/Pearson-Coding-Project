class AddLinkToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :link, :string, :required => true
  end
end
