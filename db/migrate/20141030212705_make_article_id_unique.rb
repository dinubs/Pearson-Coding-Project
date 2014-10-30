class MakeArticleIdUnique < ActiveRecord::Migration
  def change
    change_column :articles, :articleId, :string, :unique => true
  end
end
