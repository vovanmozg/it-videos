module LinksSetAddress
	class LinksSetAddressJob
		@queue = :simple

		def self.perform


			url_set = 'https://m.habr.com/ru/company/JetBrains/blog/461923/'
			p "process #{url_set}"


				doc = Nokogiri::HTML(open(url_set))
				doc.css('a').each do |a|
					url = a.attr('href')

					if url =~ /youtu/
						p url
					end
				end


			# взять все адреса и каждый адрес перевести в :started
			# p "performed #{self.class.name}"
		end
	end
end
