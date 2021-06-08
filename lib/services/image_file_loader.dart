import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageFileLoader {
  final picker = ImagePicker();

  Future<File?> getImageFromStorage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  Future<File?> getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    return pickedFile != null ? File(pickedFile.path) : null;
  }
}
