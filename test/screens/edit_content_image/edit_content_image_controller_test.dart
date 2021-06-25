import 'package:flutter_test/flutter_test.dart';
import 'package:goggle_keep_copy/models/content.dart';
import 'package:goggle_keep_copy/models/controllers/unique_contents_controller.dart';
import 'package:goggle_keep_copy/models/unique_content_id.dart';
import 'package:goggle_keep_copy/repository/unique_contents_repository.dart';
import 'package:goggle_keep_copy/screens/edit_content/edit_content_controller.dart';
import 'package:goggle_keep_copy/screens/edit_content_image/edit_content_image_controller.dart';
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
    final target = container.read(editContentImageProvider(id).notifier);
    expect(target.debugState.imagePaths, orderedEquals(content.imagePaths));
  });

  test('toNext', () async {
    final target = container.read(editContentImageProvider(id).notifier);

    expect(target.debugState.currentImageIndex, 0);
    target.toNext();
    expect(target.debugState.currentImageIndex, 1);

    for (var i = 0; i < content.imagePaths.length; i++) {
      target.toNext();
    }
    expect(target.debugState.currentImageIndex, content.imagePaths.length - 1);
  });

  test('toPrev', () async {
    final target = container.read(editContentImageProvider(id).notifier);

    expect(target.debugState.currentImageIndex, 0);
    target.toNext();
    expect(target.debugState.currentImageIndex, 1);
    target.toPrev();
    expect(target.debugState.currentImageIndex, 0);

    target.toPrev();
    expect(target.debugState.currentImageIndex, 0);
  });

  test('open', () async {
    final target = container.read(editContentImageProvider(id).notifier);

    expect(target.debugState.currentImageIndex, 0);

    target.open(2);
    expect(target.debugState.currentImageIndex, 2);
  });

  test('delete', () async {
    final target = container.read(editContentImageProvider(id).notifier);
    final editContentController =
        container.read(editContentProvider(id).notifier);

    final deleteImage = content.imagePaths[1];
    expect(target.debugState.imagePaths, contains(deleteImage));
    expect(editContentController.debugState.content.imagePaths,
        contains(deleteImage));

    target.delete(deleteImage);

    expect(target.debugState.imagePaths, isNot(contains(deleteImage)));
    expect(editContentController.debugState.content.imagePaths,
        isNot(contains(deleteImage)));
  });

  test('deleteCurrent', () async {
    final target = container.read(editContentImageProvider(id).notifier);
    final editContentController =
        container.read(editContentProvider(id).notifier);

    const index = 1;
    target.open(index);
    final deleteImage = content.imagePaths[index];
    expect(target.debugState.imagePaths, contains(deleteImage));
    expect(editContentController.debugState.content.imagePaths,
        contains(deleteImage));

    target.deleteCurrent();

    expect(target.debugState.imagePaths, isNot(contains(deleteImage)));
    expect(editContentController.debugState.content.imagePaths,
        isNot(contains(deleteImage)));
  });

  test('currentIndex', () async {
    final target = container.read(editContentImageProvider(id).notifier);

    expect(target.currentIndex, 0);

    const index = 2;
    target.open(index);

    expect(target.currentIndex, index);
  });

  test('length', () async {
    final target = container.read(editContentImageProvider(id).notifier);

    expect(target.length, 3);

    target.deleteCurrent();

    expect(target.length, 2);
  });
}
