class Comment < ActiveRecord::Base
  validates :github_user, :github_id, presence: true
  validates :github_id, uniqueness: true

  belongs_to :github_user
end
