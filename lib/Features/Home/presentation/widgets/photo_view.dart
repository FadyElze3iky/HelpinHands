import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatefulWidget {
  final String imageUrl; // Replace with your image URL

  const PhotoViewer({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _PhotoViewerState createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      backgroundColor:
          Colors.black, // Background color for immersive experience
      body: Stack(
        children: [
          PhotoView(
            imageProvider: NetworkImage(widget.imageUrl),
            minScale: PhotoViewComputedScale
                .contained, // Fit the photo viewer to contain the image.
          ),
        ],
      ),
    );
  }
}
