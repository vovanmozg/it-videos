module LinksSetAddress
	class LinksSetAddressJob < RocketJob::Job
		include RocketJob::Batch

		def perform
			# взять все адреса и каждый адрес перевести в :started
			p "performed #{self.class.name}"
		end
	end
end
