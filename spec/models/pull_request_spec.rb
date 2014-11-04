require 'rails_helper'

RSpec.describe PullRequest, type: :model do
  it { should belong_to :repository }
  it { should belong_to :github_user }

  it { should validate_presence_of :github_id }
  it { should validate_uniqueness_of :github_id }
end
