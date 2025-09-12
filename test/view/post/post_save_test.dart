import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/view/post/post_save.dart';
import 'package:flutter_tech_task/view/post/view_models/post_save_vm.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// where postSaveVMProvider lives

class FakePost extends Mock implements Post {}

class FakePostSaveVM extends PostSaveVM {
  final bool value;
  FakePostSaveVM(this.value);

  @override
  Future<bool> build(int postId) async => value;

  @override
  Future<void> savePost(Post post) async {
    state = AsyncValue.data(true);
  }

  @override
  Future<void> unSavePost(int postId) async {
    state = AsyncValue.data(false);
  }
}

void main() {
  final post = Post(id: 1, title: "Test", body: "Some body", userId: 1);

  testWidgets('shows filled bookmark when post is saved', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          postSaveVMProvider(post.id).overrideWith(
            () => FakePostSaveVM(true), // 👈 stub the value directly
          ),
        ],
        // Override provider to return `true`
        child: MaterialApp(
          home: Scaffold(
            body: PostSaveButton(post: post), // cast if needed
          ),
        ),
      ),
    );

    await tester.pump(); // let FutureProvider resolve

    expect(find.byIcon(Icons.bookmark), findsOneWidget);
    expect(find.byIcon(Icons.bookmark_border), findsNothing);
  });

  testWidgets('shows border bookmark when post is NOT saved', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // Override provider to return `false`
          postSaveVMProvider(post.id).overrideWith(() => FakePostSaveVM(false)),
        ],
        child: MaterialApp(
          home: Scaffold(body: PostSaveButton(post: post as dynamic)),
        ),
      ),
    );

    await tester.pump();

    expect(find.byIcon(Icons.bookmark_border), findsOneWidget);
    expect(find.byIcon(Icons.bookmark), findsNothing);
  });

  testWidgets('shows nothing while loading', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // Simulate never-completing future (loading state)
          postSaveVMProvider.overrideWith(() => FakePostSaveVM(false)),
        ],
        child: MaterialApp(
          home: Scaffold(body: PostSaveButton(post: post as dynamic)),
        ),
      ),
    );

    // no need to pump further → still loading
    expect(find.byType(SizedBox), findsOneWidget);
  });
}
