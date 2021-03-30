module Parser
  class Parser
    @parsers = [
      ::Parser::HabrRss
    ]

    # register class
    ::Parser::HabrRss
    puts 'Parser::HabrRss'.red

    class << self
      attr_accessor :parsers
    end

    def initialize(content_model)
      @content_model = content_model
    end

    def parse

      parser_class = Parser.parsers.find do |parser|
        parser.match?(@content_model.url)
      end

      parser_class.new.urls(@content_model.content)
    end
  end
end
