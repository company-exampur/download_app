import 'package:exampur_mobile/utils/app_constants.dart';
import 'package:flutter/material.dart';

class CustomAmberButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomAmberButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CustomAmberButtonState createState() => _CustomAmberButtonState();
}

class _CustomAmberButtonState extends State<CustomAmberButton> {
  @override
  Widget build(BuildContext context) {

    return  InkWell(onTap: () {widget.onPressed();},
      child: Container(height: 80,width: 300,decoration: BoxDecoration( color: AppColors.dark,
          borderRadius: BorderRadius.all(Radius.circular(8))),child: Center(child: Text(widget.text,style: TextStyle(color: Colors.white,fontSize:22)))),
    );
  }
}