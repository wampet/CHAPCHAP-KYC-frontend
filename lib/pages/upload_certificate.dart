// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../kyc_icons_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class BusinessCertificate extends StatefulWidget {
  const BusinessCertificate({Key? key}) : super(key: key);

  @override
  _BusinessCertificateState createState() => _BusinessCertificateState();
}

class _BusinessCertificateState extends State<BusinessCertificate> {
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
              icon: const Icon(KycIcons.arrow_back),
              color: Colors.red,
            ),
            backgroundColor: Colors.white,
          ),
          body: Container(
            margin: const EdgeInsets.fromLTRB(15.0, 15, 15, 10),
            width: 90.w,
            height: 90.h,            
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: const StepProgressIndicator(
                          totalSteps: 5,
                          currentStep: 4,
                          selectedColor: Colors.red,
                          unselectedColor: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Upload your Certificate \nof incorporation',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('pending',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,fontSize:9
                        ))
                  ],
                ), Row(
                children: [
                  Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0) ,
                          child: Text('Example',style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold),)
                      ),
                ],
              ),
              Row(
               
                children: <Widget>[
                
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                    child: Image.asset('assets/certificate.jpg',
                        height: 100, width: 110),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(2),
                        child: Icon(
                          KycIcons.check,
                          size: 10,
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 3),
                        child: Text('Government-issued',
                            style: TextStyle(color: Colors.grey, fontSize:  12)),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(2),
                        child: Icon(
                          KycIcons.check,
                          size: 10,
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 3),
                        child: Text('Original full-size, unedited documents',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(2),
                        child: Icon(
                          KycIcons.check,
                          size: 10,
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 3),
                        child: Text('Readable well-lit, coloured images',
                            style: TextStyle(color: Colors.grey, fontSize:  12)),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(2),
                        child: Icon(
                          KycIcons.times,
                          size: 10,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 3),
                        child: Text('No edited or expired documents',
                            style: TextStyle(color: Colors.grey, fontSize:  12)),
                      ),
                    ]),
                     Row(children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(2),
                        child: Icon(
                          KycIcons.times,
                          size: 10,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 3),
                        child: Text('No black and white images',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(height: 3),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                          'File size must be between 10KB and 512KB in \n..jpg/.jpeg/.png format',
                          style: TextStyle(fontSize: 11.5,fontWeight:FontWeight.w500)),
                          
                  )],
              ),
                Container(
                margin: const EdgeInsets.fromLTRB(0, 3, 0, 5),
                 height: 13.h,
                  width: 250.w,
                child:_image==null ? InkWell(
                  onTap:openCamera ,
                    child:Card(

                      child:Icon(KycIcons.add_a_photo, size: 30, color: Colors.red)
                      )
                    )
                  :Container(
                    child: Image.file(_image!,height: 32.h, fit: BoxFit.cover,
                  width: 250,),
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
                        'The Image of your certificate will help us confirm the validality of your Business',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ))),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '4 of 5',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/businesslocation');
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
