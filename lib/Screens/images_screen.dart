import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:personaltaskmanagersystem/Helper/photo_database.dart';
import 'dart:io';
import 'dart:io' as Io;
import 'dart:async';

import '../Helper/friends_database.dart';
import '../Models/photo_model.dart';
import '../Models/utility.dart';

class SaveImageDemoSQLite extends StatefulWidget {
  //
  SaveImageDemoSQLite() : super();

  final String title = "Flutter Save Image";

  @override
  _SaveImageDemoSQLiteState createState() => _SaveImageDemoSQLiteState();
}

class _SaveImageDemoSQLiteState extends State<SaveImageDemoSQLite> {
  //
  File? imageFile;
  Image? image;
  PhotoDBHelper? photoDBHelper;
  List<Photo>? images;

  @override
  void initState() {
    super.initState();
    images = [];
    photoDBHelper = PhotoDBHelper();
    refreshImages();
  }

  refreshImages() {
    photoDBHelper!.getPhotos().then((imgs) {
      setState(() {
        images?.clear();
        images?.addAll(imgs);
      });
    });
  }


   pickImageFromGallery() {
    ImagePicker().pickImage(source: ImageSource.gallery).then((imgFile) async{
      File file = File(imgFile!.path);
      String imgString = Utility.base64String(file.readAsBytesSync());
      Photo photo = Photo(0, imgString);
      photoDBHelper?.save(photo);
      refreshImages();
    });
  }



  gridView() {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: images!.map((photo) {
          return Utility.imageFromBase64String(photo.photo_name ?? "Shakeebkhanshake");
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              pickImageFromGallery();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: gridView(),
            )
          ],
        ),
      ),
    );
  }
}