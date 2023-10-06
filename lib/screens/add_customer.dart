import 'package:cardoc/db/functions/db_functions.dart';
import 'package:cardoc/model/data_model.dart';
import 'package:cardoc/screens/list.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class AddCustomer extends StatelessWidget {
  AddCustomer({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _carNumberController = TextEditingController();
  final TextEditingController _carModelController = TextEditingController();
  void _showDatePicker(BuildContext context) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("R E G I S T E R"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 36, 36, 36),
        actions: [
          IconButton(
              onPressed: () {
                _refreshScreen();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            child: Opacity(
              opacity: 0.6,
              child: Image.asset(
                "assets/images/car-being-taking-care-workshop.jpg",
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Center(
            child: Transform.rotate(
              angle: 45 * (3.14159265359 / 180),
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 680,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "CARDOC",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 63, 63, 63)),
                    ),
                    const Text(
                      "Premium And Prestige Car Service",
                      style: TextStyle(color: Color.fromARGB(255, 63, 63, 63)),
                    ),
                    const SizedBox(height: 20),
                    addCustomer(text1: "Name", controller: _nameController),
                    const SizedBox(height: 10),
                    addCustomer(text1: "Phone", controller: _phoneController),
                    const SizedBox(height: 10),
                    addCustomer(
                      text1: "Package",
                      controller: _dateController,
                    ),
                    const SizedBox(height: 10),
                    addCustomer(
                        text1: "Car No", controller: _carNumberController),
                    const SizedBox(height: 10),
                    addCustomer(
                        text1: "Car Model", controller: _carModelController),
                    ElevatedButton.icon(
                        onPressed: () {
                          _showDatePicker(context);
                        },
                        icon: Icon(Icons.date_range),
                        label: Text("Date")),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          addCustomerButton(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 179, 24, 24),
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField addCustomer(
      {required String text1, required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
          height: .7, color: Color.fromARGB(255, 255, 255, 255)),
      decoration: InputDecoration(
        hintText: text1,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        fillColor: const Color.fromARGB(224, 0, 0, 0),
        filled: true,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return ' Please fill the field';
        } else {
          return null;
        }
      },
    );
  }

  Future<void> addCustomerButton(BuildContext context) async {
    final _name = _nameController.text.trim();
    final _phone = _phoneController.text.trim();
    final _date = _dateController.text.trim();
    final _carNo = _carNumberController.text.trim();
    final _carModel = _carModelController.text.trim();
    if (_name.isEmpty ||
        _phone.isEmpty ||
        _date.isEmpty ||
        _carNo.isEmpty ||
        _carModel.isEmpty) {
      return;
    }
    final _customer = CustomerModel(
        name: _name,
        phone: _phone,
        date: _date,
        carNumber: _carNo,
        carModel: _carModel);
    addCustomers(_customer);
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (context) => _refreshScreen(),
    // ));
  }

  void _refreshScreen() {
    _nameController.clear();
    _phoneController.clear();
    _dateController.clear();
    _carModelController.clear();
    _carNumberController.clear();
  }
}
