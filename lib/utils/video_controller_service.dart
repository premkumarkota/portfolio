import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoControllerService {
  static final VideoControllerService _instance =
      VideoControllerService._internal();
  factory VideoControllerService() => _instance;
  VideoControllerService._internal();

  final Map<String, VideoPlayerController> _controllers = {};
  final Map<String, Future<void>> _initializationFutures = {};

  /// Start preloading a video from an asset or network url
  Future<void> preload(String url, {bool isAsset = false}) async {
    if (_controllers.containsKey(url)) return;

    VideoPlayerController controller;
    if (isAsset) {
      controller = VideoPlayerController.asset(url);
    } else {
      controller = VideoPlayerController.networkUrl(Uri.parse(url));
    }

    _controllers[url] = controller;

    // Create the future but don't await it here to avoid blocking
    _initializationFutures[url] = _initializeController(controller);
  }

  Future<void> _initializeController(VideoPlayerController controller) async {
    try {
      // Mute immediately to allow autoplay logic to work on Web
      await controller.setVolume(0.0);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play(); // Start playing immediately to buffer frames
    } catch (e) {
      debugPrint("Preloading error: $e");
    }
  }

  /// Get a controller if it exists. Returns null if not preloaded.
  VideoPlayerController? getController(String url) {
    return _controllers[url];
  }

  /// Get the initialization future to wait for validity
  Future<void>? getInitializationFuture(String url) {
    return _initializationFutures[url];
  }

  void dispose(String url) {
    final controller = _controllers[url];
    controller?.dispose();
    _controllers.remove(url);
    _initializationFutures.remove(url);
  }
}
