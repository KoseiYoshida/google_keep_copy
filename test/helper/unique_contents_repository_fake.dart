import 'package:goggle_keep_copy/models/unique_content.dart';
import 'package:goggle_keep_copy/repository/unique_contents_repository.dart';

class UniqueContentsRepositoryFake implements UniqueContentsRepository {
  bool _hasLoaded = false;
  bool get hasLoaded => _hasLoaded;
  List<UniqueContent> lodeContents = [];

  @override
  Future<List<UniqueContent>> loadUniqueContents() async {
    _hasLoaded = true;
    return lodeContents;
  }

  bool _hasSaved = false;
  bool get hasSaved => _hasSaved;
  List<UniqueContent> savedContents = [];

  @override
  Future<void> saveUniqueContents(List<UniqueContent> uniqueContents) async {
    _hasSaved = true;
    savedContents = uniqueContents;
  }
}
