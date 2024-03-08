import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

abstract class FavoritesService {
  Future<void> setup();
}

class FavoritesServiceImpl extends FavoritesService {
  late Database _db;

  @override
  Future<void> setup() async {
    final dir = await getApplicationDocumentsDirectory();

    final dbPath = '${dir.path}/weather.db';
    final dbFactory = databaseFactoryIo;

    _db = await dbFactory.openDatabase(dbPath);
  }
}
