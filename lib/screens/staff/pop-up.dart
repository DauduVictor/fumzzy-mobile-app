import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fumzy/components/button.dart';
import 'package:fumzy/utils/constant-styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ReusablePopMenu extends StatefulWidget {
  @override
  State<ReusablePopMenu> createState() => _ReusablePopMenuState();
}

class _ReusablePopMenuState extends State<ReusablePopMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: Offset(110, 40),
      icon: Icon(
        Icons.more_horiz,
        color: Color(0xFF00509A),
      ),
      onSelected: (value) {
        switch (value) {
          case 0:
            {
              _resetPin();
            }
            break;
          case 1:
            {
              _block();
            }
            break;
          case 2:
            {
              _deletePermanently();
            }
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Container(width: 135, child: Text('Reset Pin')),
          value: 0,
        ),
        PopupMenuItem(
          child: Text('Block'),
          value: 1,
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.delete,
                color: Color(0xFFF64932),
                size: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 1.5),
                child: Text(
                  'Delete Permanently',
                  style: TextStyle(color: Color(0xFFF64932)),
                ),
              ),
            ],
          ),
          value: 2,
        ),
      ],
    );
  }

  Future<void> _resetPin() {
    final formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    String newPin = '';
    String confirmPin = '';
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
                      'NEW STAFF',
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
                        'Reset PIN',
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
                        'To add a new staff pin set a solid 4-digit pin for the new staff and confirm.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF000428).withOpacity(0.6),
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0,
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
                              SizedBox(height: 20),
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
                                              confirmPin = value;
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
                        _popUpMessage(
                          'RESET PIN',
                          'Staff Pin Reset Successfully',
                          'Staff pin has been reset successfully. Go back to review other staffs',
                          Color(0xFF00CFA0),
                        );
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

  Future<void> _block() {
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
                      'BLOCK STAFF',
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
                        'Are you sure you want to block this Staff?',
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
                        'This will mean that this staff will temporary not be allowed to make/conduct business decisions or activities',
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
                        _popUpMessage(
                          'BLOCK',
                          'Staff Pin Blocked Successfully',
                          'Staff pin has been blocked successfully. Go back to review other staffs',
                          Color(0xFFF64932),
                        );
                      },
                      buttonColor: Color(0xFF00509A),
                      child: Center(
                        child: Text(
                          'Yes, block',
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

  Future<void> _deletePermanently() {
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
                      'DELETE',
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
                        'Are you sure you want to delete this Staff?',
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
                        'This will mean that this staff is no longer part of your organization and the staff\'s detail wont be found under the staffs',
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
                        _popUpMessage(
                          'DELETE',
                          'Staff Deleted Successfully',
                          'Staff has been deleted successfully. Go back to review other staffs',
                          Color(0xFFF64932),
                        );
                      },
                      buttonColor: Color(0xFF00509A),
                      child: Center(
                        child: Text(
                          'Yes, delete',
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

  Future<void> _popUpMessage(

      String title,
      String heading,
      String subheading,
      Color doneColor

      ) {
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
                      title,
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
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 27),
                        Container(
                          width: 67,
                          height: 67,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: doneColor.withOpacity(0.15),
                          ),
                          child: Icon(
                            Icons.done_rounded,
                            color: doneColor,
                            size: 45,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 22),
                          child: Text(
                            heading,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF00509A),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 19.0),
                          child: Text(
                            subheading,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF000428).withOpacity(0.6),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Button(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          buttonColor: Color(0xFF00509A),
                          child: Center(
                            child: Text(
                              'Go back',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
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
