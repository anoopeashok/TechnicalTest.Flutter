import 'package:flutter_tech_task/data/repository/post/post_repo_local.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part '../../generated/view/home/home_view_vm.g.dart';

@riverpod
class HomeViewCount extends _$HomeViewCount {
  late PostRepositoryLocal _postRepository;

  @override
  Future<int> build() async {
    _postRepository = ref.read(postLocalRepositoryProvider);
    final result = await _postRepository.fetchPosts();
    switch (result) {
      case Ok():
        return result.value.length;
      case Error():
        return 0;
    }
  }

  void increment() {
    // Only update if state has a value
    state.whenData((value) {
      state = AsyncData(value + 1);
    });
  }

  void decrement() {
    state.whenData((value) {
      if (value > 0) {
        state = AsyncData(value - 1);
      }
    });
  }
}
