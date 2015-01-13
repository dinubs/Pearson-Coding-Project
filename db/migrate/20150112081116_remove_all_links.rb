class RemoveAllLinks < ActiveRecord::Migration
  def change
  	Link.delete_all
  end
end
