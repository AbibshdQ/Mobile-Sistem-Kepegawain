import 'dart:io';

import 'package:android_simpeg/host.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PegawaiPages extends StatefulWidget {
  const PegawaiPages({super.key});

  @override
  State<PegawaiPages> createState() => _PegawaiPagesState();
}

class Employee {
  final int id;
  final String name;
  final String position;
  // final String photo;

  Employee({required this.id, required this.name, required this.position});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['namapeg'],
      position: json['stat_peg'],
      // photo: json['alamat'],
    );
  }
}

class _PegawaiPagesState extends State<PegawaiPages> {
  late Future<List<Employee>> futureEmployees;

  Future<List<Employee>> fetchEmployees() async {
    var dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final response = await dio.get('${ngrok}/api/pegawai');

    if (response.statusCode == 200) {
      List jsonResponse = response.data;
      return jsonResponse.map((employee) => Employee.fromJson(employee)).toList();
    } else {
      throw Exception('Failed to load pegawai');
    }
  }

  @override
  void initState() {
    super.initState();
    futureEmployees = fetchEmployees();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: FutureBuilder<List<Employee>>(
        future: futureEmployees,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(child: Text('Failed to load employees'));
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return Center(child: Text('No employees found'));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final employee = snapshot.data![index];
                return Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: "https://png.pngitem.com/pimgs/s/111-1114669_blank-person-hd-png-download.png",
                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(employee.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text(employee.position, style: TextStyle(fontSize: 14, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}