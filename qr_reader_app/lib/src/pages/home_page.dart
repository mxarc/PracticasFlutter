import 'dart:io';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:qr_reader_app/src/bloc/scans_bloc.dart';
import 'package:qr_reader_app/src/models/scan_model.dart';
import 'package:qr_reader_app/src/pages/direcciones_page.dart';
import 'package:qr_reader_app/src/pages/mapas_page.dart';
import 'package:qr_reader_app/src/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(currentIndex),
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
              onPressed: scansBloc.borrarScanTodos,
              icon: Icon(Icons.delete_forever))
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        // heroTag: null, // disable hero movement
        child: Icon(Icons.filter_center_focus),
        onPressed: () => _scanQR(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  void _scanQR(BuildContext context) async {
    String futureString = '';
    print('Scanning QR...');
    // geo:40.73255860802501,-73.89333143671877
    try {
      var result = await BarcodeScanner.scan();
      futureString = result.rawContent;
    } catch (e) {
      futureString = e.toString();
    }
    if (futureString != null) {
      final ScanModel scanModel = new ScanModel(valor: futureString);
      scansBloc.agregarScan(scanModel);
      if (Platform.isIOS) {
        Future.delayed(Duration(milliseconds: 750), () {
          utils.abrirScan(context, scanModel);
        });
      } else {
        utils.abrirScan(context, scanModel);
      }
    }
  }

  Widget _callPage(int pagActual) {
    switch (pagActual) {
      case 0:
        return MapasPage();
        break;
      case 1:
        return DireccionesPage();
        break;
      default:
        return MapasPage();
    }
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(title: Text('Mapas'), icon: Icon(Icons.map)),
        BottomNavigationBarItem(
            title: Text('Direcciones'), icon: Icon(Icons.directions))
      ],
    );
  }
}
