import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/video_controller_service.dart';

class VideoWidget extends StatefulWidget {
  final String videoUrl;
  final bool isAsset;

  const VideoWidget({super.key, required this.videoUrl, this.isAsset = false});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    final service = VideoControllerService();

    // Check if controller is preloaded
    var controller = service.getController(widget.videoUrl);

    try {
      if (controller == null) {
        // Fallback if not preloaded (though it should be)
        if (widget.isAsset) {
          controller = VideoPlayerController.asset(widget.videoUrl);
        } else {
          controller = VideoPlayerController.networkUrl(
            Uri.parse(widget.videoUrl),
          );
        }
        await controller.setVolume(0.0);
        await controller.initialize();
      } else {
        // Wait for usage
        final future = service.getInitializationFuture(widget.videoUrl);
        if (future != null) {
          await future;
        }
      }

      // Assign to local state
      _videoPlayerController = controller!;

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: true,
        allowMuting: true,
        showControls: true,
        aspectRatio: _videoPlayerController.value.aspectRatio,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                errorMessage,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
        materialProgressColors: ChewieProgressColors(
          playedColor: AppColors.secondary,
          handleColor: AppColors.secondary,
          backgroundColor: Colors.grey,
          bufferedColor: AppColors.secondary.withOpacity(0.5),
        ),
      );
      if (mounted) setState(() {});
    } catch (e) {
      debugPrint("Error initializing video player: $e");
    }
  }

  @override
  void dispose() {
    // Only dispose chewie as the video controller might be shared/managed by service
    // However, for this implementation, if we created it locally we should dispose it.
    // Ideally we track ownership. For now, since we preload only one specific video,
    // we let the service manage it (it never disposes it currently).
    // _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_chewieController != null &&
        _videoPlayerController.value.isInitialized) {
      return AspectRatio(
        aspectRatio: _videoPlayerController.value.aspectRatio,
        child: Chewie(controller: _chewieController!),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.secondary),
      );
    }
  }
}
