import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

abstract class LocalDatabaseSource {
  late Database db;
  late StoreRef<int, Map<String, Object?>> favoritesCollection;
  late StoreRef<int, Map<String, Object?>> historyCollection;

  Future<void> setup();
}

class LocalDatabaseSourceImpl extends LocalDatabaseSource {
  @override
  Future<void> setup() async {
    final dir = await getApplicationDocumentsDirectory();

    final dbPath = '${dir.path}/weather.db';
    final dbFactory = databaseFactoryIo;

    db = await dbFactory.openDatabase(dbPath);

    favoritesCollection = intMapStoreFactory.store('favorites');
    favoritesCollection = intMapStoreFactory.store('history');
  }
}
