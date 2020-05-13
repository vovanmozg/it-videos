# waiting
# downloading: скачать страницу rss с хабра и ещё откуда-нибудь
# распарсить все ссылки на видео
# создать ссылки с привязать их к странице
# скачать всю инфу по ссылкам
# скачать видео для каждой ссылки
# для каждого видео рассчиатать массив phash (5-минутные куски)
# для каждого видео извлечь мета-информацию (автор, название, дата, категория, субтитры)
# 
# поискать похожие видео
# сохранить новые видео в репозиторий


require 'rubygems'
require 'bundler/setup'
require 'open-uri'
Bundler.require(:default)

uri = URI.parse("redis://localhost:6379/")
Resque.redis = Redis.new(:host => uri.host, :port => uri.port)

Resque.logger.level = Logger::DEBUG

Mongoid.load!("./config/mongoid.yml", :production)


# class MyInflector < Zeitwerk::Inflector
#   def camelize(basename, _abspath)
#
#     r = super
#     #return 'LinksSet' if basename == 'links_set_model'
#     p '------------', basename, _abspath
#     p r
#     r
#   end
# end

loader = Zeitwerk::Loader.new
# loader.inflector = MyInflector.new
loader.push_dir('./packages')
loader.setup


# взять все источники ссылок на видео и запустить джобы на парсинг
def check_link_sets
  urls = ['https://m.habr.com/ru/company/JetBrains/blog/461923/']



  urls.each do |url_set|

    doc = Nokogiri::HTML(open(url_set))
    doc.css('a').each do |a|
      url = a.attr('href')

      if url =~ /youtu/
        p url

        doc = Nokogiri::HTML(open(url))

        video_url = doc.css('meta[property="og:url"]').attr('content').value
        p video_url

        if video_url =~ %r(^https://www.youtube.com/watch\?v=.*$)
          p '>>>'
          p $1
        end


      end
    end

  end
end



UpdatableSource::UpdatableSourceJob.perform


#<meta property="og:url" content="https://www.youtube.com/watch?v=_Unj-6ua1CI">
#<meta property="og:title" content="Kotlin и С#. Чему языки могут поучиться друг у друга? (Дмитрий Иванов)">

#check_link_sets


# ls = LinksSet::LinksSetModel.new
# ls.save

