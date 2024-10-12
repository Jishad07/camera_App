


import 'dart:io';

import 'package:camera_app/model/image_model.dart';
import 'package:camera_app/screens/gallerypage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../db/db_functions.dart';

     File? image1;
    String? image;

class CameraApp extends StatefulWidget {
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:Colors.amber,
        title: Text('Camera App',style: TextStyle(fontSize: 30),),
      ),
      body: Column(
        children: [
          Expanded(
            flex:9 ,
            child: Container(
              child: Align(
                
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Gallerypage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 207, 205, 205),
                      borderRadius: BorderRadius.circular(10)
                    ),
                     
                    
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    height: 150,
                    width: 150,
                    
                   
                    child: Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.folder_copy_rounded,size:50,),
                        Text('Gallery',style: TextStyle(fontSize: 25),),
                      ],
                    )),
                    
                  ),
                ),
              ),
              //  color: Colors.blue,
            )),
          Expanded(
            flex: 1,
            child: IconButton(onPressed: (
              
            ){
              fromCamera();
              print("button clicked");
;            }, icon:Icon(Icons.camera_alt_outlined,),style: ButtonStyle(iconSize: MaterialStatePropertyAll(50)),)),
        ],
      ),
      
    );
  }

  Future<void> fromCamera() async {
    final img1 = await ImagePicker().pickImage(source: ImageSource.camera);
    if (img1 != null) {
      setState(() {
        image1 = File(img1.path);
        image = image1!.path;
      
      });
    }
    final _imagevalues= await  Imagemodel(image: image!);
    addImage(_imagevalues);
    }
}
