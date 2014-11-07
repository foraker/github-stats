require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should validate_presence_of :github_user }
  it { should validate_presence_of :github_id }
  it { should validate_uniqueness_of :github_id }

  it { should belong_to :github_user }
  it { should belong_to :pull_request }
end
