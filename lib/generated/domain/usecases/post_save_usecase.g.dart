// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../domain/usecases/post_save_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(postSaveUsecase)
const postSaveUsecaseProvider = PostSaveUsecaseProvider._();

final class PostSaveUsecaseProvider
    extends
        $FunctionalProvider<PostSaveUsecase, PostSaveUsecase, PostSaveUsecase>
    with $Provider<PostSaveUsecase> {
  const PostSaveUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postSaveUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postSaveUsecaseHash();

  @$internal
  @override
  $ProviderElement<PostSaveUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostSaveUsecase create(Ref ref) {
    return postSaveUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostSaveUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostSaveUsecase>(value),
    );
  }
}

String _$postSaveUsecaseHash() => r'69ead7ef4436d1ebbd5a7dc0cdb997b8904b58bf';
