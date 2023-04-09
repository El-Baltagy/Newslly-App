import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:newsly_app/screens/5-stream/video_player_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Stream extends StatefulWidget {
  const Stream({super.key});

  @override
  State<Stream> createState() => _StreamState();
}

class _StreamState extends State<Stream> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 20,
              end: 20,
              top: 20
          ),
          child: GridView.builder(
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount:3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: channals_list.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VideoPlayerScreen(url:channals_list[index],),));
                },
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("${channals_image_list[index]}"),
                          fit: BoxFit.cover
                      ),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          width: 1,
                          color: Colors.black
                      )
                  ),
                ),
              );
            },
          ),
        )
    );
  }
}


List channals_image_list=[
  "https://2.bp.blogspot.com/-x6oAMI_vJIY/V4lOENKtG5I/AAAAAAAAA_8/hg0ZRnBTzTYSmFEvO3rtNzNX0733aepCgCLcB/s1600/m79G0z_U.jpg",
  "https://upload.wikimedia.org/wikipedia/en/thumb/f/ff/BBC_News.svg/1023px-BBC_News.svg.png",
  "https://mediaaws.almasryalyoum.com/news/large/2015/09/30/371876_0.jpg",
  "http://img0cf.b8cdn.com/images/logo/73/1465073_logo_1573380810_n.png",
  "https://th.bing.com/th/id/R.93fd8a61deab4edfb0fabec88c65f13c?rik=%2fl1QpLaKBzHgMw&riu=http%3a%2f%2f4.bp.blogspot.com%2f-yXDUhrFaH8Y%2fVNPG7fEYa5I%2fAAAAAAAAB2c%2fLy5jBSLY_CI%2fs1600%2ftrt.png&ehk=mfohZT1yXkMJiyNxHd0F%2bWpo9sZg%2ffZIU1hp2IQ7os8%3d&risl=&pid=ImgRaw&r=0",
  "https://www.fekera.com/wp-content/uploads/2018/12/تردد-قناة-العربية-2021-علي-النايل-سات-والعرب-سات.jpeg",
  "https://upload.wikimedia.org/wikipedia/commons/e/e3/القنا.png",
  "https://www.altkia.com/wp-content/uploads/2015/03/قناة-الحوار.jpg",
  "https://static.france24.com/meta_og_twcards/jsonld_publisher.png",
  "https://www.emploi.ma/sites/default/files/styles/medium/public/logo/alhurra.png",
  "https://i.ytimg.com/vi/C9R1JrHuWSM/maxresdefault.jpg",
  "https://pbs.twimg.com/profile_images/905053740209754112/4T05Cmmh_400x400.jpg",
  "https://yt3.googleusercontent.com/3fhJuczWLOOK0Jl5C54_JzyEJNJWg4C0ilpPv2KZX3kuDYwxA5y4ddyfMA95g7YlKvJAHwvUc6A=s176-c-k-c0x00ffffff-no-rj",
  "https://yt3.googleusercontent.com/ytc/AL5GRJV2XxP2AIQz7656l9ACPKc-GUzLiJvWM1djuoZlZQ=s176-c-k-c0x00ffffff-no-rj",
  "https://yt3.googleusercontent.com/ytc/AL5GRJVut9MugMpLKQz3_ULCdhxb2Fg5PVHsqppXijrN=s176-c-k-c0x00ffffff-no-rj",







];
List<String> channals_list=[
  "https://youtu.be/bNyUyrR0PHo",
  "https://youtu.be/HxI2TxhhS9A",
  "https://youtu.be/St61kDYyrvk",
  "https://youtu.be/yd_H1PwIB0E",
  "https://youtu.be/aSVBH45EnaQ",
  "https://youtu.be/_rewJPptlBg",
  "https://youtu.be/5x_MqAq5pos",
  "https://www.youtube.com/watch?v=ymYOBJ9pEiM",
  'https://youtu.be/gxG3pdKvlIs',
  "https://www.youtube.com/watch?v=cR7nG4NfFKA",
  "https://www.youtube.com/watch?v=eeScmS3jW8U",
  "https://www.youtube.com/watch?v=ZNABc0AS6Ts",
  'https://www.youtube.com/watch?v=e2RgSa1Wt5o',
  'https://www.youtube.com/watch?v=_QlXXXA8Vd8',
  'https://www.youtube.com/watch?v=f6VpkfV7m4Y',


];
