import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotosPage extends StatefulWidget {
  @override
  _UploadPhotosPageState createState() => _UploadPhotosPageState();
}

class _UploadPhotosPageState extends State<UploadPhotosPage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _selectedPhotos = [];

  Future<void> _pickImages(ImageSource source) async {
    final XFile? pickedImage = await _picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _selectedPhotos.add(pickedImage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload your photos", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _selectedPhotos.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return GestureDetector(
                    onTap: () => _pickImages(ImageSource.camera),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Icon(Icons.camera_alt, size: 40, color: Colors.white),
                      ),
                    ),
                  );
                } else if (index == 1) {
                  return GestureDetector(
                    onTap: () => _pickImages(ImageSource.gallery),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Icon(Icons.photo_library, size: 40, color: Colors.white),
                      ),
                    ),
                  );
                } else {
                  return Image.file(
                    File(_selectedPhotos[index - 2].path),
                    fit: BoxFit.cover,
                  );
                }
              },
            ),
          ),
          Text(
            "You have given TRUSTIFY access to only a select number of photos.",
            style: TextStyle(color: Colors.grey),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Manage", style: TextStyle(color: Colors.blue)),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white, // White background
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black, width: 2), // Black border
              ),
              child: TextButton(
                onPressed: _selectedPhotos.isNotEmpty ? () {} : null,
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
