import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:readathon/models/channel_info.dart';
import 'package:readathon/models/videos_list.dart';
import 'package:readathon/src/utils/constants.dart';

class Services{
  static const CHANNEL_ID = "UCoJOLFVcsCrQzGC3G3SftJA";
  static const _baseUrl = "youtube.googleapis.com";
  static Future<ChannelInfo> getChannelInfo() async{
    Map<String,String> parameters = {
      'part':'snippet,contentDetails,statistics',
      'id':CHANNEL_ID,
      'key': Constants.API_KEY,      
    };
    Map<String,String> headers = {
      HttpHeaders.contentTypeHeader:'application/json',    
    };
    Uri uri = Uri.https(_baseUrl, 
                        '/youtube/v3/channels', 
                        parameters);

    Response response = await http.get(uri, headers:headers);
    // print(response.body);

    ChannelInfo channelInfo = channelInfoFromJson(response.body);
    return channelInfo;
  }

  static Future<VideosList> getVideosList({String playListId, String pageToken})async
  {
    Map<String, String> parameters = {
      'part':'snippet',
      'playlistId':playListId,
      'maxResults':'8',
      'pageToken':pageToken,
      'key':Constants.API_KEY,
    };

    Map<String,String> headers = {
      HttpHeaders.contentTypeHeader:'application/json',    
    };

    Uri uri = Uri.https(_baseUrl, 
                        '/youtube/v3/playlistItems', 
                        parameters);

    Response response = await http.get(uri, headers:headers);
    VideosList videosList = videosListFromJson(response.body);

    return videosList;
  }
}

/* curl \
  'https://youtube.googleapis.com/youtube/v3/channels?part=snippet%2CcontentDetails%2Cstatistics&id=UCoJOLFVcsCrQzGC3G3SftJA&access_token=AIzaSyDAmEdL393oAW_HZtQqsuD2G8CYa6OOdms&key=[YOUR_API_KEY]' \
  --header 'Authorization: Bearer [YOUR_ACCESS_TOKEN]' \
  --header 'Accept: application/json' \
  --compressed */