import 'package:cardoc/list.dart';
import 'package:flutter/material.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("           R E G I S T E R"),
        backgroundColor: Color.fromARGB(255, 36, 36, 36),
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
            child: Container(
              height: 650,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 50),
                  addcustomer(text1: "Name"),
                  SizedBox(height: 10),
                  addcustomer(text1: "Phone"),
                  SizedBox(height: 10),
                  addcustomer(text1: "Date"),
                  SizedBox(height: 10),
                  addcustomer(text1: "Car No"),
                  SizedBox(height: 10),
                  addcustomer(text1: "Model"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => List(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 179, 24, 24),
                    ),
                    
                    child: Icon(
                      Icons.done,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField addcustomer({required String text1}) {
    return TextFormField(
      style: TextStyle(height: .7, color: Color.fromARGB(255, 255, 255, 255)),
      decoration: InputDecoration(
        labelText: text1,
        labelStyle: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        fillColor: Color.fromARGB(224, 0, 0, 0),
        filled: true,
      ),
    );
  }
}
