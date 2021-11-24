// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../kyc_icons_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class BusinessSelfie extends StatefulWidget {
  const BusinessSelfie({Key? key}) : super(key: key);

  @override
  _BusinessSelfieState createState() => _BusinessSelfieState();
}

class _BusinessSelfieState extends State<BusinessSelfie> {
  File? _image;
    final ImagePicker _picker = ImagePicker();
   Future<void> getImage()async{
  final image =await _picker.pickImage(source: ImageSource.camera);
  
  if(image != null){
    setState(()=> _image = File(image.path));
  }
   Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Registered Company',
              style: TextStyle(color: Colors.red),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.red,
            ),
            backgroundColor: Colors.white,
          ),
          body: Container(
            margin: const EdgeInsets.fromLTRB(15.0, 15, 25, 20),
            width: 90.w,
            height: 80.h,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: const StepProgressIndicator(
                          totalSteps: 5,
                          currentStep: 1,
                          selectedColor: Colors.red,
                          unselectedColor: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                        child: Image.asset('assets/normal.png',
                            height: 50, width: 60),
                      ),
                      Text('Good',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 7,
                          )),
                    ]),
                    Column(children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                        child: Image.asset('assets/cut.png',
                            height: 50, width: 60),
                      ),
                      Text('Not cut',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 7,
                          )),
                    ]),
                    Column(children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                        child: Image.asset('assets/blurry.png',
                            height: 50, width: 60),
                      ),
                      Text('Not blur',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 7,
                          )),
                    ]),
                    Column(children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                        child: Image.asset('assets/reflective.png',
                            height: 50, width: 60),
                      ),
                      Text('Not reflective',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 7,
                          )),
                    ])
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Take a Selfie',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      Text('pending',
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ))
                    ],

                  )),
              Container(
                child:_image==null ? InkWell(
                  onTap:openCamera ,
                  
                  child: Container(
                    child:CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 70,
                      child:Icon(KycIcons.add_a_photo, size: 80, color: Colors.red)
                      )
                    )
                  ):ClipOval(
                    child: Image.file(_image!,fit: BoxFit.cover,width:200,height:200),
                  )
              ),
              TextButton(onPressed:RemoveImage
                
              , child:Text('X Remove',style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ))),
              

                
                Container(
                    child: Text(
                        'Your upload will help us to serve to \nconfirm your identity',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ))),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '1 of 5',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          fontWeight: FontWeight.bold,
                            ),
                        ),
                        Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/registeredNationalId');
                              },
                              child: Icon(
                                KycIcons.navigate_next,
                                color: Colors.red,
                                size: 50,
                              ),
                            )),
                      ],
                    ))
              ],
            ),
          ));
    });
  }
  Future <void> openCamera() async{
    var CameraStatus= await Permission.camera;
    var GalleryStatus= await Permission.storage;
    //print(CameraStatus);
    //print(GalleryStatus);

    if (CameraStatus.isGranted!=true) {
      await Permission.camera.request();
    }
    if (GalleryStatus.isGranted!=true) {
      Permission.storage.request();
    }
    if(await Permission.camera.isGranted){
       if (await Permission.storage.isGranted) {
          ShowPicker(context);
       }
         
    }
    
  }
  
  Future<void> galleryImage()async{
    final image =await _picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      setState(()=> _image = File(image.path));
    }
    Navigator.pop(context);
  }
 void RemoveImage(){
    setState(() {
      _image=null;
    });
  }
  void ShowPicker(content) {
    
     showDialog(context: context, builder: (BuildContext bc){
      return  AlertDialog(
        
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           ListTile(
             leading: Icon(Icons.library_books),
             title: Text('Gallery'),
             onTap: galleryImage  
           ),
           ListTile(
             leading: Icon(Icons.camera),
             title: Text('Camera'),
             onTap: getImage  
           )
         ],
        ),  
      );
      
    }
    
    );
  }
}
