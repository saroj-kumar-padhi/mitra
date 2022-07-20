import 'package:flutter/material.dart';
import 'package:practice/models/model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practice/new.screen.dart';

void main() {
  runApp(const MyApp());
}

Future<List<Data>> getUsers() async {
  final data = json.decode(
      ((await http.get(Uri.parse("https://reqres.in/api/users"))).body));
  return (data["data"] as List).map((e) => Data.fromJson(e)).toList();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Data>>(
          future: getUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => name(snapshot.data![index])));
                      },
                      child: Column(
                        children: [
                          Text(snapshot.data?[index].firstName ?? ""),
                          Text(snapshot.data?[index].lastName ?? "")
                        ],
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data!.length,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
