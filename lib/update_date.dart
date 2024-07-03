import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as myHttp;

class UpdateEmployeePage extends StatefulWidget {
  final int employeeId; // ID pegawai yang akan diperbarui
  const UpdateEmployeePage({Key? key, required this.employeeId}) : super(key: key);

  @override
  State<UpdateEmployeePage> createState() => _UpdateEmployeePageState();
}

class _UpdateEmployeePageState extends State<UpdateEmployeePage> {
  final _formKey = GlobalKey<FormState>();
  late Future<String> _token;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _positionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _token = _getToken();
    _fetchEmployeeData();
  }

  Future<String> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") ?? "";
  }

  Future<void> _fetchEmployeeData() async {
    String token = await _token;
    var response = await myHttp.get(
      Uri.parse("https://example.com/api/employee/${widget.employeeId}"),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        _nameController.text = data['name'];
        _addressController.text = data['address'];
        _positionController.text = data['position'];
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to fetch data')));
    }
  }

  Future<void> _updateEmployeeData() async {
    if (_formKey.currentState!.validate()) {
      String token = await _token;
      Map<String, String> body = {
        "name": _nameController.text,
        "address": _addressController.text,
        "position": _positionController.text,
      };

      var response = await myHttp.put(
        Uri.parse("https://example.com/api//${widget.employeeId}"),
        body: body,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Data updated successfully')));
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Failed to update data')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Employee"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _positionController,
                decoration: InputDecoration(labelText: 'Position'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a position';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateEmployeeData,
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
