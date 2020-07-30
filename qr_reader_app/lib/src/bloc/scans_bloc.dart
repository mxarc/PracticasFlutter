import 'dart:async';

import 'package:qr_reader_app/src/bloc/validator.dart';
import 'package:qr_reader_app/src/models/scan_model.dart';
import 'package:qr_reader_app/src/providers/db_provider.dart';

class ScansBloc with Validators {
  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal() {
    // Obtener los Scans de la base de datos
    obtenerScans();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();
  Stream<List<ScanModel>> get scansStream =>
      _scansController.stream.transform(validarGeo);
  Stream<List<ScanModel>> get scansStreamHttp =>
      _scansController.stream.transform(validarHttp);

  dispose() {
    _scansController?.close();
  }

  obtenerScans() async {
    _scansController.sink.add(await DBProvider.db.getScans());
  }

  agregarScan(ScanModel scanModel) async {
    DBProvider.db.nuevoScan(scanModel);
    obtenerScans();
  }

  borrarScan(int id) async {
    await DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  borrarScanTodos() async {
    await DBProvider.db.deleteAll();
    _scansController.sink.add([]);
    // o también
    // obtenerScans();
  }
}
