part of 'shareds.dart';

ImagePicker _imagePicker = ImagePicker();
Future<File> pickImage() async {
  PickedFile _pickedFile = await _imagePicker.getImage(source: ImageSource.gallery);
  return File(_pickedFile.path);
}