import 'package:flutter/material.dart';
import 'package:flutter_settings/src/shared/preferencias_usuario.dart';
import 'package:flutter_settings/src/widgets/menu_widget.dart';

class SettingPage extends StatefulWidget {
  static final String routeName = 'settings';
  const SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre;
  TextEditingController _textEditingController;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    prefs.ultimaPagina = SettingPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombreUsuario;
    _textEditingController = new TextEditingController(text: _nombre);
  }

  _setSelectedRadio(int value) {
    setState(() {
      _genero = value;
      prefs.genero = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      body: Center(
          child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: (value) {
              setState(() {
                _colorSecundario = value;
                prefs.colorSecundario = value;
              });
            },
          ),
          RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio),
          RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona usando el tel'),
              onChanged: (value) {
                setState(() {
                  this._nombre = value;
                  this.prefs.nombreUsuario = value;
                });
              },
            ),
          ),
        ],
      )),
      drawer: MenuWidget(),
    );
  }
}
