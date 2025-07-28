import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:media_store_plus/media_store_plus.dart';
import 'package:video_player/video_player.dart';

class ImagePickerPackage extends StatefulWidget {
  const ImagePickerPackage({super.key});

  @override
  State<ImagePickerPackage> createState() => _ImagePickerPackageState();
}

class _ImagePickerPackageState extends State<ImagePickerPackage> {
  File? selectedImage;
  File? selectedVideo;
  File? selectedMedia;
  VideoPlayerController? videoController;

  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image picker package")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("Pick Image"),
                onPressed: () => _pickAndSaveImage(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Pick Media"),
                onPressed: () => _pickMedia(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Pick Video"),
                onPressed: () => _pickAndSaveVideo(),
              ),
              SizedBox(height: 20),
              Text("Image will be displayed here after selection"),
              if (selectedImage != null)
                Image.file(selectedImage!, height: 100, width: 100),
              if (selectedVideo != null &&
                  (videoController?.value.isInitialized ?? false))
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: videoController!.value.aspectRatio,
                      child: VideoPlayer(videoController!),
                    ),
                    IconButton(
                      onPressed: () {
                        if (videoController!.value.isPlaying) {
                          videoController!.pause();
                        } else {
                          videoController!.play();
                        }

                        // setState(() {});
                      },
                      icon: Icon(
                        videoController!.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: 50,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickAndSaveImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      log("name ${image.name}");
      log("path ${image.path}");

      // selectedImage = await File(
      //   image.path,
      // ).copy("/storage/emulated/0/Download/${image.name}");

      selectedImage = File(image.path);
      // Uint8List uint8list = await selectedImage!.readAsBytes();
      // String base64 = base64Encode(uint8list);
      // log(path);
      setState(() {});

      MediaStore mediaStore = MediaStore();

      SaveInfo? saveInfo = await mediaStore.saveFile(
        tempFilePath: image.path,
        dirType: DirType.photo,
        dirName: DirName.pictures,
        // relativePath: "Test Images",
      );
    }
  }

  Future<void> _pickAndSaveVideo() async {
    ImagePicker picker = ImagePicker();

    XFile? video = await picker.pickVideo(source: ImageSource.gallery);

    if (video != null) {
      log("name: ${video.name}");
      log("path: ${video.path}");

      selectedVideo = await File(
        video.path,
      ).copy("/storage/emulated/0/Download/${video.name}");

      selectedVideo = File(video.path);

      await videoController?.dispose();
      videoController = VideoPlayerController.file(selectedVideo!);

      await videoController!.initialize();

      setState(() {});
      videoController!.play();

      MediaStore mediaStore = MediaStore();
      SaveInfo? saveInfo = await mediaStore.saveFile(
        tempFilePath: video.path,
        dirType: DirType.video,
        dirName: DirName.dcim,
        // relativePath: "Test Videos",
      );
    }
  }

  Future<void> _pickMedia() async {
    ImagePicker picker = ImagePicker();

    XFile? mdeia = await picker.pickMedia();

    if (mdeia != null) {
      log("name ${mdeia.name}");
      log("path ${mdeia.path}");
      selectedMedia = File(mdeia.path);
      setState(() {});
    }
  }
}
