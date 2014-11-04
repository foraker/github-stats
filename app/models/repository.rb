class Repository < ActiveRecord::Base
  validates :github_id, presence: true, uniqueness: true

  has_many :pull_requests
end
