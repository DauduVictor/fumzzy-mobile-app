import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fumzy/components/app-bar.dart';
import 'package:fumzy/components/button.dart';
import 'package:fumzy/screens/dashboard/drawer.dart';
import 'package:fumzy/utils/constant-styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'delete-customer.dart';
import 'total-sales.dart';
import 'debt-history.dart';
import 'repayment-history.dart';
import 'package:fumzy/components/info-table.dart';

class CustomersDetail extends StatefulWidget {

  static const String id = 'customerDetail';

  @override
  _CustomersDetailState createState() => _CustomersDetailState();
}

class _CustomersDetailState extends State<CustomersDetail> {

  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => (Scaffold(
        appBar: buildAppBar(constraints, 'CUSTOMERS'),
        drawer: RefactoredDrawer(title: 'CUSTOMERS'),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.start,
                          spacing: constraints.maxWidth / 1.95,
                          runSpacing: 18.0,
                          children: [
                            //customer detail
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    IconlyBold.arrowLeftCircle,
                                    size: 19,
                                    color: Color(0xFF004E92).withOpacity(0.5),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    ' Customer Detail',
                                    style: TextStyle(
                                      color: Color(0xFF75759E),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.7,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //delete, mark as settled
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ReusableDeleteText(
                                  textSize: 16,
                                ),
                                Container(
                                  height: 25,
                                  margin: EdgeInsets.symmetric(horizontal: 9.0),
                                  child: VerticalDivider(
                                    color: Colors.grey,
                                    thickness: 0.6,
                                    width: 1,
                                  ),
                                ),
                                Container(
                                  height: 15,
                                  width: 30,
                                  child: Checkbox(
                                    value: checkBoxValue,
                                    onChanged: (onChanged) {
                                      if (checkBoxValue == true){
                                        return null;
                                      }
                                      _markAsSettled();
                                    },
                                    activeColor: Color(0xFF00AF27),
                                    checkColor: Colors.white,
                                    shape: CircleBorder(),
                                    splashRadius: 23,
                                  ),
                                ),
                                Text(
                                  'Mark as Settled',
                                  style: TextStyle(
                                    color: Color(0xFF052121),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 35),
                        //customers info
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            width: constraints.maxWidth,
                            decoration: kTableContainer,
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Customer’s Info',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF004E92),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 15.0),
                                  child: Divider(
                                    height: 1,
                                    thickness: 1,
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                ),
                                Wrap(
                                  runSpacing: 20,
                                  spacing: 55,
                                  children: [
                                    ReusableCustomerInfoFields(
                                      tableTitle: 'Name',
                                      widget: Text(
                                        'Obi Cubana and Sons Limited',
                                      ),
                                    ),
                                    ReusableCustomerInfoFields(
                                      tableTitle: 'Total Sales',
                                      widget: Text(
                                        'Obi CSons Limited',
                                      ),
                                    ),
                                    ReusableCustomerInfoFields(
                                      tableTitle: 'Sales Volume',
                                      widget: Text(
                                        'Obi Cubanad',
                                      ),
                                    ),
                                    ReusableCustomerInfoFields(
                                      tableTitle: 'On-board Date',
                                      widget: Text(
                                        'Obi Cubana ',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ReusableCustomerInfoFields(
                                      tableTitle: 'Total Debts',
                                    ),
                                    SizedBox(width: 40),
                                    ReusableCustomerInfoFields(
                                      tableTitle: 'Last Re-payment Date',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 35),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: constraints.maxWidth / 2.2,
                      child: TabBar(
                        labelStyle: kTabBarTextStyle,
                        labelColor: Color(0xFF004E92),
                        unselectedLabelColor:
                        Color(0xFF004E92).withOpacity(0.6),
                        indicatorColor: Color(0xFF004E92),
                        indicatorWeight: 3,
                        tabs: [
                          Tab(
                            child: Text(
                              'Total Sales',
                              style: kTabBarTextStyle,
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Debt History',
                              style: kTabBarTextStyle,
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Re-payment History',
                              style: kTabBarTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.end,
                        alignment: WrapAlignment.end,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              _addDebt(constraints);
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5)),
                              ),
                              side: BorderSide(color: Color(0xFF004E92)),
                            ),
                            child: Container(
                              width: 120,
                              height: 50,
                              child: Center(
                                child: Text(
                                  'Add Debt',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF004E92),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Button(
                            onTap: () {
                              _recordRepayment(constraints);
                            },
                            buttonColor: Color(0xFF00509A),
                            width: 120,
                            child: Center(
                              child: Text(
                                'Record Payment',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35),
                //table details
                Expanded(
                  child: TabBarView(
                    children: [
                      TotalSales(),
                      DebtHistory(),
                      RepaymentHistory(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
      )),
    );
  }

  Future<void> _addDebt(BoxConstraints constraints) {
    final formKey = GlobalKey<FormState>();
    TextEditingController amountController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    return showDialog(
      context: context,
      barrierColor: Color(0xFF000428).withOpacity(0.86),
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFFFFFFF),
        ),
        margin: EdgeInsets.all(50),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(24, 30, 24, 27),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F8FF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'NEW DEBT',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        IconlyBold.closeSquare,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ), //new category header with cancel icon
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 42),
                        child: Text(
                          'Add Debt',
                          style: TextStyle(
                            color: Color(0xFF00509A),
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 15.0),
                        child: Text(
                          'You have made additional purchase on credit. Please fill the fields to record your credit purchase.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF000428).withOpacity(0.6),
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///text field for customer
                              Text(
                                'Customer',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Obi Cubana and Sons Limited',
                                style: TextStyle(
                                  color: Color(0xFF1F1F1F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 30),
                              ///field for amount
                              Text(
                                'Amount',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: constraints.maxWidth,
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  controller: amountController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter amount';
                                    }
                                    return null;
                                  },
                                  decoration:
                                      kTextFieldBorderDecoration.copyWith(
                                    hintText: 'Enter amount',
                                    hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              ///field for description
                              Text(
                                'Description',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: constraints.maxWidth,
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  controller: descriptionController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter reference or description';
                                    }
                                    return null;
                                  },
                                  decoration:
                                      kTextFieldBorderDecoration.copyWith(
                                    hintText: 'Enter description',
                                    hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),

                              ///field for date
                              Text(
                                'Due Date',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: constraints.maxWidth,
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  controller: dateController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter due date';
                                    }
                                    return null;
                                  },
                                  decoration:
                                      kTextFieldBorderDecoration.copyWith(
                                    hintText: 'Enter due date',
                                    hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Button(
                        onTap: () {
                          print("Add Category");
                        },
                        buttonColor: Color(0xFF00509A),
                        child: Center(
                          child: Text(
                            'Record Debt',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: Text(
                            'No, Cancel',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _recordRepayment(BoxConstraints constraints) {
    final formKey = GlobalKey<FormState>();
    TextEditingController amountController = TextEditingController();
    TextEditingController referenceController = TextEditingController();
    return showDialog(
      context: context,
      barrierColor: Color(0xFF000428).withOpacity(0.86),
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFFFFFFF),
        ),
        margin: EdgeInsets.all(50),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(24, 30, 24, 27),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F8FF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'DEBT REPAYMENT',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        IconlyBold.closeSquare,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ), //new category header with cancel icon
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 42),
                        child: Text(
                          'Debt repayment',
                          style: TextStyle(
                            color: Color(0xFF00509A),
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 15.0),
                        child: Text(
                          'You have made additional purchase on credit. Please fill the fields to repay your debt.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF000428).withOpacity(0.6),
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///text field for customer
                              Text(
                                'Customer',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Obi Cubana and Sons Limited',
                                style: TextStyle(
                                  color: Color(0xFF1F1F1F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 30),
                              ///field for amount
                              Text(
                                'Amount',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: constraints.maxWidth,
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  controller: amountController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter amount';
                                    }
                                    return null;
                                  },
                                  decoration:
                                      kTextFieldBorderDecoration.copyWith(
                                    hintText: 'Enter amount',
                                    hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              ///field for reference
                              Text(
                                'Due Date',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: constraints.maxWidth,
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  controller: referenceController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter due date';
                                    }
                                    return null;
                                  },
                                  decoration:
                                      kTextFieldBorderDecoration.copyWith(
                                    hintText: 'Enter due date',
                                    hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Button(
                        onTap: () {
                          print("Add Category");
                        },
                        buttonColor: Color(0xFF00509A),
                        child: Center(
                          child: Text(
                            'Record Repayment',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: Text(
                            'No, Cancel',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _markAsSettled() {
    final formKey = GlobalKey<FormState>();
    TextEditingController reasonController = TextEditingController();
    String newPin = '';
    return showDialog(
      context: context,
      barrierColor: Color(0xFF000428).withOpacity(0.86),
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFFFFFFF),
        ),
        margin: EdgeInsets.all(50),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(24, 30, 24, 27),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F8FF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'MARK AS SETTLED',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        IconlyBold.closeSquare,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(top: 42),
                      child: Text(
                        'Are you sure you want to mark this Debt as settled?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF00509A),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 15.0),
                      child: Text(
                        'This will mean that this person no longer owes you and you wont find them under the debtor\'s list.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF000428).withOpacity(0.6),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Form(
                        key: formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Reason',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.name,
                                      controller: reasonController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter reason';
                                        }
                                        return null;
                                      },
                                      decoration:
                                      kTextFieldBorderDecoration.copyWith(
                                        hintText: 'Enter reason',
                                        hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Enter your PIN',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(height: 13),
                                    Container(
                                      width: 280,
                                      child: PinCodeTextField(
                                          appContext: context,
                                          length: 4,
                                          animationType: AnimationType.fade,
                                          enablePinAutofill: false,
                                          textStyle: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFF004E92),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          pinTheme: PinTheme(
                                              shape: PinCodeFieldShape.box,
                                              borderWidth: 1,
                                              fieldHeight: 60,
                                              fieldWidth: 60,
                                              activeColor: Color(0xFF7BBBE5),
                                              selectedColor: Color(0xFF7BBBE5),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          onChanged: (value) {
                                            if (!mounted) return;
                                            setState(() {
                                              newPin = value;
                                            });
                                          }),
                                    ),
                                    SizedBox(height: 36),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Button(
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          if (checkBoxValue == false) {
                            checkBoxValue = true;
                          } else {
                            checkBoxValue = true;
                          }
                        });
                      },
                      buttonColor: Color(0xFFF64932),
                      child: Center(
                        child: Text(
                          'Yes, Mark as settled',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Text(
                          'No, Cancel',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
