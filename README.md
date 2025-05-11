
# camera_gallery_photopicker

A Flutter helper package to easily pick images from the gallery or camera. This package provides a user-friendly interface with a bottom sheet for selecting the image source (camera or gallery) and passes the selected image data to your callback function.

[![Pub Version](https://img.shields.io/pub/v/camera_gallery_photopicker.svg)](https://pub.dev/packages/camera_gallery_photopicker)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Buy Me a Coffee](https://img.shields.io/badge/Buy_Me_a_Coffee-Treat-yellow?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://buymeacoffee.com/mahafujer1w)


## Features

- **Pick images from the gallery or camera**.
- **Bottom sheet UI** for easy source selection (Gallery or Camera).
- Provides the **selected image data** to a callback function.
- Compatible with **Flutter 2.0+** and supports **null safety**.

_## Installation

Add the following dependency to your `pubspec.yaml` file:_

```yaml
dependencies:
  image_picker_helper: ^0.0.4  # Make sure to use the latest version
```

Then, run the following command to install the package:

```bash
const like = 'sample';
```

## Usage

### 1. Import the Package

```dart
import 'package:image_picker_helper/image_picker_helper.dart';
```
## Make helper class
```dart
class ImagePickerHelper {

  static void showImagePickerOption(BuildContext context, Function(File) onImagePicked) {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4.2,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromGallery(onImagePicked);
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(Icons.image, size: 50,),
                          Text('Gallery')
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromCamera(onImagePicked);
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(Icons.camera_alt, size: 50),
                          Text('Camera')
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Pick image from gallery
  static Future _pickImageFromGallery(Function(File) onImagePicked) async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    File selectedImage = File(returnImage.path);
    onImagePicked(selectedImage);
    Get.back();
  }

  // Pick image from camera
  static Future _pickImageFromCamera(Function(File) onImagePicked) async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    File selectedImage = File(returnImage.path);
    onImagePicked(selectedImage);
    Get.back();
  }
}
```

### 2. Show Image Picker Options


To show the options to pick an image from the gallery or camera, use the `showImagePickerOption` method. You can pass a callback function to handle the selected image.

```dart
ImagePickerHelper.showImagePickerOption(
  context,
  (File pickedImage) {
    setState(() {
      selectedImage = pickedImage;
      _image = pickedImage.readAsBytesSync();
    });
  },
);
```

### 3. Example Usage

Here is an example of how you can use the package in your Flutter widget:

```dart
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker_helper/image_picker_helper.dart';

class MyImagePickerScreen extends StatefulWidget {
  @override
  _MyImagePickerScreenState createState() => _MyImagePickerScreenState();
}

class _MyImagePickerScreenState extends State<MyImagePickerScreen> {
  File? selectedImage;
  Uint8List? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Picker Example')),
      body: Center(
        child: Column(
          children: [
            selectedImage == null
                ? Text('No image selected.')
                : Image.file(selectedImage!),
            ElevatedButton(
              onPressed: () {
                // Use the package to show the image picker options
                ImagePickerHelper.showImagePickerOption(context, (File pickedImage) {
                  setState(() {
                    selectedImage = pickedImage;
                    _image = pickedImage.readAsBytesSync();
                  });
                });
              },
              child: Text("Pick Image"),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: MyImagePickerScreen()));
}
```

## Customization

You can easily customize the `showImagePickerOption` method by modifying the UI and logic inside the package. You can add additional options or customize the image picker behavior to suit your needs.

## Requirements

- **Flutter 2.0+**
- **Dart 2.12+** (Supports null safety)

## Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Make your changes.
4. Commit your changes (`git commit -am 'Add new feature'`).
5. Push to the branch (`git push origin feature-name`).
6. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions or issues, feel free to reach out or open an issue on the [GitHub repository](https://github.com/mahafujerrahman/image_picker_helper).
