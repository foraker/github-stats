class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :github_id, index: true
      t.integer :github_user_id, index: true
      t.string :url
      t.string :html_url
      t.text :body
      t.datetime :remote_created_at
      t.datetime :remote_updated_at
      t.string :pull_request_url

      t.timestamps
    end
  end
end
