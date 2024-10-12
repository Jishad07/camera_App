import 'dart:io';

import 'package:flutter/material.dart';

import '../db/db_functions.dart';

class Gallerypage extends StatelessWidget {
  const Gallerypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: SafeArea(
    child: ValueListenableBuilder(
      valueListenable: imageNotifier, 
      builder: 
      (context,data1,child){
        return GridView.builder(
          itemCount: data1.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3),
           itemBuilder: (ctx,index){
            final data=data1[index]; 
            return GestureDetector(
            onTap: () {
              showDialog(
                context: context, builder: (ctx){
                  return AlertDialog(
                   title: Text("Delete"),
                   content: Text('Are you sure'),
                   actions: [
                    TextButton(onPressed: (){
                      deletePhoto(data.id!);
                      Navigator.of(context).pop();
                    }, child: Text('Yes')),
                    TextButton(onPressed: (){
                       Navigator.of(context).pop();
                    }, child: Text('No'))
                   ], 
                  );
                });
            },
              child: Image(
              image:FileImage(File(data.image))));
           });
      })
    ),
    );
  }
}