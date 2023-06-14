import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateUserPost extends StatefulWidget {
  @override
  _CreateUserPostState createState() => _CreateUserPostState();
}

class _CreateUserPostState extends State<CreateUserPost> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _submitPost() {
    final title = _titleController.text;
    final description = _descriptionController.text;
    print('Title: $title');
    print('Description: $description');
    print('Image Path: ${_image?.path}');

    // Reset the text fields and image selection
    _titleController.clear();
    _descriptionController.clear();
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Create User Post',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.green.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: TextField(
                controller: _descriptionController,
                maxLines: null, // Allow unlimited lines for the description
                expands: true,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: _image != null
                  ? Image.file(
                      _image!,
                      height: 200.0,
                    )
                  : Container(), // Placeholder widget if _image is null
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _pickImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade200,
                      foregroundColor: Colors.black,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(12),
                    ),
                    icon: Icon(Icons.photo),
                    label: const Text(
                      'Image',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _submitPost,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade200,
                      foregroundColor: Colors.black,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(12),
                    ),
                    icon: Icon(Icons.check),
                    label: const Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
