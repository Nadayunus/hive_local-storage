
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_store/model/class.dart';

ValueNotifier<List<Data>> valueNotifier =ValueNotifier([]);
 
Future getData() async{
  final box= Hive.box<Data>('DataSaving');
  valueNotifier.value.clear();
  valueNotifier.value.addAll(box.values);
  valueNotifier.notifyListeners();
}
Future addData(Data values) async{
  final box= Hive.box<Data>('DataSaving');
  box.add(values);
  getData();  
}
Future deleteData(int index) async{
  final box= Hive.box<Data>('DataSaving');
  box.deleteAt(index);
}