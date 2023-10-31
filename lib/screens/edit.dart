import 'package:cardoc/db/functions/db_functions.dart';
import 'package:cardoc/model/data_model.dart';
import 'package:cardoc/screens/list.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  final name;
  final phone;
  final date;
  final carnumber;
  final carmodel;
  int index;

  EditScreen(
      {required this.index,
      required this.name,
      required this.phone,
      required this.date,
      required this.carmodel,
      required this.carnumber});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _carNumberController = TextEditingController();
  TextEditingController _carModelController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _phoneController = TextEditingController(text: widget.phone);
    _dateController = TextEditingController(text: widget.date);
    _carNumberController = TextEditingController(text: widget.carnumber);
    _carModelController = TextEditingController(text: widget.carmodel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "E D I T",
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 36, 36, 36),
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
              height: 650,
              width: MediaQuery.of(context).size.width * 0.8,
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
                  const SizedBox(height: 50),
                  editcustomer(text1: "Name", controller: _nameController),
                  const SizedBox(height: 10),
                  editcustomer(text1: "Phone", controller: _phoneController),
                  const SizedBox(height: 10),
                  editcustomer(text1: "Package", controller: _dateController),
                  const SizedBox(height: 10),
                  editcustomer(
                      text1: "Car No", controller: _carNumberController),
                  const SizedBox(height: 10),
                  editcustomer(text1: "Model", controller: _carModelController),
                  ElevatedButton(
                    onPressed: () => editCustomerButton(context),
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
        ],
      ),
    );
  }

  TextFormField editcustomer(
      {required String text1, required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
          height: .7, color: Color.fromARGB(255, 255, 255, 255)),
      decoration: InputDecoration(
        labelText: text1,
        labelStyle: const TextStyle(
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
    );
  }

  editCustomerButton(BuildContext context) async {
    final name1 = _nameController.text.trim();
    final phone1 = _phoneController.text.trim();
    final date1 = _dateController.text.trim();
    final carNo1 = _carNumberController.text.trim();
    final carModel1 = _carModelController.text.trim();
    if (name1.isEmpty ||
        phone1.isEmpty ||
        date1.isEmpty ||
        carNo1.isEmpty ||
        carModel1.isEmpty) {
      return;
    }

    final update = CustomerModel(
        name: name1,
        phone: phone1,
        date: date1,
        carNumber: carNo1,
        carModel: carModel1);
    editCustomer(widget.index, update);
    Navigator.of(context).pop(MaterialPageRoute(
      builder: (context) => ListPage(),
    ));
  }
}
