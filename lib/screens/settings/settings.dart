import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fumzy/components/app-bar.dart';
import 'package:fumzy/components/button.dart';
import 'package:fumzy/screens/dashboard/drawer.dart';
import 'package:fumzy/utils/constant-styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Settings extends StatefulWidget {

  static const String id = 'settings';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  /// A [GlobalKey] to hold the form state of my form widget for form validation
  final _formKey = GlobalKey<FormState>();

  /// A [TextEditingController] to control the input text for the name
  TextEditingController _nameController = TextEditingController();

  /// A [TextEditingController] to control the input text for the phone number
  TextEditingController _phoneController = TextEditingController();

  String _currentPin = '';

  String _newPin = '';

  String _confirmPin = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if(!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
      },
      child: LayoutBuilder(
        builder: (context, constraints) => (Scaffold(
          appBar: buildAppBar(constraints, 'SETTINGS'),
          drawer: RefactoredDrawer(title: 'SETTINGS'),
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 194,
                    child: TabBar(
                      labelStyle: kTabBarTextStyle,
                      labelColor: Color(0xFF004E92),
                      unselectedLabelColor: Color(0xFF004E92).withOpacity(0.6),
                      indicatorColor: Color(0xFF004E92),
                      indicatorWeight: 3,
                      tabs: [
                        Tab(
                          child: Text(
                            'Account',
                            style: kTabBarTextStyle,
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Security',
                            style: kTabBarTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _accountSection(constraints),
                        _securitySection(constraints),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  /// View for account details
  Widget _accountSection(BoxConstraints constraints){
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: kTableContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/settingsgroup.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 56),
            _buildAccountForm(constraints),
            SizedBox(height: 40),
            Button(
              onTap: (){
                print("save changes");
              },
              buttonColor: Color(0xFF00509A),
              child: Center(
                child: Text(
                  'Save Changes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  /// Form widget for account details
  Widget _buildAccountForm(BoxConstraints constraints){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
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
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.name,
                  controller: _nameController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your name';
                    }
                    return null;
                  },
                  decoration: kTextFieldBorderDecoration.copyWith(
                    hintText: 'Enter name',
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
          // Phone Number
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phone Number',
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
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  controller: _phoneController,
                  maxLength: 11,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your name';
                    }
                    return null;
                  },
                  decoration: kTextFieldBorderDecoration.copyWith(
                    hintText: 'Enter phone number',
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
        ]
      ),
    );
  }

  /// View for security section
  Widget _securitySection(BoxConstraints constraints){
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: kTableContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current PIN',
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
                        obscuringCharacter: '*',
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
                            borderRadius: BorderRadius.all(Radius.circular(3))
                        ),
                        onChanged: (value) {
                          if(!mounted)return;
                          setState(() {
                            _currentPin = value;
                          });
                        }
                    ),
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Text(
                      'Show',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: 36),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New PIN',
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
                        obscuringCharacter: '*',
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
                            borderRadius: BorderRadius.all(Radius.circular(3))
                        ),
                        onChanged: (value) {
                          if(!mounted)return;
                          setState(() {
                            _newPin = value;
                          });
                        }
                    ),
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Text(
                      'Show',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: 36),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Confirm PIN',
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
                        obscuringCharacter: '*',
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
                            borderRadius: BorderRadius.all(Radius.circular(3))
                        ),
                        onChanged: (value) {
                          if(!mounted)return;
                          setState(() {
                            _confirmPin = value;
                          });
                        }
                    ),
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Text(
                      'Show',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: 36),
                ],
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: Button(
                onTap: (){
                  print("save changes");
                },
                buttonColor: Color(0xFF00509A),
                child: Center(
                  child: Text(
                    'Save Changes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

}
