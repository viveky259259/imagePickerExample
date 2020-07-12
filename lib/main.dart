import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    title: 'Image Picker Example',
    home: ImagePickerExample(),
  ));
}

class ImagePickerExample extends StatefulWidget {
  @override
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  File imageFile;

  void pickImage() async {
    //pick image
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    imageFile = File(pickedFile.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picking Image'),
      ),
      body: imageFile == null
          ? Text('Select image  by clicking add image from bottom')
          : Image.file(imageFile),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
