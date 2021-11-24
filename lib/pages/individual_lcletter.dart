// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../kyc_icons_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class IndividualLCletter extends StatefulWidget {
  const IndividualLCletter({Key? key}) : super(key: key);

  @override
  State<IndividualLCletter> createState() => _IndividualLCletterState();
}

class _IndividualLCletterState extends State<IndividualLCletter> {

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
    return Scaffold(
       appBar: AppBar(
          title: const Text(
            'Individual Owner',
            style: TextStyle(color: Colors.red),
          ),
          leading:IconButton(onPressed: (){
             Navigator.of(context).pop();
          }, 
            icon: const Icon(Icons.arrow_back),
            color: Colors.red,
            ),  
            backgroundColor: Colors.white,
         ),
         body: Container(  
           margin: const EdgeInsets.fromLTRB(25.0, 15, 25, 25),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Container(
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.all(10),
                      child: const StepProgressIndicator(
                                totalSteps: 4,
                                currentStep: 4,
                                selectedColor: Colors.red,
                                unselectedColor: Colors.grey
                            ),
                    ),
                  ],
              )),
              
            Expanded(
              flex: 1,
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                    'Upload your LC1 Letter ',
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                          )
                       ),
                      Text(
                    'pending',
                    style: TextStyle(color: Colors.amber,
                    fontWeight: FontWeight.bold,)
                    )
                    ],
                  )
              ),
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
              const Expanded(
                flex: 1,
                child: Text(
                  'Your upload will help us to serve to \nconfirm your identity',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  )
                  )),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  const Text('4 of 4',
                  style: TextStyle(color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,),),
                  Container(
 
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/finalScreen');
                          },
                          child: Icon(
                            KycIcons.navigate_next,
                            color: Colors.red,
                            size: 50,
                          ),
                        )),
              
                ],
              )
            ],
         ),
         )
         
    );
    
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
