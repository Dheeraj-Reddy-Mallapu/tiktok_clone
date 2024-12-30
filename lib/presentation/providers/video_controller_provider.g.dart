// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$videoControllerHash() => r'7ffb35ec81c83f3c943176ef866949a2e9a9fe3f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$VideoController
    extends BuildlessAutoDisposeNotifier<VideoState> {
  late final String videoUrl;

  VideoState build(
    String videoUrl,
  );
}

/// See also [VideoController].
@ProviderFor(VideoController)
const videoControllerProvider = VideoControllerFamily();

/// See also [VideoController].
class VideoControllerFamily extends Family<VideoState> {
  /// See also [VideoController].
  const VideoControllerFamily();

  /// See also [VideoController].
  VideoControllerProvider call(
    String videoUrl,
  ) {
    return VideoControllerProvider(
      videoUrl,
    );
  }

  @override
  VideoControllerProvider getProviderOverride(
    covariant VideoControllerProvider provider,
  ) {
    return call(
      provider.videoUrl,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'videoControllerProvider';
}

/// See also [VideoController].
class VideoControllerProvider
    extends AutoDisposeNotifierProviderImpl<VideoController, VideoState> {
  /// See also [VideoController].
  VideoControllerProvider(
    String videoUrl,
  ) : this._internal(
          () => VideoController()..videoUrl = videoUrl,
          from: videoControllerProvider,
          name: r'videoControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$videoControllerHash,
          dependencies: VideoControllerFamily._dependencies,
          allTransitiveDependencies:
              VideoControllerFamily._allTransitiveDependencies,
          videoUrl: videoUrl,
        );

  VideoControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.videoUrl,
  }) : super.internal();

  final String videoUrl;

  @override
  VideoState runNotifierBuild(
    covariant VideoController notifier,
  ) {
    return notifier.build(
      videoUrl,
    );
  }

  @override
  Override overrideWith(VideoController Function() create) {
    return ProviderOverride(
      origin: this,
      override: VideoControllerProvider._internal(
        () => create()..videoUrl = videoUrl,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        videoUrl: videoUrl,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<VideoController, VideoState>
      createElement() {
    return _VideoControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VideoControllerProvider && other.videoUrl == videoUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, videoUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VideoControllerRef on AutoDisposeNotifierProviderRef<VideoState> {
  /// The parameter `videoUrl` of this provider.
  String get videoUrl;
}

class _VideoControllerProviderElement
    extends AutoDisposeNotifierProviderElement<VideoController, VideoState>
    with VideoControllerRef {
  _VideoControllerProviderElement(super.provider);

  @override
  String get videoUrl => (origin as VideoControllerProvider).videoUrl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
