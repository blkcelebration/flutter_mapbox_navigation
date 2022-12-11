// import 'dart:io';

// import 'package:thinkz/shared/services/camera/camera_service.dart';
// import 'package:flutter/material.dart';

// class CameraWidgetExample extends StatefulWidget {
//   const CameraWidgetExample({Key? key}) : super(key: key);

//   @override
//   State<CameraWidgetExample> createState() => _CameraWidgetExampleState();
// }

// class _CameraWidgetExampleState extends State<CameraWidgetExample> {
//   bool imagePicked = false;
//   File? imageFile;
//   void onButtonPressed(bool isFromGallery) async {
//     var cameraServiceResponse = await CameraService.uploadImage(isFromGallery: isFromGallery);
//     File? imgFileFromService = cameraServiceResponse[CameraService.IMAGE_FILE];
//     if (imgFileFromService != null) {
//       setState(() {
//         imageFile = imgFileFromService;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Text("Camera & Gallery Usage Example:"),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () => onButtonPressed(true),
//               child: const Text("Upload Image"),
//             ),
//             const SizedBox(width: 20),
//             ElevatedButton(
//               onPressed: () => onButtonPressed(false),
//               child: const Text("Capture Image"),
//             ),
//           ],
//         ),
//         if (imageFile != null)
//           SizedBox(
//             width: 200,
//             height: 200,
//             child: Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Image.file(
//                 imageFile!,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
