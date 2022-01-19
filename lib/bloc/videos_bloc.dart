import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:coffeedark/api.dart';
import 'package:coffeedark/models/video.dart';

class VideosBloc implements BlocBase {
  Api api = Api();

  late List<Video> videos;

  final StreamController _videosController = StreamController();
  Stream get outVideos => _videosController.stream;

  final StreamController _searchController = StreamController();
  Sink get inSearch => _searchController.sink;

  VideosBloc() {
    api = Api();

    _searchController.stream.listen(_search);
  }

  void _search(dynamic search) async {
    videos = await api.search(search);

    log(videos.toString());
  }

  @override
  void dispose() {
    _videosController.close();
    _searchController.close();
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }
}
