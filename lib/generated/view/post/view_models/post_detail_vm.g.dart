// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../view/post/view_models/post_detail_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchPostById)
const fetchPostByIdProvider = FetchPostByIdFamily._();

final class FetchPostByIdProvider
    extends $FunctionalProvider<AsyncValue<Post>, Post, FutureOr<Post>>
    with $FutureModifier<Post>, $FutureProvider<Post> {
  const FetchPostByIdProvider._({
    required FetchPostByIdFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'fetchPostByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchPostByIdHash();

  @override
  String toString() {
    return r'fetchPostByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Post> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Post> create(Ref ref) {
    final argument = this.argument as int;
    return fetchPostById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPostByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchPostByIdHash() => r'a78ecffd004ce75dbe18be3a2ff81f51691bbc2f';

final class FetchPostByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Post>, int> {
  const FetchPostByIdFamily._()
    : super(
        retry: null,
        name: r'fetchPostByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchPostByIdProvider call(int id) =>
      FetchPostByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'fetchPostByIdProvider';
}
