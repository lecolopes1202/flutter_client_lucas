import 'package:Employee_Management/Screens/getEmployees.dart';
import 'package:Employee_Management/Screens/registerEmployee.dart';
import 'package:flutter/material.dart';

class employeeDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return employeeDrawerState();
  }
}

class employeeDrawerState extends State<employeeDrawer> {
  final minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel Management'),
      ),
      body: Center(child: Text('Welcome To PXP Channel')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
          children: <Widget>[
            DrawerHeader(
              child: Text('Hotel Management'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            
            ListTile(
              title: Text('Register Hotel'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => registerEmployee()));
              },
            ),
            
            ListTile(
              title: Text('Lista de Hoteis'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => getemployees()));
              },
            )
          ],
        ),
      ),
    );
  }
}
