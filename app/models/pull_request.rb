class PullRequest < ActiveRecord::Base
  belongs_to :repository
  belongs_to :github_user

  validates :github_id, presence: true, uniqueness: true
end
