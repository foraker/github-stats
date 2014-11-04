class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.integer :github_id, index: true
      t.string :name
      t.boolean :private
      t.string :html_url
      t.string :url
      t.text :description
      t.datetime :remote_created_at
      t.datetime :remote_updated_at

      t.timestamps
    end
  end
end
