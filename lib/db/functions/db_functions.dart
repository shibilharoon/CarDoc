import 'package:cardoc/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<CustomerModel>> CustomerListNotifier = ValueNotifier([]);

addCustomers(CustomerModel value) async {
  final customerDB = await Hive.openBox<CustomerModel>('customer_DB');
  await customerDB.add(value);
  CustomerListNotifier.value.add(value);
  CustomerListNotifier.notifyListeners();
}

Future<void> getAllCustomers() async {
  final customerDB = await Hive.openBox<CustomerModel>('customer_DB');
  CustomerListNotifier.value.clear();
  CustomerListNotifier.value.addAll(customerDB.values);
  CustomerListNotifier.notifyListeners();
}

Future<void> deleteCustomer(int index) async {
  final customerDB = await Hive.openBox<CustomerModel>('customer_DB');
  await customerDB.deleteAt(index);
  CustomerListNotifier.notifyListeners();
  getAllCustomers();
}

Future<void> editCustomer(index, CustomerModel value) async {
  final customerDB = await Hive.openBox<CustomerModel>('customer_DB');
  CustomerListNotifier.value.clear();
  CustomerListNotifier.value.addAll(customerDB.values);
  CustomerListNotifier.notifyListeners();
  customerDB.putAt(index, value);

  getAllCustomers();
}
