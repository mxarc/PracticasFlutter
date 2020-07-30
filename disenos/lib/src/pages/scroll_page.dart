import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  final estiloTexto =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [_pagina1(), _pagina2()],
      ),
    );
  }

  Widget _pagina1() {
    return Stack(
      children: [_colorFondo(), _imagenFondo(), _textos()],
    );
  }

  Widget _textos() {
    return SafeArea(
      child: Column(children: [
        SizedBox(height: 50.0),
        Text('11°', style: this.estiloTexto),
        Text('Viernes', style: estiloTexto),
        Expanded(child: Container()),
        Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.white)
      ]),
    );
  }

  Widget _colorFondo() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromRGBO(108, 192, 218, 1.0));
  }

  Widget _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        fit: BoxFit.cover,
        image: AssetImage('assets/scroll-1.png'),
      ),
    );
  }

  Widget _pagina2() {
    return Stack(
      children: [
        _colorFondo(),
        Center(
            child: RaisedButton(
                elevation: 15.0,
                shape: StadiumBorder(),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () => print('aa'),
                child: Padding(
                  child: Text('Bienvenidos'),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                )))
      ],
    );
  }
}
