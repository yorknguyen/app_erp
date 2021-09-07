/**
 * Copyright (C) 2021
 *
 * Description: The file class
 *
 * Change history:
 * Date             Defect#             Person             Comments
 * -------------------------------------------------------------------------------
 * August 4, 2021     ********           HoangNCM            Initialize
 *
 */

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gmc_erp/public/constant/color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:dotted_border/dotted_border.dart';

class DottedButton extends StatelessWidget {
  final String text;
  final Set<void> Function(List<String>) onPress;
  final Set<void> Function() onPickImage;
  final double vertical;
  final double horizontal;
  final double width;
  final HexColor? color;
  final HexColor? colorText;
  final HexColor? colorBorder;
  const DottedButton({
    Key? key,
    required this.text,
    required this.onPress,
    required this.onPickImage,
    required this.vertical,
    required this.horizontal,
    required this.width,
    this.color,
    this.colorText,
    this.colorBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * width,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(10),
        color:  Colors.blueAccent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CupertinoButton(
            padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
            color: this.color != null ? color : HexColor(kLogin),
            onPressed: () {
              final act = CupertinoActionSheet(
                  title: Text('Attachment', style: TextStyle(color: HexColor(kBlue500)),),
                  actions: <Widget>[
                    CupertinoActionSheetAction(
                      child: Text('Document'),
                      onPressed: () {
                        onPress(['pdf', 'docs', 'xlsx']);
                        Navigator.of(context, rootNavigator: true).pop("0");
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: Text('Images'),
                      onPressed: () {
                        onPickImage();
                        Navigator.of(context, rootNavigator: true).pop("1");
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: Text('Camera'),
                      onPressed: () {
                        print('pressed');
                        onPress(['jpg', 'jpeg', 'png']);
                        Navigator.of(context, rootNavigator: true).pop("1");
                      },
                    )
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop("Cancel");
                    },
                  ));
              showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) => act);
            },
            child: Center(
              child: Row(
                children: [
                Icon(Icons.attach_file, color: this.colorText,),
                  Text(
                    text,
                    style: TextStyle(color: this.colorText, fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}