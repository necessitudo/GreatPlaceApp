import 'package:flutter/material.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('No Image Taken', textAlign: TextAlign.center),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.camera),
          label: Text('Take Picture'),
          style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
        ))
      ],
    );
  }
}