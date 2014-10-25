class ChangeDateAccessedColumn < ActiveRecord::Migration
  def change
  	change_column :links, :dataAccessed, :string
  end
end
