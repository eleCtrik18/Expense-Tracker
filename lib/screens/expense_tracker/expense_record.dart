import 'package:fintech/db/db.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({Key? key}) : super(key: key);

  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  DbHelper dbHelper = DbHelper();
  int totalBalance = 0;
  int totalExpense = 0;
  int totalIncome = 0;

  getTotalBalance(Map entireData) {
    totalBalance = 0;
    totalIncome = 0;
    totalExpense = 0;
    entireData.forEach((key, value) {
      if (value['type'] == 'Income') {
        totalBalance += (value['amount'] as int);
        totalIncome += (value['amount'] as int);
      } else {
        totalExpense += value['amount'] as int;
        totalBalance -= value['amount'] as int;
      }
      print(totalBalance);
      print(totalIncome);
      print(totalExpense);
    });
  }

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
        body: FutureBuilder<Map>(
            future: dbHelper.fetch(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error'),
                );
              }
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('No Data'),
                  );
                }
                getTotalBalance(snapshot.data!);
                return ListView(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: EdgeInsets.all(12.0),
                      child: Ink(
                        decoration: const BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              24.0,
                            ),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  offset: Offset(-10.0, 10.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 4.0),
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                24.0,
                              ),
                            ),
                            // color: Static.PrimaryColor,
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            vertical: 18.0,
                            horizontal: 8.0,
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Total Balance',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  // fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                              totalBalance >= 0
                                  ? Text(
                                      '\₹ $totalBalance',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    )
                                  : Text(
                                      '\₹ $totalBalance',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.red,
                                      ),
                                    ),
                              SizedBox(
                                height: 12.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    cardIncome(totalIncome.toString()),
                                    cardExpense(totalExpense.toString()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Transaction History',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Map dataAtIndex = snapshot.data![index];
                          if (dataAtIndex['type'] == 'Income') {
                            return incomeTile(
                              dataAtIndex['amount'],
                              dataAtIndex['note'],
                            );
                          } else {
                            return expenseTile(
                              dataAtIndex['amount'],
                              dataAtIndex['note'],
                            );
                          }
                        }),
                  ],
                );
              }
              return Center(
                child: Text('Expense'),
              );
            }));
  }
}

Widget cardIncome(String value) {
  return Row(
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        padding: EdgeInsets.all(
          6.0,
        ),
        child: Icon(
          Icons.arrow_downward,
          size: 28.0,
          color: Colors.green[700],
        ),
        margin: EdgeInsets.only(
          right: 8.0,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Income",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.blueGrey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget cardExpense(String value) {
  return Row(
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        padding: EdgeInsets.all(
          6.0,
        ),
        child: Icon(
          Icons.arrow_upward,
          size: 28.0,
          color: Colors.red[700],
        ),
        margin: EdgeInsets.only(
          right: 8.0,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Expense",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.blueGrey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget expenseTile(int value, String note) {
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  return InkWell(
    splashColor: Colors.blue.withAlpha(30),
    child: Container(
      padding: const EdgeInsets.all(18.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.red.withOpacity(0.3),
              offset: Offset(-10.0, 10.0),
              blurRadius: 15.0,
              spreadRadius: 4.0),
        ],
        color: Color(0xffced4eb),
        borderRadius: BorderRadius.circular(
          8.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_circle_up_outlined,
                        size: 28.0,
                        color: Colors.red[700],
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        "Debit",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),

                  //
                  // Padding(
                  //   padding: const EdgeInsets.all(6.0),
                  //   child: Text(
                  //     "${date.day} ${months[date.month - 1]} ",
                  //     style: TextStyle(
                  //       color: Colors.grey[800],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "- ₹$value",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      note,
                      style: TextStyle(
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget incomeTile(int value, String note) {
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  return InkWell(
    splashColor: Colors.blue.withAlpha(30),
    onTap: () {
      print("Tapped");
    },
    child: Container(
      padding: const EdgeInsets.all(18.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.green.withOpacity(0.3),
              offset: Offset(-10.0, 10.0),
              blurRadius: 15.0,
              spreadRadius: 4.0),
        ],
        color: Color(0xffced4eb),
        borderRadius: BorderRadius.circular(
          8.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_circle_down_outlined,
                    size: 28.0,
                    color: Colors.green[700],
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    "Credit",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              //
              Padding(
                padding: const EdgeInsets.all(6.0),
                // child: Text(
                //   "${date.day} ${months[date.month - 1]} ",
                //   style: TextStyle(
                //     color: Colors.grey[800],
                //   ),
                // ),
              ),
              //
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "+ ₹$value",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              //
              //
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  note,
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
