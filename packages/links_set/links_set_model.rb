# #
# module LinksSet
# 	class LinksSetModel
# 		include Mongoid::Document
# 		include Mongoid::StoreIn
# 		include Log::Loggable
# 		include AASM
#
# 		field :url, type: String
# 		field :content, type: String
# 		field :updatable, type: Boolean
#
# 		field :aasm_state
# 		aasm whiny_transitions: false do
# 			state :waiting, initial: true
# 			state :running, after_enter: :run
# 			state :downloading, after_enter: :download
# 			state :parsing, after_enter: :parse
#
# 			event :start do
# 				transitions from: :waiting, to: :downloading
# 			end
#
# 			event :parse do
# 				transitions from: :downloading, to: :parsing
# 			end
#
# 			event :finish do
# 				transitions from: :parsing, to: :waiting
# 			end
# 		end
#
# 		def download
# 			log_debug("LinksSetModel#download #{url}")
# 			parse!
# 		end
#
# 		def parse
# 			log_debug('LinksSetModel#parse')
# 			finish!
# 		end
#
# 		# def run
# 		# 	p 'LinksSetModel runned'
# 		# 	finish!
# 		# end
# 	end
# end
#
#
#
#
#
