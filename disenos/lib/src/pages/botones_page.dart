import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  final titleStyle =
      TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800);
  final subStyle =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            _fondoApp(),
            SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [_titulos(), _botonesRedondeados()]))
          ],
        ),
        bottomNavigationBar: _bottomNavigationBar(context));
  }

  Widget _botonesRedondeados() {
    return Table(
      children: [
        TableRow(children: [
          _crearBotonRedondeado(Colors.blue, Icons.border_all, 'General'),
          _crearBotonRedondeado(Colors.red, Icons.whatshot, 'Tinder')
        ]),
        TableRow(children: [
          _crearBotonRedondeado(
              Colors.indigoAccent, Icons.account_balance_wallet, 'Money'),
          _crearBotonRedondeado(Colors.blue, Icons.add_call, 'Call')
        ]),
        TableRow(children: [
          _crearBotonRedondeado(Colors.amber, Icons.photo, 'Pictures'),
          _crearBotonRedondeado(Colors.green, Icons.android, 'Android')
        ]),
      ],
    );
  }

  Widget _crearBotonRedondeado(Color color, IconData icono, String texto) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.8),
              borderRadius: BorderRadius.circular(30.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 15.0,
              ),
              CircleAvatar(
                  radius: 35.0,
                  backgroundColor: color,
                  child: Icon(icono, color: Colors.white, size: 32.0)),
              SizedBox(height: 10.0),
              Text(texto, style: TextStyle(color: color)),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
          primaryColor: Colors.pinkAccent,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                size: 30.0,
              ),
              title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.bubble_chart, size: 30.0), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle, size: 30.0),
              title: Container())
        ],
      ),
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Alfonso',
              style: titleStyle,
            ),
            Text('Choose an option', style: subStyle)
          ],
        ),
      ),
    );
  }

  Widget _fondoApp() {
    final gradiente = new Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(1.0, 1.0),
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ])),
    );

    final cajaRosa = Transform.rotate(
        angle: -pi / 4.0,
        child: Container(
          height: 360.0,
          width: 360.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(236, 98, 188, 1),
                Color.fromRGBO(241, 142, 172, 1)
              ]),
              borderRadius: BorderRadius.circular(80.0)),
        ));
    return Stack(
      children: [
        gradiente,
        Positioned(
          child: cajaRosa,
          top: -90.0,
        )
      ],
    );
  }
}
