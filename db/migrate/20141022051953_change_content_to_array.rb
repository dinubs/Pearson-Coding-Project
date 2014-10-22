class ChangeContentToArray < ActiveRecord::Migration
  def change
  	change_column :articles, :content, "text[] USING (string_to_array(content, ','))"
  end
end
