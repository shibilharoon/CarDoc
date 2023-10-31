import 'package:cardoc/controllers/db_functions.dart';
import 'package:cardoc/model/data_model.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key? key}) : super(key: key);

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _carNumberController = TextEditingController();
  final TextEditingController _carModelController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime? _selectedDate;

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
                        _showDatePicker(context);
                      },
                      child: IgnorePointer(
                        child: addCustomer(
                          text1: "Date",
                          controller: TextEditingController(
                            text: _selectedDate != null
                                ? DateFormat("MM/dd/yyyy")
                                    .format(_selectedDate!)
                                : "",
                          ),
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

  void _showDatePicker(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat("MM/dd/yyyy").format(pickedDate);
      });
    }
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
    final newname = _nameController.text.trim();
    final newphone = _phoneController.text.trim();
    final newdate = _dateController.text.trim();
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
    final isDuplicate = CustomerListNotifier.value.any(
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
    addCustomers(newcustomer);
  }

  void _refreshScreen() {
    _nameController.clear();
    _phoneController.clear();
    _dateController.clear();
    _carModelController.clear();
    _carNumberController.clear();
    _amountController.clear();
  }
}