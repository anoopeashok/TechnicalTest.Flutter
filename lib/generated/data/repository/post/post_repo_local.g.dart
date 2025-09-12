// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../data/repository/post/post_repo_local.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(postLocalRepository)
const postLocalRepositoryProvider = PostLocalRepositoryProvider._();

final class PostLocalRepositoryProvider
    extends
        $FunctionalProvider<
          PostRepositoryLocal,
          PostRepositoryLocal,
          PostRepositoryLocal
        >
    with $Provider<PostRepositoryLocal> {
  const PostLocalRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postLocalRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postLocalRepositoryHash();

  @$internal
  @override
  $ProviderElement<PostRepositoryLocal> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PostRepositoryLocal create(Ref ref) {
    return postLocalRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostRepositoryLocal value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostRepositoryLocal>(value),
    );
  }
}

String _$postLocalRepositoryHash() =>
    r'13839c4ac66311d4994c4dd0cd5aabd2e03d3e72';
