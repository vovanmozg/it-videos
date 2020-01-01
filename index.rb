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
Bundler.require(:default)

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

ls = LinksSet::LinksSetModel.new
ls.save

