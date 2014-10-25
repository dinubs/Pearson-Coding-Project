class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :article_title
      t.string :website_title
      t.date :date_accessed
      t.string :url
      t.references :user, index: true

      t.timestamps
    end
    add_index :links, [:user_id, :created_at]
  end
end
