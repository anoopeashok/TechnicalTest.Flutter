// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../view/post_offline/post_offline_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchOfflinePosts)
const fetchOfflinePostsProvider = FetchOfflinePostsProvider._();

final class FetchOfflinePostsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Post>>,
          List<Post>,
          FutureOr<List<Post>>
        >
    with $FutureModifier<List<Post>>, $FutureProvider<List<Post>> {
  const FetchOfflinePostsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchOfflinePostsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchOfflinePostsHash();

  @$internal
  @override
  $FutureProviderElement<List<Post>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Post>> create(Ref ref) {
    return fetchOfflinePosts(ref);
  }
}

String _$fetchOfflinePostsHash() => r'cca352dddb89fecefd7e8e0be3930f4f400954f8';
