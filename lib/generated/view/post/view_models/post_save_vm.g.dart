// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../view/post/view_models/post_save_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PostSaveVM)
const postSaveVMProvider = PostSaveVMFamily._();

final class PostSaveVMProvider
    extends $AsyncNotifierProvider<PostSaveVM, bool> {
  const PostSaveVMProvider._({
    required PostSaveVMFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'postSaveVMProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$postSaveVMHash();

  @override
  String toString() {
    return r'postSaveVMProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PostSaveVM create() => PostSaveVM();

  @override
  bool operator ==(Object other) {
    return other is PostSaveVMProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$postSaveVMHash() => r'91e310bf09dafe8d13454d3e6cc36e14cc9e8c20';

final class PostSaveVMFamily extends $Family
    with
        $ClassFamilyOverride<
          PostSaveVM,
          AsyncValue<bool>,
          bool,
          FutureOr<bool>,
          int
        > {
  const PostSaveVMFamily._()
    : super(
        retry: null,
        name: r'postSaveVMProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PostSaveVMProvider call(int id) =>
      PostSaveVMProvider._(argument: id, from: this);

  @override
  String toString() => r'postSaveVMProvider';
}

abstract class _$PostSaveVM extends $AsyncNotifier<bool> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  FutureOr<bool> build(int id);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
