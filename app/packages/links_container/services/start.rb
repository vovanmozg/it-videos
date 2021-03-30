module LinksContainer
  module Services
    class Start
      def call
        puts 'Все ссылки:'.yellow
        p LinksContainerModel.all.to_a.pluck(:url, :updated_at)

        puts 'Ссылки для скачивания:'.yellow
        container = ReadyToPerformQuery.new.call.first
        p container

        container&.start!

        return
        #
        # IO.readlines('./app/data/index/habr.txt')
        #   .grep(/^http/)
        #   .map(&:strip)
        #   .each { |url| process(url) }
      end
    end
  end
end