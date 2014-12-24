class AddExternalLinkToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :external_link, :string, :default => ""
    Article.reset_column_information
    Article.update_all(external_link: "")
  end
end
