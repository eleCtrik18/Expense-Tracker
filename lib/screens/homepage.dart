import 'package:fintech/screens/expense_tracker/transaction.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Stack(children: <Widget>[
                Positioned(
                  top: 60,
                  left: 0,
                  child: Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 100,
                    left: 10,
                    child: Text(
                      'Fintech',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ))
              ]),
            ),
            SizedBox(
              height: 30,
            ),
            Positioned(
                top: 110,
                left: 20,
                child: Text(
                  'Hello User',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Transaction()));
              },
              splashColor: Colors.blueAccent,
              child: Container(
                height: 180,
                child: Stack(
                  children: [
                    Positioned(
                        child: Material(
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: Offset(-10.0, 10.0),
                                blurRadius: 15.0,
                                spreadRadius: 4.0),
                          ],
                        ),
                      ),
                    )),
                    Positioned(
                        top: 45,
                        left: 100,
                        child: Column(children: [
                          Text(
                            'Expense Tracker',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF363f93),
                            ),
                          ),
                          Text(
                            'Track your expenses',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          // Text(
                          //   '',
                          //   style: TextStyle(
                          //     fontSize: 15,
                          //     fontWeight: FontWeight.bold,
                          //     color: Colors.grey,
                          //   ),
                          // ),
                        ])),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 180,
              child: Stack(
                children: [
                  Positioned(
                      child: Material(
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: Offset(-10.0, 10.0),
                              blurRadius: 15.0,
                              spreadRadius: 4.0),
                        ],
                      ),
                    ),
                  )),
                  Positioned(
                      top: 45,
                      left: 100,
                      child: Column(children: [
                        Text(
                          'Bill Payment',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF363f93),
                          ),
                        ),
                        Text(
                          'Bill payment reminder',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        // Text(
                        //   '',
                        //   style: TextStyle(
                        //     fontSize: 15,
                        //     fontWeight: FontWeight.bold,
                        //     color: Colors.grey,
                        //   ),
                        // ),
                      ])),
                ],
              ),
            )
          ]),
        ));
  }
}
