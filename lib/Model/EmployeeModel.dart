import 'dart:convert';

EmployeeModel employeeModelJson(String str) =>
    EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
  int id;
  String firstName;
  String lastName;
  //String mapLocXY; /mapa

  EmployeeModel({this.id, this.firstName, this.lastName}); // this.mapLocXY

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
      firstName: json["firstName"], lastName: json["lastName"], id: json["id"]); //mapcoordenada :json["mapLocXY"]

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        'id': id,
        //'mapLocXY': mapLocXY,
      };

  String get firstname => firstName;

  String get lastname => lastName;

  //String ? get maplocxy => mapLocXY;
}
