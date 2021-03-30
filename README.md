# IT video from conferences 

#### Run main app
`rackup config.ru`

#### Run worker
`rake resque:work`



#### Workflow

- Get waiting url.

- Get waiting LinksContainerModel. It can be updateble or non-updatable source. So it can be recurring or not.
- Translate LinksContainerModel state to downloading
- Download content specified in url in LinksContainerModel
- Translate LinksContainerModel state to parsing
- Extract urls from content with Provider. These urls can lead to video or other pages with urls
- Add every url to queue
- 



#### Video sources
- habr rss feed
- http://0x1.tv/
- https://www.meetup.com/
- youtube channel
- - https://www.youtube.com/channel/UCJoerW5eDOz5qu7I2CYi7xg
- - https://www.youtube.com/user/it73ru/videos
- https://datasreda.ru/
- https://nastachku.ru/lectures