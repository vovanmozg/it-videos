module UpdatableSource
  class UpdatableSourceJob
    @queue = :simple

    def self.perform
      IO.readlines('./data/index/habr.txt')
        .grep(/^http/)
        .map(&:strip)
        .each { |url| process(url) }
    end

    def self.process(url)

      res = UpdatableSource::UpdatableSourceModel.find_or_create_by(url: url)
      unless res.start!
        puts 'updatable source should be in a waiting state'.red
      end
      # p 1, "res: #{res}"
      # p 2, res.running?
      # p 3, "start", res.start!
      # p 4, res.running?
      #
      #

    end
  end
end
