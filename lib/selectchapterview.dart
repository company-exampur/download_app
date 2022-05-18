

import 'package:exampur_mobile/videomaterial.dart';


import 'package:exampur_mobile/widgets/custom_button_amber_color_watch.dart';


import 'package:exampur_mobile/utils/appBar.dart';
import 'package:exampur_mobile/utils/app_constants.dart';
import 'package:exampur_mobile/utils/dimensions.dart';
import 'package:exampur_mobile/utils/images.dart';
import 'package:flutter/material.dart';

import 'downloads/downloads.dart';



class SelectChapterView extends StatefulWidget {

   SelectChapterView() : super();

  @override
  State<SelectChapterView> createState() => _SelectChapterViewState();
}

class _SelectChapterViewState extends State<SelectChapterView> {

  bool isLoading = false;

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body:
        Container(
          margin: EdgeInsets.all(16),
          child: Center(
            child:

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                      CustomAmberButton(text: StringConstant.watch, onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>MyMaterialViedo("https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4")
                            )
                        );
                       // YoutubeVideo(materialList[index].videoLink.toString(), materialList[index].title.toString())
                      }),
                          CustomAmberButton(text: StringConstant.downloads, onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>Downloads()
                                )
                            );
                            // YoutubeVideo(materialList[index].videoLink.toString(), materialList[index].title.toString())
                          }),

                          SizedBox(width: 5),

                        ],
                      ),



          ),
        ));

  }

}
