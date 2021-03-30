class LinksSetAddress
	include Mongoid::Document
	include AASM

	state :waiting, initial: true
	state :running, before_enter: :state_running
	state :finished


	event :run do
		transitions from: :waiting, to: :running
	end

	event :finish do
		transitions from: :running, to: :finidhed
	end


	def state_running
		StateRunning.new(self).call
	end
end
