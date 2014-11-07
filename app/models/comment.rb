class Comment < ActiveRecord::Base
  include RemoteTimestamps

  validates :github_user, :github_id, presence: true
  validates :github_id, uniqueness: true

  belongs_to :github_user
  belongs_to :pull_request
end
