import 'package:image_picker/image_picker.dart';

class ImageService {
  Future<XFile?> pickImageFromGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    return image;
  }
}
