require 'rails_helper'

RSpec.describe GithubUser, type: :model do
  it { should have_many :comments }
  it { should have_many :pull_requests }

  it { should validate_presence_of :login }
  it { should validate_presence_of :github_id }

  it { should validate_uniqueness_of :login }
  it { should validate_uniqueness_of :github_id }
end
