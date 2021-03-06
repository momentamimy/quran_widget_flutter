// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorQuranDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$QuranDatabaseBuilder databaseBuilder(String name) =>
      _$QuranDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$QuranDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$QuranDatabaseBuilder(null);
}

class _$QuranDatabaseBuilder {
  _$QuranDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$QuranDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$QuranDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<QuranDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$QuranDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$QuranDatabase extends QuranDatabase {
  _$QuranDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NarrationDao? _narrationDaoInstance;

  BookDao? _bookDaoInstance;

  ChapterDao? _chapterDaoInstance;

  PartDao? _partDaoInstance;

  PageDao? _pageDaoInstance;

  RecitationDao? _recitationDaoInstance;

  ReciterDao? _reciterDaoInstance;

  RecitationVersesDao? _recitationVersesDaoInstance;

  VerseDao? _verseDaoInstance;

  GlyphDao? _glyphDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Narration` (`id` INTEGER, `name` TEXT, `description` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Book` (`id` INTEGER, `name` TEXT, `narration_id` INTEGER, FOREIGN KEY (`narration_id`) REFERENCES `Narration` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Chapter` (`id` INTEGER, `name` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Part` (`id` INTEGER, `name` TEXT, `alias` TEXT, `part_number` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Page` (`id` INTEGER, `page_number` INTEGER, `narration_id` INTEGER, `chapter_id` INTEGER, `book_id` INTEGER, `part_id` INTEGER, `sub_part_id` INTEGER, `image` TEXT, FOREIGN KEY (`narration_id`) REFERENCES `Narration` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`chapter_id`) REFERENCES `Chapter` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`book_id`) REFERENCES `Book` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`part_id`) REFERENCES `Part` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Recitation` (`id` INTEGER, `narration_id` INTEGER, `reciter_id` INTEGER, FOREIGN KEY (`narration_id`) REFERENCES `Narration` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`reciter_id`) REFERENCES `Reciter` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Reciter` (`id` INTEGER, `name` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RecitationVerses` (`id` INTEGER, `verse_id` INTEGER, `verse_number` INTEGER, `recitation_id` INTEGER, `record` TEXT, FOREIGN KEY (`verse_id`) REFERENCES `Verse` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`recitation_id`) REFERENCES `Recitation` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Verse` (`id` INTEGER, `text` TEXT, `uthmanic_text` TEXT, `line_start` INTEGER, `line_end` INTEGER, `image` TEXT, `narration_id` INTEGER, `chapter_id` INTEGER, `book_id` INTEGER, `part_id` INTEGER, `page_id` INTEGER, FOREIGN KEY (`narration_id`) REFERENCES `Narration` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`chapter_id`) REFERENCES `Chapter` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`book_id`) REFERENCES `Book` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`part_id`) REFERENCES `Part` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`page_id`) REFERENCES `Page` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Glyph` (`id` INTEGER, `verse_id` INTEGER, `page_id` INTEGER, `chapter_id` INTEGER, `line_number` INTEGER, `position` INTEGER, `minX` INTEGER, `maxX` INTEGER, `minY` INTEGER, `maxY` INTEGER, FOREIGN KEY (`chapter_id`) REFERENCES `Chapter` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`page_id`) REFERENCES `Page` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`verse_id`) REFERENCES `Verse` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  NarrationDao get narrationDao {
    return _narrationDaoInstance ??= _$NarrationDao(database, changeListener);
  }

  @override
  BookDao get bookDao {
    return _bookDaoInstance ??= _$BookDao(database, changeListener);
  }

  @override
  ChapterDao get chapterDao {
    return _chapterDaoInstance ??= _$ChapterDao(database, changeListener);
  }

  @override
  PartDao get partDao {
    return _partDaoInstance ??= _$PartDao(database, changeListener);
  }

  @override
  PageDao get pageDao {
    return _pageDaoInstance ??= _$PageDao(database, changeListener);
  }

  @override
  RecitationDao get recitationDao {
    return _recitationDaoInstance ??= _$RecitationDao(database, changeListener);
  }

  @override
  ReciterDao get reciterDao {
    return _reciterDaoInstance ??= _$ReciterDao(database, changeListener);
  }

  @override
  RecitationVersesDao get recitationVersesDao {
    return _recitationVersesDaoInstance ??=
        _$RecitationVersesDao(database, changeListener);
  }

  @override
  VerseDao get verseDao {
    return _verseDaoInstance ??= _$VerseDao(database, changeListener);
  }

  @override
  GlyphDao get glyphDao {
    return _glyphDaoInstance ??= _$GlyphDao(database, changeListener);
  }
}

class _$NarrationDao extends NarrationDao {
  _$NarrationDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _narrationInsertionAdapter = InsertionAdapter(
            database,
            'Narration',
            (Narration item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description
                },
            changeListener),
        _narrationUpdateAdapter = UpdateAdapter(
            database,
            'Narration',
            ['id'],
            (Narration item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description
                },
            changeListener),
        _narrationDeletionAdapter = DeletionAdapter(
            database,
            'Narration',
            ['id'],
            (Narration item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Narration> _narrationInsertionAdapter;

  final UpdateAdapter<Narration> _narrationUpdateAdapter;

  final DeletionAdapter<Narration> _narrationDeletionAdapter;

  @override
  Future<List<Narration>> findAllNarrations() async {
    return _queryAdapter.queryList('SELECT * FROM Narration',
        mapper: (Map<String, Object?> row) => Narration());
  }

  @override
  Stream<Narration?> findNarrationById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Narration WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Narration(),
        arguments: [id],
        queryableName: 'Narration',
        isView: false);
  }

  @override
  Future<void> insertNarration(Narration narration) async {
    await _narrationInsertionAdapter.insert(
        narration, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateNarration(Narration narration) async {
    await _narrationUpdateAdapter.update(narration, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteNarration(Narration narration) async {
    await _narrationDeletionAdapter.delete(narration);
  }
}

class _$BookDao extends BookDao {
  _$BookDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _bookInsertionAdapter = InsertionAdapter(
            database,
            'Book',
            (Book item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'narration_id': item.narrationId
                },
            changeListener),
        _bookUpdateAdapter = UpdateAdapter(
            database,
            'Book',
            ['id'],
            (Book item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'narration_id': item.narrationId
                },
            changeListener),
        _bookDeletionAdapter = DeletionAdapter(
            database,
            'Book',
            ['id'],
            (Book item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'narration_id': item.narrationId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Book> _bookInsertionAdapter;

  final UpdateAdapter<Book> _bookUpdateAdapter;

  final DeletionAdapter<Book> _bookDeletionAdapter;

  @override
  Future<List<Book>> findAllBooks() async {
    return _queryAdapter.queryList('SELECT * FROM Book',
        mapper: (Map<String, Object?> row) => Book());
  }

  @override
  Stream<Book?> findBookById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Book WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Book(),
        arguments: [id],
        queryableName: 'Book',
        isView: false);
  }

  @override
  Future<void> insertBook(Book book) async {
    await _bookInsertionAdapter.insert(book, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateBook(Book book) async {
    await _bookUpdateAdapter.update(book, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteBook(Book book) async {
    await _bookDeletionAdapter.delete(book);
  }
}

class _$ChapterDao extends ChapterDao {
  _$ChapterDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _chapterInsertionAdapter = InsertionAdapter(
            database,
            'Chapter',
            (Chapter item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener),
        _chapterUpdateAdapter = UpdateAdapter(
            database,
            'Chapter',
            ['id'],
            (Chapter item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener),
        _chapterDeletionAdapter = DeletionAdapter(
            database,
            'Chapter',
            ['id'],
            (Chapter item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Chapter> _chapterInsertionAdapter;

  final UpdateAdapter<Chapter> _chapterUpdateAdapter;

  final DeletionAdapter<Chapter> _chapterDeletionAdapter;

  @override
  Future<List<Chapter>> findAllChapters() async {
    return _queryAdapter.queryList('SELECT * FROM Chapter',
        mapper: (Map<String, Object?> row) => Chapter());
  }

  @override
  Stream<Chapter?> findChapterById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Chapter WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Chapter(),
        arguments: [id],
        queryableName: 'Chapter',
        isView: false);
  }

  @override
  Future<void> insertChapter(Chapter chapter) async {
    await _chapterInsertionAdapter.insert(chapter, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateChapter(Chapter chapter) async {
    await _chapterUpdateAdapter.update(chapter, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteChapter(Chapter chapter) async {
    await _chapterDeletionAdapter.delete(chapter);
  }
}

class _$PartDao extends PartDao {
  _$PartDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _partInsertionAdapter = InsertionAdapter(
            database,
            'Part',
            (Part item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'alias': item.alias,
                  'part_number': item.partNumber
                },
            changeListener),
        _partUpdateAdapter = UpdateAdapter(
            database,
            'Part',
            ['id'],
            (Part item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'alias': item.alias,
                  'part_number': item.partNumber
                },
            changeListener),
        _partDeletionAdapter = DeletionAdapter(
            database,
            'Part',
            ['id'],
            (Part item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'alias': item.alias,
                  'part_number': item.partNumber
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Part> _partInsertionAdapter;

  final UpdateAdapter<Part> _partUpdateAdapter;

  final DeletionAdapter<Part> _partDeletionAdapter;

  @override
  Future<List<Part>> findAllParts() async {
    return _queryAdapter.queryList('SELECT * FROM Part',
        mapper: (Map<String, Object?> row) => Part());
  }

  @override
  Stream<Part?> findPartById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Part WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Part(),
        arguments: [id],
        queryableName: 'Part',
        isView: false);
  }

  @override
  Future<void> insertPart(Part part) async {
    await _partInsertionAdapter.insert(part, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePart(Part part) async {
    await _partUpdateAdapter.update(part, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletePart(Part part) async {
    await _partDeletionAdapter.delete(part);
  }
}

class _$PageDao extends PageDao {
  _$PageDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _pageInsertionAdapter = InsertionAdapter(
            database,
            'Page',
            (Page item) => <String, Object?>{
                  'id': item.id,
                  'page_number': item.pageNumber,
                  'narration_id': item.narrationId,
                  'chapter_id': item.chapterId,
                  'book_id': item.bookId,
                  'part_id': item.partId,
                  'sub_part_id': item.subPartId,
                  'image': item.image
                },
            changeListener),
        _pageUpdateAdapter = UpdateAdapter(
            database,
            'Page',
            ['id'],
            (Page item) => <String, Object?>{
                  'id': item.id,
                  'page_number': item.pageNumber,
                  'narration_id': item.narrationId,
                  'chapter_id': item.chapterId,
                  'book_id': item.bookId,
                  'part_id': item.partId,
                  'sub_part_id': item.subPartId,
                  'image': item.image
                },
            changeListener),
        _pageDeletionAdapter = DeletionAdapter(
            database,
            'Page',
            ['id'],
            (Page item) => <String, Object?>{
                  'id': item.id,
                  'page_number': item.pageNumber,
                  'narration_id': item.narrationId,
                  'chapter_id': item.chapterId,
                  'book_id': item.bookId,
                  'part_id': item.partId,
                  'sub_part_id': item.subPartId,
                  'image': item.image
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Page> _pageInsertionAdapter;

  final UpdateAdapter<Page> _pageUpdateAdapter;

  final DeletionAdapter<Page> _pageDeletionAdapter;

  @override
  Future<List<Page>> findAllPages() async {
    return _queryAdapter.queryList('SELECT * FROM Page',
        mapper: (Map<String, Object?> row) => Page());
  }

  @override
  Stream<Page?> findPageById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Page WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Page(),
        arguments: [id],
        queryableName: 'Page',
        isView: false);
  }

  @override
  Future<void> insertPage(Page page) async {
    await _pageInsertionAdapter.insert(page, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePage(Page page) async {
    await _pageUpdateAdapter.update(page, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletePage(Page page) async {
    await _pageDeletionAdapter.delete(page);
  }
}

class _$RecitationDao extends RecitationDao {
  _$RecitationDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _recitationInsertionAdapter = InsertionAdapter(
            database,
            'Recitation',
            (Recitation item) => <String, Object?>{
                  'id': item.id,
                  'narration_id': item.narrationId,
                  'reciter_id': item.reciterId
                },
            changeListener),
        _recitationUpdateAdapter = UpdateAdapter(
            database,
            'Recitation',
            ['id'],
            (Recitation item) => <String, Object?>{
                  'id': item.id,
                  'narration_id': item.narrationId,
                  'reciter_id': item.reciterId
                },
            changeListener),
        _recitationDeletionAdapter = DeletionAdapter(
            database,
            'Recitation',
            ['id'],
            (Recitation item) => <String, Object?>{
                  'id': item.id,
                  'narration_id': item.narrationId,
                  'reciter_id': item.reciterId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Recitation> _recitationInsertionAdapter;

  final UpdateAdapter<Recitation> _recitationUpdateAdapter;

  final DeletionAdapter<Recitation> _recitationDeletionAdapter;

  @override
  Future<List<Recitation>> findAllRecitations() async {
    return _queryAdapter.queryList('SELECT * FROM Recitation',
        mapper: (Map<String, Object?> row) => Recitation());
  }

  @override
  Stream<Recitation?> findRecitationById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Recitation WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Recitation(),
        arguments: [id],
        queryableName: 'Recitation',
        isView: false);
  }

  @override
  Future<void> insertRecitation(Recitation recitation) async {
    await _recitationInsertionAdapter.insert(
        recitation, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateRecitation(Recitation recitation) async {
    await _recitationUpdateAdapter.update(recitation, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteRecitation(Recitation recitation) async {
    await _recitationDeletionAdapter.delete(recitation);
  }
}

class _$ReciterDao extends ReciterDao {
  _$ReciterDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _reciterInsertionAdapter = InsertionAdapter(
            database,
            'Reciter',
            (Reciter item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener),
        _reciterUpdateAdapter = UpdateAdapter(
            database,
            'Reciter',
            ['id'],
            (Reciter item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener),
        _reciterDeletionAdapter = DeletionAdapter(
            database,
            'Reciter',
            ['id'],
            (Reciter item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Reciter> _reciterInsertionAdapter;

  final UpdateAdapter<Reciter> _reciterUpdateAdapter;

  final DeletionAdapter<Reciter> _reciterDeletionAdapter;

  @override
  Future<List<Reciter>> findAllReciters() async {
    return _queryAdapter.queryList('SELECT * FROM Reciter',
        mapper: (Map<String, Object?> row) =>
            Reciter(row['id'] as int?, row['name'] as String?));
  }

  @override
  Stream<Reciter?> findReciterById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Reciter WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            Reciter(row['id'] as int?, row['name'] as String?),
        arguments: [id],
        queryableName: 'Reciter',
        isView: false);
  }

  @override
  Future<void> insertReciter(Reciter reciter) async {
    await _reciterInsertionAdapter.insert(reciter, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateReciter(Reciter reciter) async {
    await _reciterUpdateAdapter.update(reciter, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteReciter(Reciter reciter) async {
    await _reciterDeletionAdapter.delete(reciter);
  }
}

class _$RecitationVersesDao extends RecitationVersesDao {
  _$RecitationVersesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _recitationVersesInsertionAdapter = InsertionAdapter(
            database,
            'RecitationVerses',
            (RecitationVerses item) => <String, Object?>{
                  'id': item.id,
                  'verse_id': item.verseId,
                  'verse_number': item.verseNumber,
                  'recitation_id': item.recitationId,
                  'record': item.record
                },
            changeListener),
        _recitationVersesUpdateAdapter = UpdateAdapter(
            database,
            'RecitationVerses',
            ['id'],
            (RecitationVerses item) => <String, Object?>{
                  'id': item.id,
                  'verse_id': item.verseId,
                  'verse_number': item.verseNumber,
                  'recitation_id': item.recitationId,
                  'record': item.record
                },
            changeListener),
        _recitationVersesDeletionAdapter = DeletionAdapter(
            database,
            'RecitationVerses',
            ['id'],
            (RecitationVerses item) => <String, Object?>{
                  'id': item.id,
                  'verse_id': item.verseId,
                  'verse_number': item.verseNumber,
                  'recitation_id': item.recitationId,
                  'record': item.record
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RecitationVerses> _recitationVersesInsertionAdapter;

  final UpdateAdapter<RecitationVerses> _recitationVersesUpdateAdapter;

  final DeletionAdapter<RecitationVerses> _recitationVersesDeletionAdapter;

  @override
  Future<List<RecitationVerses>> findAllRecitationsVerses() async {
    return _queryAdapter.queryList('SELECT * FROM RecitationVerses',
        mapper: (Map<String, Object?> row) => RecitationVerses());
  }

  @override
  Stream<RecitationVerses?> findRecitationVersesById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM RecitationVerses WHERE id = ?1',
        mapper: (Map<String, Object?> row) => RecitationVerses(),
        arguments: [id],
        queryableName: 'RecitationVerses',
        isView: false);
  }

  @override
  Future<void> insertRecitationVerses(RecitationVerses recitationVerses) async {
    await _recitationVersesInsertionAdapter.insert(
        recitationVerses, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateRecitationVerses(RecitationVerses recitationVerses) async {
    await _recitationVersesUpdateAdapter.update(
        recitationVerses, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteRecitationVerses(RecitationVerses recitationVerses) async {
    await _recitationVersesDeletionAdapter.delete(recitationVerses);
  }
}

class _$VerseDao extends VerseDao {
  _$VerseDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _verseInsertionAdapter = InsertionAdapter(
            database,
            'Verse',
            (Verse item) => <String, Object?>{
                  'id': item.id,
                  'text': item.text,
                  'uthmanic_text': item.uthmanicText,
                  'line_start': item.lineStart,
                  'line_end': item.lineEnd,
                  'image': item.image,
                  'narration_id': item.narrationId,
                  'chapter_id': item.chapterId,
                  'book_id': item.bookId,
                  'part_id': item.partId,
                  'page_id': item.pageId
                },
            changeListener),
        _verseUpdateAdapter = UpdateAdapter(
            database,
            'Verse',
            ['id'],
            (Verse item) => <String, Object?>{
                  'id': item.id,
                  'text': item.text,
                  'uthmanic_text': item.uthmanicText,
                  'line_start': item.lineStart,
                  'line_end': item.lineEnd,
                  'image': item.image,
                  'narration_id': item.narrationId,
                  'chapter_id': item.chapterId,
                  'book_id': item.bookId,
                  'part_id': item.partId,
                  'page_id': item.pageId
                },
            changeListener),
        _verseDeletionAdapter = DeletionAdapter(
            database,
            'Verse',
            ['id'],
            (Verse item) => <String, Object?>{
                  'id': item.id,
                  'text': item.text,
                  'uthmanic_text': item.uthmanicText,
                  'line_start': item.lineStart,
                  'line_end': item.lineEnd,
                  'image': item.image,
                  'narration_id': item.narrationId,
                  'chapter_id': item.chapterId,
                  'book_id': item.bookId,
                  'part_id': item.partId,
                  'page_id': item.pageId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Verse> _verseInsertionAdapter;

  final UpdateAdapter<Verse> _verseUpdateAdapter;

  final DeletionAdapter<Verse> _verseDeletionAdapter;

  @override
  Future<List<Verse>> findAllVerses() async {
    return _queryAdapter.queryList('SELECT * FROM Verse',
        mapper: (Map<String, Object?> row) => Verse());
  }

  @override
  Stream<Verse?> findVerseById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Verse WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Verse(),
        arguments: [id],
        queryableName: 'Verse',
        isView: false);
  }

  @override
  Future<void> insertVerse(Verse verse) async {
    await _verseInsertionAdapter.insert(verse, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateVerse(Verse verse) async {
    await _verseUpdateAdapter.update(verse, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteVerse(Verse verse) async {
    await _verseDeletionAdapter.delete(verse);
  }
}

class _$GlyphDao extends GlyphDao {
  _$GlyphDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _glyphInsertionAdapter = InsertionAdapter(
            database,
            'Glyph',
            (Glyph item) => <String, Object?>{
                  'id': item.id,
                  'verse_id': item.verseId,
                  'page_id': item.pageId,
                  'chapter_id': item.chapterId,
                  'line_number': item.lineNumber,
                  'position': item.position,
                  'minX': item.minX,
                  'maxX': item.maxX,
                  'minY': item.minY,
                  'maxY': item.maxY
                },
            changeListener),
        _glyphUpdateAdapter = UpdateAdapter(
            database,
            'Glyph',
            ['id'],
            (Glyph item) => <String, Object?>{
                  'id': item.id,
                  'verse_id': item.verseId,
                  'page_id': item.pageId,
                  'chapter_id': item.chapterId,
                  'line_number': item.lineNumber,
                  'position': item.position,
                  'minX': item.minX,
                  'maxX': item.maxX,
                  'minY': item.minY,
                  'maxY': item.maxY
                },
            changeListener),
        _glyphDeletionAdapter = DeletionAdapter(
            database,
            'Glyph',
            ['id'],
            (Glyph item) => <String, Object?>{
                  'id': item.id,
                  'verse_id': item.verseId,
                  'page_id': item.pageId,
                  'chapter_id': item.chapterId,
                  'line_number': item.lineNumber,
                  'position': item.position,
                  'minX': item.minX,
                  'maxX': item.maxX,
                  'minY': item.minY,
                  'maxY': item.maxY
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Glyph> _glyphInsertionAdapter;

  final UpdateAdapter<Glyph> _glyphUpdateAdapter;

  final DeletionAdapter<Glyph> _glyphDeletionAdapter;

  @override
  Future<List<Glyph>> findAllGlyphs() async {
    return _queryAdapter.queryList('SELECT * FROM Glyph',
        mapper: (Map<String, Object?> row) => Glyph());
  }

  @override
  Stream<Glyph?> findGlyphById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Glyph WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Glyph(),
        arguments: [id],
        queryableName: 'Glyph',
        isView: false);
  }

  @override
  Future<void> insertGlyph(Glyph glyph) async {
    await _glyphInsertionAdapter.insert(glyph, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateGlyph(Glyph glyph) async {
    await _glyphUpdateAdapter.update(glyph, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteGlyph(Glyph glyph) async {
    await _glyphDeletionAdapter.delete(glyph);
  }
}
