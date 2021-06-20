import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goggle_keep_copy/models/content.dart';
import 'package:goggle_keep_copy/models/controllers/unique_contents_controller.dart';
import 'package:goggle_keep_copy/models/unique_content.dart';
import 'package:goggle_keep_copy/repository/unique_contents_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class _UniqueContentsRepositoryFake implements UniqueContentsRepository {
  bool _hasLoaded = false;
  bool get hasLoaded => _hasLoaded;

  @override
  Future<List<UniqueContent>> loadUniqueContents() async {
    _hasLoaded = true;
    return <UniqueContent>[];
  }

  bool _hasSaved = false;
  bool get hasSaved => _hasSaved;

  @override
  Future<void> saveUniqueContents(List<UniqueContent> uniqueContents) async {
    _hasSaved = true;
  }
}

void main() {
  late ProviderContainer container;
  late _UniqueContentsRepositoryFake fakeRepository;

  setUp(() async {
    fakeRepository = _UniqueContentsRepositoryFake();

    container = ProviderContainer(
      overrides: [
        uniqueContentsRepositoryProvider
            .overrideWithProvider(Provider.autoDispose((ref) => fakeRepository))
      ],
    );
  });

  // コンストラクタでref.readを渡す必要がある。
  // ref.readでFakeのRepositoryを取得できるようにしたい。。

  test('add', () async {
    final target = UniqueContentsController(container.read);
    final repository = container.read(uniqueContentsRepositoryProvider);

    expect(target.debugState.contents, isEmpty);
    expect(fakeRepository._hasSaved, isFalse);

    const content = Content(
      title: 'title',
      text: 'text',
    );

    final id = target.add(content);
    expect(id, isNotNull);

    expect(target.debugState.contents.length, 1);
    final addedContent = target.debugState.contents.first;
    expect(addedContent.content, content);

    expect(fakeRepository._hasSaved, isTrue);
  });

  test('updateContent', () async {
    final target = UniqueContentsController(container.read);

    expect(target.debugState.contents, isEmpty);
    expect(fakeRepository._hasSaved, isFalse);

    const content = Content(
      title: 'title',
      text: 'text',
    );

    final id = target.add(content);

    const newTitle = 'NewTitle';
    const newText = 'NewText';
    const newContent = Content(
      title: newTitle,
      text: newText,
    );

    target.updateContent(id, newContent);

    expect(target.debugState.contents.length, 1);
    final updatedContent = target.debugState.contents.first;

    expect(updatedContent.content, newContent);

    expect(fakeRepository._hasSaved, isTrue);
  });

  test('delete', () async {
    final target = UniqueContentsController(container.read);

    expect(target.debugState.contents, isEmpty);
    expect(fakeRepository._hasSaved, isFalse);

    const content = Content(
      title: 'title',
      text: 'text',
    );

    final id = target.add(content);
    expect(target.debugState.contents.length, 1);

    target.delete(id);

    expect(target.debugState.contents.length, 0);

    expect(fakeRepository._hasSaved, isTrue);
  });
}
