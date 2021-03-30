describe 'App' do
  it 'downloads habrahabr rss' do

    habr_url = "http://habr.com/ru/rss/all/all/?fl=ru"

    require_relative '../../app/db/schema'
    define_schema

    LinksContainer::LinksContainerModel.create(
      url: habr_url,
      #url: 'http://localhost:3000',
      repeating: true,
      updated_at: Time.now - 2.days
    )


    allow(CACHE).to receive(:read).with("url:#{habr_url}").and_return(nil)
    allow(CACHE).to receive(:write)

    stub_request(:get, habr_url).
      to_return(:status => 200, :body => fixture('habr.rss'))


    2.times do
      puts '...'
      LinksContainer::LinksContainerJob.async.perform
    end

    puts "................. #{LinksContainer::LinksContainerModel.count}".red

    expect(LinksContainer::LinksContainerModel.find_by(url: 'https://habr.com/ru/post/505212/').content).to be_nil
    expect(LinksContainer::LinksContainerModel.find_by(url: 'https://habr.com/ru/post/505196/').content).to be_nil


  end
end