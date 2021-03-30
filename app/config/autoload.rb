
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
loader.push_dir('./app/packages')
loader.setup

