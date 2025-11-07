import 'package:dart_mappable/dart_mappable.dart';

part 'track.mapper.dart';

@MappableClass()
class Track with TrackMappable {
  const Track({
    required this.id,
    required this.title,
    required this.artist,
    this.duration,
  });

  final String id;
  final String title;
  final String artist;
  final int? duration;

  static const fromMap = TrackMapper.fromMap;
  static const fromJson = TrackMapper.fromJson;
}
