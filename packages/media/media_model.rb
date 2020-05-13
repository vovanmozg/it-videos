module Media
# Contains video source (etc. Youtube)
  class MediaModel
    include Mongoid::Document
    include Mongoid::StoreIn
    include Log::Loggable
    include AASM

    field :url, type: String
    field :content, type: String
    field :meta, type: Hash, default: {}

    field :aasm_state
    aasm whiny_transitions: true do
      state :waiting, initial: true
      state :running, after_enter: :run
      state :downloading, after_enter: :download
      state :parsing, after_enter: :parse

      event :start do
        transitions from: :waiting, to: :downloading
      end

      event :parse do
        transitions from: :downloading, to: :parsing
      end

      event :finish do
        transitions from: :parsing, to: :waiting
      end
    end

    def run

    end

    # Download meta
    def download
      log_debug('MediaModel#download')
      parse!
    end

    # Parse meta
    def parse
      log_debug('MediaModel#parse')
      finish!
    end

  end

end
