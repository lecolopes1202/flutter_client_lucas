import 'dart:convert';
import 'dart:html';

import 'package:Employee_Management/Model/EmployeeModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class registerEmployee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return registerEmployeeState();
  }
}

Future<EmployeeModel> registerEmployees(
    String firstName, String lastName, BuildContext context) async {
  var Url = "https://proj-lucas-server.herokuapp.com/addemployee";
  var response = await http.post(Url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Access-Control-Allow-Headers':
            'Origin, Content-Type, Cookie, X-CSRF-TOKEN, Accept, Authorization, X-XSRF-TOKEN, Access-Control-Allow-Origin',
        'Access-Control-Expose-Headers': "" 'Authorization, authenticated',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET,POST,OPTIONS,DELETE,PUT',
        'Access-Control-Allow-Credentials': 'true',
      },
      body: jsonEncode(<String, String>{ //Sera que aqui precisa botar mais algo alem dos nomes, O mapa ?
        "firstName": firstName,
        "lastName": lastName,
      }));

  String responseString = response.body;
  if (response.statusCode == 200) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return MyAlertDialog(title: 'Backend Response', content: response.body);
      },
    );
  }
}

class registerEmployeeState extends State<registerEmployee> {
  final minimumPadding = 5.0;

  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController mapController = TextEditingController(); //adicionei pro mapa

  EmployeeModel employee;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle2;
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Hotel"),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(minimumPadding * 2),
          child: ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    style: textStyle,
                    controller: firstController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter the name';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter with the Hotel Name',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    style: textStyle,
                    controller: lastController,
                    validator: (String value) { // Alex: Talvez tenha uqe mexer aqui para receber numeros
                      if (value.isEmpty) {
                        return 'please enter the name';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Telefone',
                        hintText: 'Enter With Hotel Number',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              /*
              //adicionando o mapa
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    style: textStyle, ?
                    controller: mapController,
                    /*validator: (String ? value) { 
                      if (value.isEmpty) {
                        return 'please click the correct coordinate on the map';
                      }*/
                    },
                    decoration: InputDecoration(
                        /*labelText: 'Coordenada',
                        hintText: 'Enter with the correct coordinate on the map',
                        labelStyle: textStyle, ?
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),*/
                  )),
              // fechado adicionado o mapa
            */
              RaisedButton(
                  child: Text('Submit'),
                  onPressed: () async {
                    String firstName = firstController.text;
                    String lastName = lastController.text;
                    // String lastName = lastController.text; //deixar no formato do mapa
                    EmployeeModel employees =
                        await registerEmployees(firstName, lastName, context); // add a variável do mapa
                    firstController.text = '';
                    lastController.text = '';
                    // add a variável do mapa
                    setState(() {
                      employee = employees;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog({
    this.title,
    this.content,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
        style: Theme.of(context).textTheme.title,
      ),
      actions: this.actions,
      content: Text(
        this.content,
        style: Theme.of(context).textTheme.body1,
      ),
    );
  }
}
