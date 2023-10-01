import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  final _imageFile = Rxn<File>();

  File? get imageFile => _imageFile.value;

  void pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      _imageFile.value = File(pickedFile.path);
    }
  }

  String get imageFilePath => _imageFile.value!.path;

}

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      ImagePickerController(),
    );

    return Obx(
      () => Container(
            width: 150.0,
            height: 150.0,
            color: controller.imageFile == null ? Colors.grey : Theme.of(context).colorScheme.background,
            child: controller.imageFile == null
                ? Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.image,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SafeArea(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.photo_library),
                                    title: const Text('Elegir de galería'),
                                    onTap: () {
                                      controller.pickImage(ImageSource.gallery);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                : Image.file(
                    controller.imageFile!,
                    fit: BoxFit.contain,
                  ),
          ),
    );
  }
}
// class _ImagePickerWidgetState  {
//   File? _imageFile = null;

//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);

//     setState(() {
//       if (pickedFile != null) {
//         _imageFile = File(pickedFile.path);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150.0,
//       height: 150.0,
//       color: _imageFile == null ? Colors.grey : Theme.of(context).colorScheme.background,
//       child: _imageFile == null
//           ? Center(
//               child: IconButton(
//                 icon: Icon(
//                   Icons.image,
//                   color: Theme.of(context).colorScheme.onBackground,
//                 ),
//                 onPressed: () {
//                   showModalBottomSheet(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return SafeArea(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             ListTile(
//                               leading: const Icon(Icons.camera_alt),
//                               title: const Text('Toma una foto'),
//                               onTap: () {
//                                 _pickImage(ImageSource.camera);
//                                 Navigator.of(context).pop();
//                               },
//                             ),
//                             ListTile(
//                               leading: const Icon(Icons.photo_library),
//                               title: const Text('Elegir de galería'),
//                               onTap: () {
//                                 _pickImage(ImageSource.gallery);
//                                 Navigator.of(context).pop();
//                               },
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             )
//           : Image.file(
//               _imageFile!,
//               fit: BoxFit.contain,
//             ),
//     );
//   }
// }