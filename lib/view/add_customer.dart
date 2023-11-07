import 'package:cardoc/controllers/date_provider.dart';
import 'package:cardoc/controllers/db_provider.dart';
import 'package:cardoc/model/data_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCustomer extends StatelessWidget {
  AddCustomer({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _carNumberController = TextEditingController();

  final TextEditingController _carModelController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

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
              _refreshScreen(context);
            },
            icon: const Icon(Icons.refresh),
          )
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
                        color: Color.fromARGB(255, 63, 63, 63),
                      ),
                    ),
                    const Text(
                      "Premium And Prestige Car Service",
                      style: TextStyle(color: Color.fromARGB(255, 63, 63, 63)),
                    ),
                    const SizedBox(height: 20),
                    addCustomer(
                      text1: "Name",
                      controller: _nameController,
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 10),
                    addCustomer(
                      text1: "Phone",
                      controller: _phoneController,
                      icon: Icons.phone,
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Provider.of<DateProvider>(context, listen: false)
                            .showDatePickers(context);
                      },
                      child: IgnorePointer(
                        child: addCustomer(
                          text1: "Date",
                          controller:
                              Provider.of<DateProvider>(context, listen: false)
                                  .fromDateContoller,
                          icon: Icons.calendar_today,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    addCustomer(
                      text1: "Car No",
                      controller: _carNumberController,
                      icon: Icons.directions_car,
                    ),
                    const SizedBox(height: 10),
                    addCustomer(
                      text1: "Car Model",
                      controller: _carModelController,
                      icon: Icons.car_rental,
                    ),
                    const SizedBox(height: 10),
                    addCustomer(
                      text1: "Amout",
                      controller: _amountController,
                      icon: Icons.currency_rupee,
                    ),
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
      {required String text1,
      required TextEditingController controller,
      required IconData icon}) {
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
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
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
    final db = Provider.of<DbProvider>(context, listen: false);
    final newname = _nameController.text.trim();
    final newphone = _phoneController.text.trim();
    final newdate = Provider.of<DateProvider>(context, listen: false)
        .fromDateContoller
        .text
        .trim();
    final newcarNo = _carNumberController.text.trim();
    final newcarModel = _carModelController.text.trim();
    final newAmount = _amountController.text.trim();
    if (newname.isEmpty ||
        newphone.isEmpty ||
        newdate.isEmpty ||
        newcarModel.isEmpty ||
        newcarNo.isEmpty ||
        newAmount.isEmpty) {
      return;
    }
    final isDuplicate = db.customerList.any(
        (customer) => customer.name == newname || customer.phone == newphone);
    if (isDuplicate) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Customer with the same name or number already exists.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    final newcustomer = CustomerModel(
        name: newname,
        phone: newphone,
        date: newdate,
        carNumber: newcarNo,
        carModel: newcarModel,
        amount: newAmount);
    db.addCustomers(newcustomer);
  }

  void _refreshScreen(context) {
    _nameController.clear();
    _phoneController.clear();
    Provider.of<DateProvider>(context, listen: false).fromDateContoller.clear();
    _carModelController.clear();
    _carNumberController.clear();
    _amountController.clear();
  }
}
