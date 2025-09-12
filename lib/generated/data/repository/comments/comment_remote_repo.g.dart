// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../data/repository/comments/comment_remote_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(commentRemoteRepository)
const commentRemoteRepositoryProvider = CommentRemoteRepositoryProvider._();

final class CommentRemoteRepositoryProvider
    extends
        $FunctionalProvider<
          CommentRemoteRepository,
          CommentRemoteRepository,
          CommentRemoteRepository
        >
    with $Provider<CommentRemoteRepository> {
  const CommentRemoteRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commentRemoteRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commentRemoteRepositoryHash();

  @$internal
  @override
  $ProviderElement<CommentRemoteRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CommentRemoteRepository create(Ref ref) {
    return commentRemoteRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommentRemoteRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommentRemoteRepository>(value),
    );
  }
}

String _$commentRemoteRepositoryHash() =>
    r'4ed348814ae4c024d28e3504f3842b2ee5236f7c';
