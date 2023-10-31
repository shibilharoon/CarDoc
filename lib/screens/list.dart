import 'package:cardoc/db/functions/db_functions.dart';
import 'package:cardoc/model/data_model.dart';
import 'package:cardoc/screens/edit.dart';
import 'package:cardoc/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  TextEditingController searchController = TextEditingController();
  List<CustomerModel> filteredCustomerList = [];

  @override
  void initState() {
    super.initState();
    getAllCustomers();
  }

  void filterCustomers(String query) {
    setState(() {
      filteredCustomerList = CustomerListNotifier.value
          .where((customer) =>
              customer.name!.toLowerCase().contains(query.toLowerCase()) ||
              customer.phone!.contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LIST"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 36, 36, 36),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterCustomers(value);
              },
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Search for a customer',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: CustomerListNotifier,
              builder: (BuildContext ctx, List<CustomerModel> customerList,
                  Widget? child) {
                return ListView.separated(
                  itemBuilder: (ctx, index) {
                    final data = filteredCustomerList.isNotEmpty
                        ? filteredCustomerList[index]
                        : customerList[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Profile(
                            carmodel: data.carModel,
                            name: data.name,
                            phone: data.phone,
                            date: data.date,
                            carnumber: data.carNumber,
                          ),
                        ));
                      },
                      child: ListTile(
                        tileColor: Color.fromARGB(255, 229, 228, 228),
                        textColor: const Color.fromARGB(255, 0, 0, 0),
                        titleTextStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        title: Text(data.name!),
                        subtitle: Text(data.date!),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EditScreen(
                                      carmodel: data.carModel,
                                      index: index,
                                      name: data.name,
                                      phone: data.phone,
                                      date: data.date,
                                      carnumber: data.carNumber,
                                    ),
                                  ));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Color.fromARGB(255, 60, 34, 175),
                                )),
                            IconButton(
                                onPressed: () {
                                  deleteCustomer(index);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider();
                  },
                  itemCount: filteredCustomerList.isNotEmpty
                      ? filteredCustomerList.length
                      : customerList.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
