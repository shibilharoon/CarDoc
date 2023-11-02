import 'dart:async';
import 'package:cardoc/controllers/db_functions.dart';
import 'package:cardoc/model/data_model.dart';
import 'package:cardoc/view/edit.dart';
import 'package:cardoc/view/pie_chart.dart';
import 'package:cardoc/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  TextEditingController searchController = TextEditingController();

  Map<int, Color> tileColors = {};
  Map<int, bool> completionStatus = {};

  // @override
  // void initState() {
  //     final db = Provider.of<DbProvider>(context,listen: false);
  //   super.initState();
  //   db.getAllCustomers();
  // }

  @override
  void didChangeDependencies() {
    Provider.of<DbProvider>(context, listen: false).getAllCustomers();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void filterCustomers(String query) {
    Provider.of<DbProvider>(context, listen: false).filterCustomer(query);
  }

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final db = Provider.of<DbProvider>(context, listen: false);
        return AlertDialog(
          title: const Text('Delete Customer'),
          content: const Text('Are you sure you want to delete this customer?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                db.deleteCustomer(index);
                Navigator.of(context).pop();
              },
              child: const Text(
                'Delete',
                style: TextStyle(
                  color: Color.fromARGB(255, 181, 23, 23),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void changeTileColorToRed(int index) async {
    await Future.delayed(const Duration(seconds: 10));

    tileColors[index] = const Color.fromARGB(255, 243, 33, 33);
    completionStatus[index] = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<DbProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("LIST"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 36, 36, 36),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PieChartPage(),
                ));
              },
              icon: const Icon(Icons.bar_chart_rounded))
        ],
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
              decoration: const InputDecoration(
                hintText: 'Search for a customer',
                prefixIcon: Icon(Icons.search),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                hintStyle: TextStyle(color: Colors.grey),
                prefixIconColor: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          Flexible(
            child: Consumer(
              builder: (context, value, child) {
                return ListView.separated(
                  itemBuilder: (ctx, index) {
                    final data = db.filteredCustomerList.isNotEmpty
                        ? db.filteredCustomerList[index]
                        : db.customerList[index];

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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ListTile(
                          tileColor: tileColors[index] ??
                              const Color.fromARGB(255, 24, 24, 24),
                          textColor: const Color.fromARGB(255, 255, 255, 255),
                          titleTextStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          title: Text(data.name!),
                          subtitle: Text(data.date!),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => EditScreen(
                                        carmodel: data.carModel,
                                        index: index,
                                        name: data.name,
                                        phone: data.phone,
                                        date: data.date,
                                        carnumber: data.carNumber,
                                        amount: data.amount,
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  _showDeleteConfirmationDialog(index);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.red)),
                                onPressed: () {
                                  if (completionStatus[index] == true) {
                                  } else {
                                    changeTileColorToRed(index);
                                  }
                                },
                                child: Text(
                                  completionStatus[index] == true
                                      ? "Service Done"
                                      : "Start",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider();
                  },
                  itemCount: db.filteredCustomerList.isNotEmpty
                      ? db.filteredCustomerList.length
                      : db.customerList.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
