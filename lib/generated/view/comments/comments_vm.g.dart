// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../view/comments/comments_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchCommentsForPost)
const fetchCommentsForPostProvider = FetchCommentsForPostFamily._();

final class FetchCommentsForPostProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CommentModel>>,
          List<CommentModel>,
          FutureOr<List<CommentModel>>
        >
    with
        $FutureModifier<List<CommentModel>>,
        $FutureProvider<List<CommentModel>> {
  const FetchCommentsForPostProvider._({
    required FetchCommentsForPostFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'fetchCommentsForPostProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchCommentsForPostHash();

  @override
  String toString() {
    return r'fetchCommentsForPostProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<CommentModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CommentModel>> create(Ref ref) {
    final argument = this.argument as int;
    return fetchCommentsForPost(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCommentsForPostProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchCommentsForPostHash() =>
    r'4c1d8a0e8ee2442bc224853611b7c253530d0d9b';

final class FetchCommentsForPostFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<CommentModel>>, int> {
  const FetchCommentsForPostFamily._()
    : super(
        retry: null,
        name: r'fetchCommentsForPostProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchCommentsForPostProvider call(int postId) =>
      FetchCommentsForPostProvider._(argument: postId, from: this);

  @override
  String toString() => r'fetchCommentsForPostProvider';
}
