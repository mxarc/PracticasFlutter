import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.normal, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        _crearImagen(),
        _crearTitulo(),
        _crearAcciones(),
        _crearTexto(),
        _crearTexto(),
        _crearTexto(),
        _crearTexto(),
        _crearTexto(),
      ]),
    ));
  }

  Widget _crearTexto() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Text(
        'Commodo ut nulla elit aute consectetur mollit et id fugiat est. Reprehenderit consectetur irure mollit et sint tempor ad qui. Labore dolor sunt excepteur eiusmod aliquip excepteur irure culpa labore commodo velit minim tempor. Occaecat reprehenderit esse dolor tempor sunt nulla anim mollit esse. Consequat nostrud proident cillum commodo voluptate.',
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _accion(Icons.phone, 'Call'),
        _accion(Icons.near_me, 'Route'),
        _accion(Icons.share, 'Share')
      ],
    );
  }

  Widget _accion(IconData icon, String texto) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 40.0),
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.blue),
        )
      ],
    );
  }

  Widget _crearImagen() {
    return Container(
      width: double.infinity,
      child: Image(
        height: 220,
        fit: BoxFit.cover,
        image: NetworkImage(
            'https://images.unsplash.com/photo-1500964757637-c85e8a162699?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb'),
      ),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Montaña bonita aaaaaaaa',
                    style: estiloTitulo,
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    'Una montaña bonita jaja saludos',
                    style: estiloSubTitulo,
                  )
                ],
              ),
            ),
            Icon(Icons.star, color: Colors.amber, size: 30.0),
            Text('41', style: TextStyle(fontSize: 20.0))
          ],
        ),
      ),
    );
  }
}
