module RemoteTimestamps
  extend ActiveSupport::Concern

  module ClassMethods
    def newest_first
      order(remote_created_at: :desc)
    end

    def created_after(timestamp)
      where("#{table_name}.remote_created_at >= ?", timestamp)
    end

    def created_before(timestamp)
      where("#{table_name}.remote_created_at <= ?", timestamp)
    end
  end
end
