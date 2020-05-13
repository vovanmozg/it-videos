module MediaSet
  # Describes a page, which should contain embedded videos or video links
  class MediaSetModel
    include Mongoid::Document
    include Mongoid::StoreIn
    include Log::Loggable
    include AASM

    field :url, type: String
    field :content, type: String

    field :aasm_state
    aasm whiny_transitions: false do
      state :waiting, initial: true
      state :running, after_enter: :run
      state :downloading, after_enter: :download
      state :parsing, after_enter: :parse
      state :finished

      event :start do
        transitions from: :waiting, to: :downloading
      end

      event :parse do
        transitions from: :downloading, to: :parsing
      end

      event :finish do
        transitions from: :parsing, to: :finished
      end
    end


    def download
      log_debug("MediaSetModel#download #{url}")
      content = open(url)
      update_attributes(content: content.read)
      parse!
    end

    def parse
      log_debug('MediaSetModel#parse')
      urls = content.scan(%r{(https?://youtu.be/[^"']*?)})

      urls.each do |url|
        Media.create(url: url)
      end

      finish!
    end

  end
end
