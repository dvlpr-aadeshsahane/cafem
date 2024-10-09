  import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
class FileUpload{

Future<String?> uploadFileAndGetUrl(File file, String filePath) async {
  // Initialize Firebase if not already initialized
  await Firebase.initializeApp();

  // Reference to Firebase Storage
  FirebaseStorage storage = FirebaseStorage.instance;

  try {
    // Create a reference to the location where you want to upload the file
    Reference ref = storage.ref().child(filePath);

    // Upload the file
    UploadTask uploadTask = ref.putFile(file);

    // Wait for the upload to complete and get the task snapshot
    TaskSnapshot taskSnapshot = await uploadTask;

    // Get the download URL
    String downloadURL = await taskSnapshot.ref.getDownloadURL();
    print('File uploaded successfully! Download URL: $downloadURL');

    return downloadURL;
  } catch (e) {
    print('Error occurred during file upload: $e');
    return null;
  }
}

}