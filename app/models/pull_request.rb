class PullRequest < ActiveRecord::Base
  include RemoteTimestamps

  belongs_to :repository
  belongs_to :github_user

  validates :github_id, presence: true, uniqueness: true
end
