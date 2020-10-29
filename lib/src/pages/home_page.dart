import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readathon/models/channel_info.dart';
import 'package:readathon/models/videos_list.dart';
import 'package:readathon/src/screens/video_player_screen.dart';
import 'package:readathon/src/utils/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ChannelInfo _channelInfo;
  VideosList _videosList;
  Item _item;
  bool _loading;
  String _playListId;
  String _nextPageToken;
  ScrollController _scrollController;

  @override
  void initState() { 
    super.initState();
    _loading = true;
    _nextPageToken = '';
    _scrollController = ScrollController();
    _videosList = VideosList();
    _videosList.videos = List();
    _getChannelInfo();    
  }

  _getChannelInfo()async{
    _channelInfo = await Services.getChannelInfo();
    _item = _channelInfo.items[0];
    _playListId = _item.contentDetails.relatedPlaylists.uploads;
    
    await _loadVideos();
    setState(() {
      _loading = false;
    });
  }

  _loadVideos() async{
    VideosList tempVideosList = await Services.getVideosList(
      playListId:_playListId,
      pageToken:_nextPageToken,
    );

    _nextPageToken = tempVideosList.nextPageToken;
    _videosList.videos.addAll(tempVideosList.videos);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title:Text(_loading?'Loading...':"E-Funza Videos"),
       ),
       body:Container(
         color:Colors.white,
         child: Column(
           children:[
            _buildInfoView(),
            Expanded(
              child: NotificationListener<ScrollEndNotification>(
                onNotification: (ScrollNotification notification) {
                  if(_videosList.videos.length >= int.parse(_item.statistics.videoCount)){
                    return true;
                  }
                  if(notification.metrics.pixels == notification.metrics.maxScrollExtent){
                    _loadVideos();
                  }
                  return true;
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _videosList.videos.length,
                  itemBuilder: (context, index){
                    VideoItem videoItem = _videosList.videos[index];
                    return InkWell(
                      onTap: ()async{
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context){
                            return VideoPlayerScreen(videoItem: videoItem,);
                          }
                          )
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        child:Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: videoItem.video.thumbnails.thumbnailsDefault.url,
                            ),
                            SizedBox(width:20.0),
                            Flexible(child: Text(videoItem.video.title)),
                            SizedBox(width:20.0),
                          ],                  
                        )
                      ),
                    );
                  }),
              ),
             ),
           ],
         ),
       )
    );
  }

  _buildInfoView(){
    return _loading 
      ? CircularProgressIndicator()
      :Container(
        child:Card(
          child:Row(
            children:[
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  _item.snippet.thumbnails.medium.url,
                ),
              ),
              SizedBox(width:20.0),
              Expanded(
                child: Text(
                  _item.snippet.title,
                  style:TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )
                ),
              ),
              Text(
                _item.statistics.videoCount,
              ),
              SizedBox(width:20.0),
            ],
          ),
        ),
    );
  }
}