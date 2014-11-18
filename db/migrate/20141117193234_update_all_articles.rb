class UpdateAllArticles < ActiveRecord::Migration
  def change
    Article.find_each(&:update_cached_votes)
  end
end
