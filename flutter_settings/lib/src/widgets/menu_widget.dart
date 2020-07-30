import 'package:flutter/material.dart';
import 'package:flutter_settings/src/pages/home_page.dart';
import 'package:flutter_settings/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/menu-img.jpg'))
                // image: Image(image: AssetImage('assets/menu-img.jpg')),
                ),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.party_mode, color: Colors.blue),
            title: Text('Party Mode'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blue),
            title: Text('People'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.settings, color: Colors.blue),
              title: Text('Settings'),
              onTap: () {
                // Navigator.pop(context);
                Navigator.pushReplacementNamed(context, SettingPage.routeName);
              })
        ],
      ),
    );
  }
}
