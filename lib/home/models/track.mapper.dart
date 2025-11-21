// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'track.dart';

class TrackMapper extends ClassMapperBase<Track> {
  TrackMapper._();

  static TrackMapper? _instance;
  static TrackMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TrackMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Track';

  static String _$id(Track v) => v.id;
  static const Field<Track, String> _f$id = Field('id', _$id);
  static String _$title(Track v) => v.title;
  static const Field<Track, String> _f$title = Field('title', _$title);
  static String _$artist(Track v) => v.artist;
  static const Field<Track, String> _f$artist = Field('artist', _$artist);
  static int? _$duration(Track v) => v.duration;
  static const Field<Track, int> _f$duration = Field(
    'duration',
    _$duration,
    opt: true,
  );

  @override
  final MappableFields<Track> fields = const {
    #id: _f$id,
    #title: _f$title,
    #artist: _f$artist,
    #duration: _f$duration,
  };

  static Track _instantiate(DecodingData data) {
    return Track(
      id: data.dec(_f$id),
      title: data.dec(_f$title),
      artist: data.dec(_f$artist),
      duration: data.dec(_f$duration),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Track fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Track>(map);
  }

  static Track fromJson(String json) {
    return ensureInitialized().decodeJson<Track>(json);
  }
}

mixin TrackMappable {
  String toJson() {
    return TrackMapper.ensureInitialized().encodeJson<Track>(this as Track);
  }

  Map<String, dynamic> toMap() {
    return TrackMapper.ensureInitialized().encodeMap<Track>(this as Track);
  }

  TrackCopyWith<Track, Track, Track> get copyWith =>
      _TrackCopyWithImpl<Track, Track>(this as Track, $identity, $identity);
  @override
  String toString() {
    return TrackMapper.ensureInitialized().stringifyValue(this as Track);
  }

  @override
  bool operator ==(Object other) {
    return TrackMapper.ensureInitialized().equalsValue(this as Track, other);
  }

  @override
  int get hashCode {
    return TrackMapper.ensureInitialized().hashValue(this as Track);
  }
}

extension TrackValueCopy<$R, $Out> on ObjectCopyWith<$R, Track, $Out> {
  TrackCopyWith<$R, Track, $Out> get $asTrack =>
      $base.as((v, t, t2) => _TrackCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TrackCopyWith<$R, $In extends Track, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? title, String? artist, int? duration});
  TrackCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TrackCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Track, $Out>
    implements TrackCopyWith<$R, Track, $Out> {
  _TrackCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Track> $mapper = TrackMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? title,
    String? artist,
    Object? duration = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (title != null) #title: title,
      if (artist != null) #artist: artist,
      if (duration != $none) #duration: duration,
    }),
  );
  @override
  Track $make(CopyWithData data) => Track(
    id: data.get(#id, or: $value.id),
    title: data.get(#title, or: $value.title),
    artist: data.get(#artist, or: $value.artist),
    duration: data.get(#duration, or: $value.duration),
  );

  @override
  TrackCopyWith<$R2, Track, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TrackCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

