import 'package:flutter/material.dart';
import 'package:fumzy/screens/dashboard/drawer.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fumzy/screens/ReuseableWidgets.dart';

class Creditors extends StatefulWidget {
  static const String id = 'creditors';

  @override
  _CreditorsState createState() => _CreditorsState();
}

class _CreditorsState extends State<Creditors> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => (Scaffold(
        appBar: buildAppBar(constraints, 'Creditors'),
        drawer: RefactoredDrawer(),
        body: ListView(
          children: [
            Container(
              child: Container(
                padding: EdgeInsets.only(
                    top: constraints.maxHeight * 0.07,
                    left: constraints.maxWidth * 0.026,
                    right: constraints.maxWidth * 0.026),
                color: Color(0xFFF7F8F9),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(bottom: constraints.maxHeight * 0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'All Creditors',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("save changes");
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: constraints.maxHeight * 0.044),
                              height: constraints.maxHeight * 0.133,
                              width: constraints.maxWidth * 0.156,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Color(0xFF00509A),
                              ),
                              child: Center(
                                child: Text(
                                  'Add New Creditor',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(bottom: constraints.maxHeight * 0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: constraints.maxHeight * 0.125,
                            width: constraints.maxWidth * 0.34,
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(27.5),
                            ),
                            child: TextField(
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  IconlyLight.search,
                                  color: Colors.black,
                                  size: 17,
                                ),
                                hintText: 'Search',
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.0,
                                  color: Colors.black),
                            ),
                          ), //search
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print("export table");
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: constraints.maxHeight * 0.044),
                                  padding: EdgeInsets.all(15),
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.file_download_outlined,
                                        color: Color(0xFF75759E),
                                        size: 17,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          'Export table',
                                          style: TextStyle(
                                            color: Color(0xFF75759E),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print("filter");
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: constraints.maxHeight * 0.044),
                                  padding: EdgeInsets.all(15),
                                  height: constraints.maxHeight * 0.133,
                                  width: constraints.maxWidth * 0.131,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.0),
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xFFE2E2EA),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Filter',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Icon(
                                        Icons.tune,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ), //filter
                            ],
                          ),
                        ],
                      ),
                    ), //search, export and filter
                    Container(
                      margin:
                          EdgeInsets.only(top: constraints.maxHeight * 0.028),
                      width: constraints.maxWidth * 0.69,
                      height: constraints.maxHeight * 1.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          width: 1,
                          color: Color(0xFFE2E2EA),
                        ),
                      ),
                      child: ReusableDataTable(),//table
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class ReusableDataTable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle: TextStyle(
        color: Color(0xFF75759E),
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
      dataTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 13,
        //fontWeight: FontWeight.w400,
      ),
      columnSpacing: 5.0,
      dataRowHeight: 65.0,
      columns: [
        DataColumn(label: Text(' Name')),
        DataColumn(label: Text('Total Credits')),
        DataColumn(label: Text('Last Re-payment Date')),
        DataColumn(label: Text('')),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('Obi Cubana and Sons Limited')),
          DataCell(Text('N5,000')),
          DataCell(Text('-')),
          DataCell(ReusableTableArrowButton()),
        ]),
        DataRow(cells: [
          DataCell(Text('Obi Cubana and Sons Limited')),
          DataCell(Text('N20,000')),
          DataCell(Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('23, May 2021'),
              Text(
                '12:30pm',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          )),
          DataCell(ReusableTableArrowButton()),
        ]),
        DataRow(cells: [
          DataCell(Text('Obi Cubana and Sons Limited')),
          DataCell(Text('N200,000')),
          DataCell(Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('23, May 2021'),
              Text(
                '12:30pm',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          )),
          DataCell(ReusableTableArrowButton()),
        ]),
        DataRow(cells: [
          DataCell(Text('Obi Cubana and Sons Limited')),
          DataCell(Text('N180,000')),
          DataCell(Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('23, May 2021'),
              Text(
                '12:30pm',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          )),
          DataCell(ReusableTableArrowButton()),
        ]),
        DataRow(cells: [
          DataCell(Text('Obi Cubana and Sons Limited')),
          DataCell(Text('N180,000')),
          DataCell(Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('23, May 2021'),
              Text(
                '12:30pm',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          )),
          DataCell(ReusableTableArrowButton()),
        ]),
      ],
    );
  }
}


