// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../view/post/view_models/post_vm.dart';

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

String _$fetchPostsHash() => r'98850e7cb38694f88d7cc9f796b914256224f21f';
