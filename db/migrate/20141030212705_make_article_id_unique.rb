class MakeArticleIdUnique < ActiveRecord::Migration
  def change
    change_column :articles, :articleId, :unique => true
  end
end
