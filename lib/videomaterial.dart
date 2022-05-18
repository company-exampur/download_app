import 'dart:io';
import 'package:chewie/chewie.dart';

import 'package:exampur_mobile/downloads/downloads.dart';

import 'package:exampur_mobile/utils/appBar.dart';
import 'package:exampur_mobile/utils/app_constants.dart';
import 'package:exampur_mobile/widgets/custom_button_amber_color_watch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

class MyMaterialViedo extends StatefulWidget {
  String url;

  MyMaterialViedo(this.url,) : super();

  @override
  _MyMaterialViedoState createState() => _MyMaterialViedoState();
}

class _MyMaterialViedoState extends State<MyMaterialViedo> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    // print(widget.url);
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.url);
    chewieController = ChewieController(
        cupertinoProgressColors: ChewieProgressColors(),
        videoPlayerController: videoPlayerController,
        aspectRatio: 16/9,
        autoPlay: true,
        looping: true,
        autoInitialize: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text("Video unavanilable",style: TextStyle(color: AppColors.white),),
          );
        });

  }
  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32,),
          Container(
            //padding: EdgeInsets.only(top: 8),
            height: (MediaQuery.of(context).size.width)/16*9,
            width: MediaQuery.of(context).size.width,
            child: Chewie(
                controller: chewieController
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
           // child:   Text(widget.title,style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 60,),
      // widget.download ==''?SizedBox():
     /* Center(
            child: Container(
    height: 45,width:MediaQuery.of(context).size.width/1.10,decoration: BoxDecoration( color:AppColors.amber,
    borderRadius: BorderRadius.all(Radius.circular(8))),child: Center(child: Text(StringConstant.downloadVideo,style: TextStyle(color: Colors.white,fontSize: 15)
            ))),
          )*/
           Center(child: CustomAmberButton(onPressed: (){
             AppConstants.checkPermission(context, Permission.storage, requestVideoDownload);
           },text: StringConstant.downloadVideo,))
        ],
      ),
    );
  }
  Future<void> requestVideoDownload() async {
    final dir = await getApplicationDocumentsDirectory();

    var _localPath = dir.path + '/' + "1"; //widget.title;
    final savedDir = Directory(_localPath);
    await savedDir.create(recursive: true).then((value) async {
      String? _taskid = await FlutterDownloader.enqueue(
        url: widget.url,
        fileName: "1",// widget.title,
        savedDir: _localPath,
        showNotification: false,
        openFileFromNotification: false,
        saveInPublicStorage: false,
      );

      Navigator.push(context, MaterialPageRoute(builder: (_) =>
          Downloads()
      ));
    });
  }
}

