import 'package:file_picker/file_picker.dart';

void selectFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result == null) return;

  String? filePath = result.files.single.path;
  String fileName = result.files.single.name;

  print('Selected file: $filePath');
  print('Selected file: $fileName');
}
