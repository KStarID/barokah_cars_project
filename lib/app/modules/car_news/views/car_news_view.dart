import 'package:barokah_cars_project/app/modules/car_news/controllers/car_news_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarNewsView extends GetView<CarNewsController> {
  CarNewsView({super.key});
  
  final databaseRef = FirebaseDatabase.instance.ref().child('cars');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FirebaseAnimatedList(
          query: databaseRef, 
          itemBuilder: ((context, snapshot, animation, index) {
            return ListTile(
              subtitle: Text(snapshot.value.toString()),
              title: Text(snapshot.value.toString()),
            );
          }))
      ),
    );
  }
}
