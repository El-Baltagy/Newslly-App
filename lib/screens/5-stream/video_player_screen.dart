import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../3-layout/layout.dart';

class VideoPlayerScreen extends StatefulWidget {
   VideoPlayerScreen({super.key,this.url});
   String? url;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {

  late YoutubePlayerController youtubePlayerController;
  @override
  void initState() {
    // TODO: implement initState
   
    final videoid=YoutubePlayer.convertUrlToId(widget.url!);
    youtubePlayerController=YoutubePlayerController(
      
      initialVideoId: videoid!,
      flags:const YoutubePlayerFlags(
        autoPlay: true
      )
      );
      setLand();
       super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    setportrit();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio:19.5/9,
            child: YoutubePlayer(controller: youtubePlayerController,
            showVideoProgressIndicator: true,
            topActions: [
              IconButton(onPressed: (){
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                    builder: (context) => LayOut(),
                ), (route) => false);
              }, icon: Icon(Icons.arrow_back,color: Colors.blue,size:30 ,)),
            ],
            bottomActions: [
              // CurrentPosition(),
              FullScreenButton(),
              ProgressBar(
                isExpanded: true,
              ),
            ],
            
            ),
          )
        ],
      ),

    );
  }
  Future setLand()async{
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
await SystemChrome.setPreferredOrientations(
  [DeviceOrientation.landscapeLeft,
   DeviceOrientation.landscapeRight,]
);
  }
  Future setportrit()async{
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
await SystemChrome.setPreferredOrientations(
  [DeviceOrientation.portraitUp,
   DeviceOrientation.portraitDown,]
);
  }
}