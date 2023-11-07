import 'package:cardoc/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DbProvider extends ChangeNotifier {
  List<CustomerModel> customerList = [];
  List<CustomerModel> filteredCustomerList = [];
  addCustomers(CustomerModel value) async {
    final customerDB = await Hive.openBox<CustomerModel>('customer_DB');
    await customerDB.add(value);
    customerList.add(value);
    notifyListeners();
  }

  Future<void> getAllCustomers() async {
    final customerDB = await Hive.openBox<CustomerModel>('customer_DB');
    customerList.clear();
    customerList.addAll(customerDB.values);
    notifyListeners();
  }

  Future<void> deleteCustomer(int index) async {
    final customerDB = await Hive.openBox<CustomerModel>('customer_DB');
    await customerDB.deleteAt(index);
    notifyListeners();
    getAllCustomers();
  }

  Future<void> editCustomer(index, CustomerModel value) async {
    final customerDB = await Hive.openBox<CustomerModel>('customer_DB');
    customerList.clear();
    customerList.addAll(customerDB.values);
    notifyListeners();
    customerDB.putAt(index, value);

    getAllCustomers();
  }

  calculateRevenue(List<CustomerModel> customers) {
    double amount = 0;
    for (var customer in customers) {
      amount += double.parse(customer.amount!);
    }
    return amount;
  }

  filterCustomer(query) {
    filteredCustomerList = customerList
        .where((customer) =>
            customer.name!.toLowerCase().contains(query.toLowerCase()) ||
            customer.phone!.contains(query))
        .toList();
    notifyListeners();
  }
}
