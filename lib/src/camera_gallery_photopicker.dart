// lib/image_picker_helper.dart

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  // Show image picker options (Gallery or Camera)
  static void showImagePickerOption(
    BuildContext context,
    Function(File) onImagePicked,
  ) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
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
                      _pickImageFromGallery(context, onImagePicked);
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(Icons.image, size: 50, color: Colors.black),
                          Text('Gallery'),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromCamera(context, onImagePicked);
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(Icons.camera_alt, size: 50, color: Colors.black),
                          Text('Camera'),
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
  static Future _pickImageFromGallery(
    BuildContext context,
    Function(File) onImagePicked,
  ) async {
    final returnImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (returnImage == null) return;
    File selectedImage = File(returnImage.path);
    onImagePicked(selectedImage);
    Navigator.pop(context);
  }

  // Pick image from camera
  static Future _pickImageFromCamera(
    BuildContext context,
    Function(File) onImagePicked,
  ) async {
    final returnImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (returnImage == null) return;
    File selectedImage = File(returnImage.path);
    onImagePicked(selectedImage);
    Navigator.pop(context);
  }
}
