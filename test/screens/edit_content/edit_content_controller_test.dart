import 'package:flutter_test/flutter_test.dart';
import 'package:goggle_keep_copy/models/content.dart';
import 'package:goggle_keep_copy/models/controllers/unique_contents_controller.dart';
import 'package:goggle_keep_copy/models/unique_content_id.dart';
import 'package:goggle_keep_copy/repository/unique_contents_repository.dart';
import 'package:goggle_keep_copy/screens/edit_content/edit_content_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../helper/unique_contents_repository_fake.dart';

void main() {
  late ProviderContainer container;
  late UniqueContentsRepositoryFake fakeRepository;
  late UniqueContentId id;

  const content = Content(
    title: 'title',
    text: 'text',
    imagePaths: [
      'http://exmaple.com',
      'http://exmaple2.com',
      'http://exmaple3.com',
    ],
  );

  setUp(() async {
    container = ProviderContainer();
    fakeRepository = UniqueContentsRepositoryFake();
    container = ProviderContainer(
      overrides: [
        uniqueContentsRepositoryProvider
            .overrideWithProvider(Provider.autoDispose((ref) => fakeRepository))
      ],
    );
    final uniqueContentsController =
        container.read(uniqueContentsProvider.notifier);

    // Wait for loading
    await expectLater(
        uniqueContentsController.stream.map((event) => event.isLoading).first,
        completion(false));

    id = uniqueContentsController.add(content);
  });

  test('initialize', () async {
    final target = container.read(editContentProvider(id).notifier);

    expect(target.debugState.content, content);
  });

  test('update', () async {
    final target = container.read(editContentProvider(id).notifier);
    final uniqueContentsController =
        container.read(uniqueContentsProvider.notifier);

    expect(target.debugState.content, content);
    expect(uniqueContentsController.debugState.contents.first.content, content);

    const newContent = Content(
      title: 'newTitle',
      text: 'newText',
    );

    target.update(newContent);

    expect(target.debugState.content, newContent);
    expect(
        uniqueContentsController.debugState.contents.first.content, newContent);
  });

  test('deleteImage', () async {
    final target = container.read(editContentProvider(id).notifier);
    final uniqueContentsController =
        container.read(uniqueContentsProvider.notifier);

    expect(target.debugState.content.imagePaths.length, 3);
    expect(
        uniqueContentsController
            .debugState.contents.first.content.imagePaths.length,
        3);

    final deleteImage = content.imagePaths[1];
    target.deleteImage(deleteImage);

    expect(target.debugState.content.imagePaths.length, 2);
    expect(
        uniqueContentsController
            .debugState.contents.first.content.imagePaths.length,
        2);

    expect(target.debugState.content.imagePaths, isNot(contains(deleteImage)));
  });
}
