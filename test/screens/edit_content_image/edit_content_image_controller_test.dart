import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:goggle_keep_copy/models/content.dart';
import 'package:goggle_keep_copy/models/controllers/unique_contents_controller.dart';
import 'package:goggle_keep_copy/models/unique_content_id.dart';
import 'package:goggle_keep_copy/screens/edit_content/edit_content_controller.dart';
import 'package:goggle_keep_copy/screens/edit_content_image/edit_content_image_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiver/iterables.dart';

void main() {
  late ProviderContainer container;
  late UniqueContentId id;

  const content = Content(
    title: 'title',
    text: 'text',
    images: [
      NetworkImage('http://exmaple.com'),
      NetworkImage('http://exmaple2.com'),
      NetworkImage('http://exmaple3.com'),
    ],
  );

  setUp(() async {
    container = ProviderContainer();
    id = container.read(uniqueContentsProvider.notifier).add(content);
  });

  test('initialize', () async {
    final target = container.read(editContentImageProvider(id).notifier);
    expect(target.debugState.images, orderedEquals(content.images));
  });

  test('toNext', () async {
    final target = container.read(editContentImageProvider(id).notifier);

    expect(target.debugState.currentImageIndex, 0);
    target.toNext();
    expect(target.debugState.currentImageIndex, 1);

    for (var i = 0; i < content.images.length; i++) {
      target.toNext();
    }
    expect(target.debugState.currentImageIndex, content.images.length - 1);
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

    final deleteImage = content.images[1];
    expect(target.debugState.images, contains(deleteImage));
    expect(
        editContentController.debugState.content.images, contains(deleteImage));

    target.delete(deleteImage);

    expect(target.debugState.images, isNot(contains(deleteImage)));
    expect(editContentController.debugState.content.images,
        isNot(contains(deleteImage)));
  });

  test('deleteCurrent', () async {
    final target = container.read(editContentImageProvider(id).notifier);
    final editContentController =
        container.read(editContentProvider(id).notifier);

    const index = 1;
    target.open(index);
    final deleteImage = content.images[index];
    expect(target.debugState.images, contains(deleteImage));
    expect(
        editContentController.debugState.content.images, contains(deleteImage));

    target.deleteCurrent();

    expect(target.debugState.images, isNot(contains(deleteImage)));
    expect(editContentController.debugState.content.images,
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
