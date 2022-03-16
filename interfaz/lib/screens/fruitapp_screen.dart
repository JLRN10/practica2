import 'package:flutter/material.dart';

class FruitApp extends StatelessWidget {
  const FruitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('imagenes/logo_onepice.png'),
                  ),
                  accountName: Text('Rosales Nuñez Jose Luis'),
                  accountEmail: Text('17030906@itcelaya.edu.mx')),
              ListTile(
                title: Text('FruitApp'),
                subtitle: Text('Widget Challenge'),
                leading: Icon(
                  Icons.restaurant_menu,
                  color: Colors.black,
                ),
                trailing: Icon(
                  Icons.block_sharp,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '../dasboard.dart');
                },
              )
            ],
          ),
        ));
    ;
  }
}
