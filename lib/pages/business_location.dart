import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import "package:sizer/sizer.dart";
import 'package:step_progress_indicator/step_progress_indicator.dart';


class BusinessLocation extends StatefulWidget {
  const BusinessLocation({Key? key}) : super(key: key);

  @override
  _BusinessLocationState createState() => _BusinessLocationState();
}


class _BusinessLocationState extends State<BusinessLocation> {

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
          title: const Text('Registered Company',
              style: TextStyle(
                color: Colors.red,
              )),
          centerTitle: true,
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
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(

                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: const StepProgressIndicator(
                                totalSteps: 4,
                                currentStep: 4,
                                selectedColor: Colors.red,
                                unselectedColor: Colors.grey
                            ),
                    ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // margin: const EdgeInsets.fromLTRB(20, 40, 20, 50),
                children: [
                  const Text(
                  'Upload your \nBusiness Shop',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              Container(
                // margin: const EdgeInsets.fromLTRB(30, 40, 20, 50),
                child: const Text(
                  'pending',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
                ],
              ),
              Container(

              child: _image == null
                  ? InkWell(
                      onTap: openCamera,
                      child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 25, 0, 10),
                          height: 35.h,
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 70,
                              child: Icon(KycIcons.add_a_photo,
                                  size: 80, color: Colors.red))))
                  : ClipOval(
                      child: Image.file(_image!,
                          fit: BoxFit.cover, width: 200, height: 200),
                    )),
              TextButton(
              onPressed: RemoveImage,
              child: Text('X Remove',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ))),

              Column(
                children: [
              // ignore: avoid_unnecessary_containers
              Container(
                // margin: const EdgeInsets.fromLTRB(20, 60, 20, 50),
                child: const Text(
                  'Your upload will help us to know your location and to serve you better.',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '5 of 5',
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
                              Navigator.pushNamed(context, '/finalScreen');
                            },
                            child: Icon(
                              KycIcons.navigate_next,
                              color: Colors.red,
                              size: 50,
                            ),
                          )),
                  ],
                ),
              ),

                ],
              ),
            ]),
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

  Future<void> galleryImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _image = File(image.path));
    }
    Navigator.pop(context);
  }

  void RemoveImage() {
    setState(() {
      _image = null;
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
