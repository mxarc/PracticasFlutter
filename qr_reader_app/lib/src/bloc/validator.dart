import 'dart:async';

import 'package:qr_reader_app/src/models/scan_model.dart';

class Validators {
  final validarGeo =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    handleData: (data, sink) {
      final geoScans = data.where((element) => element.tipo == 'geo').toList();
      sink.add(geoScans);
    },
  );

  final validarHttp =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    handleData: (data, sink) {
      final geoScans = data.where((element) => element.tipo == 'http').toList();
      sink.add(geoScans);
    },
  );
}
