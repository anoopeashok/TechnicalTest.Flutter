// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../view/home/home_view_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeViewCount)
const homeViewCountProvider = HomeViewCountProvider._();

final class HomeViewCountProvider
    extends $AsyncNotifierProvider<HomeViewCount, int> {
  const HomeViewCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeViewCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeViewCountHash();

  @$internal
  @override
  HomeViewCount create() => HomeViewCount();
}

String _$homeViewCountHash() => r'e080dad36ac519ceaa6d9188290f4a4a9d2e59f8';

abstract class _$HomeViewCount extends $AsyncNotifier<int> {
  FutureOr<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<int>, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int>, int>,
              AsyncValue<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
