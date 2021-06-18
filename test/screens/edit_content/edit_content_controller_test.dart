import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:goggle_keep_copy/models/content.dart';
import 'package:goggle_keep_copy/models/controllers/unique_contents_controller.dart';
import 'package:goggle_keep_copy/models/unique_content.dart';
import 'package:goggle_keep_copy/models/unique_content_id.dart';
import 'package:goggle_keep_copy/screens/edit_content/edit_content_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

    expect(target.debugState.content.images.length, 3);
    expect(
        uniqueContentsController
            .debugState.contents.first.content.images.length,
        3);

    final deleteImage = content.images[1];
    target.deleteImage(deleteImage);

    expect(target.debugState.content.images.length, 2);
    expect(
        uniqueContentsController
            .debugState.contents.first.content.images.length,
        2);

    expect(target.debugState.content.images, isNot(contains(deleteImage)));
  });
}
