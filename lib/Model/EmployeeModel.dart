import 'dart:convert';

EmployeeModel employeeModelJson(String str) =>
    EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
  int id;
  String firstName;
  String lastName;
  String mapLocX; // mapa
  String mapLocY; // mapa
  

  EmployeeModel({this.id, this.firstName, this.lastName, this.mapLocX,this.mapLocY}); // this.mapLocXY

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
      firstName: json["firstName"], lastName: json["lastName"], id: json["id"],
      mapLocX: json["mapLocX"],mapLocY: json["mapLocY"] ); //mapLocXY :json["mapLocXY"]

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        'id': id,
        'mapLocX': mapLocX, //'mapLocXY': mapLocXY,
        'mapLocY': mapLocY, //'mapLocXY': mapLocXY,
      };

  String get firstname => firstName;

  String get lastname => lastName;

  String get maplocx => mapLocX; //String ? get maplocxy => mapLocXY;

  String get maplocy => mapLocY;
}
