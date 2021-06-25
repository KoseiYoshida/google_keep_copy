import 'package:flutter_test/flutter_test.dart';
import 'package:goggle_keep_copy/models/content.dart';
import 'package:goggle_keep_copy/models/controllers/unique_contents_controller.dart';
import 'package:goggle_keep_copy/repository/unique_contents_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../helper/unique_contents_repository_fake.dart';

void main() {
  group('UniqueContentsController', () {
    late ProviderContainer container;
    late UniqueContentsRepositoryFake fakeRepository;

    setUp(() async {
      fakeRepository = UniqueContentsRepositoryFake();

      container = ProviderContainer(
        overrides: [
          uniqueContentsRepositoryProvider.overrideWithProvider(
              Provider.autoDispose((ref) => fakeRepository))
        ],
      );
    });

    group('add', () {
      test('correct content added', () async {
        final target = UniqueContentsController(container.read);
        const content = Content(
          title: 'title',
          text: 'text',
        );

        expect(target.debugState.contents, isEmpty);

        final _ = target.add(content);

        expect(target.debugState.contents.length, 1);
        final addedContent = target.debugState.contents.first;
        expect(addedContent.content, content);
      });

      test('saved', () async {
        final target = UniqueContentsController(container.read);
        const content = Content(
          title: 'title',
          text: 'text',
        );

        expect(fakeRepository.hasSaved, isFalse);

        final _ = target.add(content);

        expect(fakeRepository.hasSaved, isTrue);
      });
    });

    group('updateContent', () {
      test('update correctly', () async {
        final target = UniqueContentsController(container.read);
        const content = Content(
          title: 'title',
          text: 'text',
        );
        const newTitle = 'NewTitle';
        const newText = 'NewText';
        const newContent = Content(
          title: newTitle,
          text: newText,
        );

        final id = target.add(content);
        final beforeUpdate = target.debugState.contents.first.content;
        expect(beforeUpdate, content);

        target.updateContent(id, newContent);
        final afterUpdate = target.debugState.contents.first.content;
        expect(afterUpdate, newContent);
      });

      test('saved', () async {
        final target = UniqueContentsController(container.read);
        const content = Content(
          title: 'title',
          text: 'text',
        );
        const newTitle = 'NewTitle';
        const newText = 'NewText';
        const newContent = Content(
          title: newTitle,
          text: newText,
        );

        final id = target.add(content);
        expect(fakeRepository.savedContents.first.content, isNot(newContent));

        target.updateContent(id, newContent);

        expect(fakeRepository.savedContents.first.content, newContent);
      });
    });

    group('delete', () {
      test('correct content deleted', () async {
        final target = UniqueContentsController(container.read);
        const content = Content(
          title: 'title',
          text: 'text',
        );
        const content2 = Content(
          title: 'title2',
          text: 'text2',
        );

        final id = target.add(content);
        final id2 = target.add(content2);

        expect(target.debugState.contents.length, 2);
        expect(target.debugState.contents.map((e) => e.content).toList(),
            contains(content2));

        target.delete(id2);

        expect(target.debugState.contents.length, 1);
        expect(target.debugState.contents.map((e) => e.content).toList(),
            isNot(contains(content2)));
      });

      test('saved', () async {
        final target = UniqueContentsController(container.read);
        const content = Content(
          title: 'title',
          text: 'text',
        );

        final id = target.add(content);

        expect(fakeRepository.savedContents.map((e) => e.content).toList(),
            contains(content));

        target.delete(id);

        expect(fakeRepository.savedContents.map((e) => e.content).toList(),
            isNot(contains(content)));
      });
    });
  });
}
