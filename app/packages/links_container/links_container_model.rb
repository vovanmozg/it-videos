#
module LinksContainer
  class LinksContainerModel < AppRecord
    #include AppRecord::StoreIn
    include Log::Loggable
    include AASM

    self.table_name = 'links_containers'

    attribute :repeating, :boolean, default: false


    aasm whiny_transitions: false do
      state :waiting, initial: true
      state :running, after_enter: :run
      state :downloading, after_enter: :download
      state :parsing, after_enter: :parse
      state :finished, after_enter: :finish

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

    scope :not_waiting, -> { ne(aasm_state: 'waiting') }

    def run

    end

    def download
      log_debug("LinksContainerModel#download #{url}")
      content = Tools::Url.get(url, true)
      update_attributes(content: content)
      #content = open(url)
      #update_attributes(content: content.read)
      parse!
    end

    def parse
      log_debug('LinksContainerModel#parse ')
      ap self
      # парсинг хабрахабровского RSS
      urls = Parser::Parser.new(self).parse

      urls.each do |item|
        puts '-------------'
        puts item

        LinksContainerModel.find_or_create_by(url: item)
      end



      # doc = Nokogiri::HTML(content)
      # doc.css('item guid').each do |item|
      #   process_url(item.content)
      # end


      finish!
    end

    def process_url(url)
      #res = Media::MediaModel.find_or_create_by(url: url)
      #res.start!
    end
  end
end





