#
module UpdatableSource
  class UpdatableSourceModel
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

    def download
      log_debug("UpdatableSourceModel#download #{url}")
      content = open(url)
      update_attributes(content: content.read)
      parse!
    end

    def parse
      log_debug('UpdatableSourceModel#parse ')
      # парсинг хабрахабровского RSS
      doc = Nokogiri::HTML(content)
      doc.css('item guid').each do |item|
        process_url(item.content)
      end


      finish!
    end

    def process_url(url)
      res = MediaSet::MediaSetModel.find_or_create_by(url: url)
      res.start!
    end
  end
end





