// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final ImagePicker _picker = ImagePicker();
  List<File> _imageFiles = [];
  List<File> _selectedImages = [];
  bool _isSelecting = false;

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String galleryPath = '${appDocDir.path}/Gallery';
    final Directory galleryDir = Directory(galleryPath);

    if (galleryDir.existsSync()) {
      List<FileSystemEntity> images = galleryDir.listSync();
      setState(() {
        _imageFiles = images.map((entity) => File(entity.path)).toList();
      });
    }
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final String newPath = '${appDocDir.path}/Gallery';
      await Directory(newPath).create(recursive: true);

      final File newImage = File('$newPath/${path.basename(image.path)}');
      await File(image.path).copy(newImage.path);
      _loadImages();
    }
  }

  void _toggleSelection(File image) {
    setState(() {
      if (_selectedImages.contains(image)) {
        _selectedImages.remove(image);
      } else {
        _selectedImages.add(image);
      }
      if (_selectedImages.isEmpty) {
        _isSelecting = false;
      }
    });
  }

  void _deleteSelectedImages() {
    for (File image in _selectedImages) {
      image.deleteSync();
    }
    setState(() {
      _selectedImages.clear();
      _isSelecting = false;
    });
    _loadImages();
  }

  void _viewImage(int initialIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ImageViewer(images: _imageFiles, initialIndex: initialIndex),
      ),
    );
  }

  void _handleTap(File image, int index) {
    if (_isSelecting) {
      _toggleSelection(image);
    } else {
      _viewImage(index);
    }
  }

  void _handleLongPress(File image) {
    setState(() {
      _isSelecting = true;
      _toggleSelection(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        actions: [
          if (_selectedImages.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: _deleteSelectedImages,
            ),
          IconButton(onPressed: _pickImage, icon: const Icon(Icons.add_a_photo))
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
        ),
        itemCount: _imageFiles.length,
        itemBuilder: (context, index) {
          final image = _imageFiles[index];
          final isSelected = _selectedImages.contains(image);
          return GestureDetector(
            onTap: () => _handleTap(image, index),
            onLongPress: () => _handleLongPress(image),
            // child: Image.file(_imageFiles[index], fit: BoxFit.cover),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.file(
                  image,
                  fit: BoxFit.cover,
                ),
                if (isSelected)
                  const Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.blue,
                        size: 30,
                      ))
              ],
            ),
          );
        },
      ),
    );
  }
}

class ImageViewer extends StatelessWidget {
  final List<File> images;
  final int initialIndex;
  const ImageViewer(
      {super.key, required this.images, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Photo'),
      ),
      body: PageView.builder(
          controller: PageController(initialPage: initialIndex),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Center(
              child: InteractiveViewer(
                panEnabled: true,
                minScale: 0.5,
                maxScale: 4.0,
                child: Image.file(images[index]),
              ),
            );
          }),
    );
  }
}
  // Future<void> _shareImage(File image) async {
  //   await FlutterShare.shareFile(
  //     title: 'Share Image',
  //     filePath: image.path,
  //   );
  // }

  // void _showMoreOptions() {
  //   if (_selectedImages.isNotEmpty) {
  //     Share.shareFiles(_selectedImages.map((img) => img.path).toList(),
  //         text: 'Check out these images');
  //     setState(() {
  //       _selectedImages.clear();
  //     });
  //   }
  // }

  // void _showImageOptions(File image) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext dialogContext) {
  //       return AlertDialog(
  //         title: const Text('Options'),
  //         actions: [
  //           TextButton(
  //             child: const Text('Share'),
  //             onPressed: () {
  //               _shareImage(image);
  //               Navigator.of(dialogContext).pop();
  //             },
  //           ),
  //           TextButton(
  //             child: const Text('Delete'),
  //             onPressed: () {
  //               image.delete();
  //               _loadImages();
  //               Navigator.of(dialogContext).pop();
  //             },
  //           ),
  //           TextButton(
  //             child: const Text('Cancel'),
  //             onPressed: () {
  //               Navigator.of(dialogContext).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
