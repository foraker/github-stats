module RemoteTimestamps
  extend ActiveSupport::Concern

  module ClassMethods
    def newest_first
      order(remote_created_at: :desc)
    end
  end
end
