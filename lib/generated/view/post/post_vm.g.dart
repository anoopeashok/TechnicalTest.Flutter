// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../view/post/post_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchPosts)
const fetchPostsProvider = FetchPostsProvider._();

final class FetchPostsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Post>>,
          List<Post>,
          FutureOr<List<Post>>
        >
    with $FutureModifier<List<Post>>, $FutureProvider<List<Post>> {
  const FetchPostsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchPostsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchPostsHash();

  @$internal
  @override
  $FutureProviderElement<List<Post>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Post>> create(Ref ref) {
    return fetchPosts(ref);
  }
}

String _$fetchPostsHash() => r'ad41ef3326494d50d1b3a82ae45af1fdd7d7666f';
