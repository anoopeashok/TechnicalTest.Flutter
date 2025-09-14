// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../data/repository/comments/comments_local_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(commentsLocalRepository)
const commentsLocalRepositoryProvider = CommentsLocalRepositoryProvider._();

final class CommentsLocalRepositoryProvider
    extends
        $FunctionalProvider<
          CommentsLocalRepository,
          CommentsLocalRepository,
          CommentsLocalRepository
        >
    with $Provider<CommentsLocalRepository> {
  const CommentsLocalRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commentsLocalRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commentsLocalRepositoryHash();

  @$internal
  @override
  $ProviderElement<CommentsLocalRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CommentsLocalRepository create(Ref ref) {
    return commentsLocalRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommentsLocalRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommentsLocalRepository>(value),
    );
  }
}

String _$commentsLocalRepositoryHash() =>
    r'608501976b1cd21ba8fed6e5a7f82918b400b890';
