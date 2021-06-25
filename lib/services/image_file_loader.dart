import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageFileLoader {
  final picker = ImagePicker();

  Future<String?> getImageFromStorage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    return pickedFile?.path;
  }

  Future<String?> getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    return pickedFile?.path;
  }
}
