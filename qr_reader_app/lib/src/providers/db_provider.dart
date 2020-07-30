import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_reader_app/src/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

export 'package:path_provider/path_provider.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'scansdb.db');
    return await openDatabase(
      path,
      version: 1,
      onOpen: (Database db) {},
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE Scans('
            'id INTEGER PRIMARY KEY,'
            'tipo TEXT,'
            'valor TEXT'
            ')');
      },
    );
  }

  // Crear registros base de datos
  nuevoScanRaw(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.rawInsert("INSERT INTO Scans(id, tipo, valor) "
        "VALUES (${nuevoScan.id}, '${nuevoScan.tipo}', '${nuevoScan.valor}')");
    return res;
  }

  nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
    return res;
  }

  // SELECT - Obtener información
  Future<ScanModel> getScanId(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getScans() async {
    final db = await database;
    final res = await db.query('Scans');
    List<ScanModel> list = res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
    return list;
  }

  Future<List<ScanModel>> getScansTipo(String tipo) async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Scans WHERE tipo='$tipo'");
    List<ScanModel> list = res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
    return list;
  }

  // Actualizar registros
  updateScan(ScanModel model) async {
    final db = await database;
    final res = await db.update('Scans', model.toJson(),
        where: 'id = ?', whereArgs: [model.id]);
    return res;
  }

  // Borrar registros
  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAll() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Scans');
    return res;
  }
}
