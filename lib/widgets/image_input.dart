import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'dart:io';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.getImage(source: ImageSource.camera, maxWidth: 600);

    if (pickedFile != null) {
      setState(() {
        _storedImage = File(pickedFile.path);
      });

      final fileName = path.basename(pickedFile.path);
      final appDir = await syspaths.getApplicationDocumentsDirectory();
      final savedImage = await _storedImage.copy('${appDir.path}/${fileName}');
    }
  }

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
          onPressed: _takePicture,
          icon: Icon(Icons.camera),
          label: Text('Take Picture'),
          style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
        ))
      ],
    );
  }
}
