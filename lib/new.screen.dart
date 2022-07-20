import 'package:flutter/material.dart';
import 'package:practice/models/model.dart';

class name extends StatelessWidget {
  Data object;
  name(this.object);

  @override
  Widget build(BuildContext context) {
    var length = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: length.height * 0.5,
          width: length.height * 0.5,
          color: Colors.lightGreen,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(object.avatar ?? ""),
              ),
              Text(object.id.toString()),
              Text(
                object.firstName ?? "",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                object.firstName ?? "",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                object.email ?? "",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
