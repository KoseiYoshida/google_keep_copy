import 'package:flutter_test/flutter_test.dart';
import 'package:goggle_keep_copy/models/content.dart';
import 'package:goggle_keep_copy/models/controllers/unique_contents_controller.dart';

void main() {
  test('add', () async {
    final target = UniqueContentsController();

    expect(target.debugState.contents, isEmpty);

    const content = Content(
      title: 'title',
      text: 'text',
    );

    final id = target.add(content);
    expect(id, isNotNull);

    expect(target.debugState.contents.length, 1);
    final addedContent = target.debugState.contents.first;
    expect(addedContent.content, content);
  });

  test('updateContent', () async {
    final target = UniqueContentsController();

    expect(target.debugState.contents, isEmpty);

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
  });

  test('delete', () async {
    final target = UniqueContentsController();

    expect(target.debugState.contents, isEmpty);

    const content = Content(
      title: 'title',
      text: 'text',
    );

    final id = target.add(content);
    expect(target.debugState.contents.length, 1);

    target.delete(id);

    expect(target.debugState.contents.length, 0);
  });
}
