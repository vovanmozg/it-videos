def seed_db
  link = LinksContainer::LinksContainerModel.find_or_create_by(
    url: 'https://habr.com/ru/rss/all/all/?fl=ru'
  )

  link.update_attributes(repeating: true, updated_at: Time.now - 2.days)
end
