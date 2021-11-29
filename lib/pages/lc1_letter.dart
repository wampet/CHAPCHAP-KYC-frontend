import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../kyc_icons_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class LcLetter extends StatefulWidget {
  const LcLetter({Key? key}) : super(key: key);

  @override
  State<LcLetter> createState() => _LcLetterState();
}

class _LcLetterState extends State<LcLetter> {
  
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
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.red,
              iconSize: 30,
            ),
            backgroundColor: Colors.white70,
            title: const Text(
              "Registered Company",
              style: TextStyle(color: Colors.red),
            ),
            centerTitle: true,
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
                          currentStep: 3,
                          selectedColor: Colors.red,
                          unselectedColor: Colors.grey),
                    ),
                  ],

              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Upload your LC1 Letter ',
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
                ),
   
            Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                 height: 32.h,
                  width: 250,
                child:_image==null ? InkWell(
                  onTap:openCamera ,
                    child:Card(

                      //radius: 70,
                      child:Icon(KycIcons.add_a_photo, size: 80, color: Colors.red)
                      )
                    )
                  :Container(
                    child: Image.file(_image!,fit: BoxFit.fill),
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
                        'The Image of your LC1 Letter will let us know if the LC Approved of your Business',
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
                          '3 of 5',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold, )
                        ),
                        Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/businesscertificate');
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
