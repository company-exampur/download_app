import 'dart:io';
import 'package:chewie/chewie.dart';
import 'dart:isolate';
import 'dart:ui';
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
  ReceivePort _port = ReceivePort();
  @override
  void initState() {
    IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setState((){ });
    });

    FlutterDownloader.registerCallback(downloadCallback);
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
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort send = IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
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
           Center(child: CustomAmberButton(onPressed: () async {
      final status = await Permission.storage.request();

      if(status.isGranted) {
        requestVideoDownload();

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Wait the downloading is starting")));
      }else{

        print('Permission Denied');
      } },text: StringConstant.downloadVideo,))
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

