import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({Key? key}) : super(key: key);

  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          child: AppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.blueAccent.withOpacity(.5),
            elevation: 0,
            title: Text(
              ' Transaction History',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 17,
                color: Colors.black.withOpacity(.7),
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: ,
    );
  }
}
