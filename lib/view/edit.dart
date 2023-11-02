



import 'package:cardoc/controllers/db_functions.dart';import 'package:cardoc/model/data_model.dart';
import 'package:cardoc/view/list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  final name;
  final phone;
  final date;
  final carnumber;
  final carmodel;
  final amount;
  int index;

  EditScreen(
      {super.key,
      required this.index,
      required this.name,
      required this.phone,
      required this.date,
      required this.carmodel,
      required this.carnumber,
      required this.amount});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _carNumberController = TextEditingController();
  TextEditingController _carModelController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _phoneController = TextEditingController(text: widget.phone);
    _dateController = TextEditingController(text: widget.date);
    _carNumberController = TextEditingController(text: widget.carnumber);
    _carModelController = TextEditingController(text: widget.carmodel);
    _amountController = TextEditingController(text: widget.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "E D I T",
        ),
        centerTitle: true,
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
                  editcustomer(
                    text1: "Name",
                    controller: _nameController,
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 10),
                  editcustomer(
                      text1: "Phone",
                      controller: _phoneController,
                      icon: Icons.phone),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      _showDatePicker(context);
                    },
                    child: IgnorePointer(
                      child: editcustomer(
                        text1: "Date",
                        controller: TextEditingController(
                          text: _selectedDate != null
                              ? DateFormat("MM/dd/yyyy").format(_selectedDate!)
                              : "",
                        ),
                        icon: Icons.calendar_today,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  editcustomer(
                      text1: "Car No",
                      controller: _carNumberController,
                      icon: Icons.directions_car),
                  const SizedBox(height: 10),
                  editcustomer(
                      text1: "Model",
                      controller: _carModelController,
                      icon: Icons.car_rental),
                  const SizedBox(height: 10),
                  editcustomer(
                      text1: "Amount",
                      controller: _amountController,
                      icon: Icons.car_rental),
                  ElevatedButton(
                    onPressed: () => editCustomerButton(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 179, 24, 24),
                    ),
                    child: const Icon(
                      Icons.done_all_rounded,
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

  TextFormField editcustomer({
    required String text1,
    required TextEditingController controller,
    required IconData icon,
  }) {
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
          )),
    );
  }

  editCustomerButton(BuildContext context) async {
    final db = Provider.of<DbProvider>(context);
    final name1 = _nameController.text.trim();
    final phone1 = _phoneController.text.trim();
    final date1 = _dateController.text.trim();
    final carNo1 = _carNumberController.text.trim();
    final carModel1 = _carModelController.text.trim();
    final amount1 = _amountController.text.trim();

    if (name1.isEmpty ||
        phone1.isEmpty ||
        date1.isEmpty ||
        carNo1.isEmpty ||
        carModel1.isEmpty||
        amount1.isEmpty
        ) {
      return;
    }

    final update = CustomerModel(
      name: name1,
      phone: phone1,
      date: date1,
      carNumber: carNo1,
      carModel: carModel1,
      amount: amount1,
      
    );
    db.editCustomer(widget.index, update);
    Navigator.of(context).pop(MaterialPageRoute(
      builder: (context) => const ListPage(),
    ));
  }
}
