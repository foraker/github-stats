class CreateGithubUsers < ActiveRecord::Migration
  def change
    create_table :github_users do |t|
      t.string :login
      t.integer :github_id, index: true

      t.timestamps
    end
  end
end
