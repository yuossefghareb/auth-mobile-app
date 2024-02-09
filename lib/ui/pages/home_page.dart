// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp_intern/Provider/state.dart';
import 'package:temp_intern/auth/login.dart';
import 'package:temp_intern/services/shared_preference.dart';

import '../widgets/custom_button.dart';
import '../widgets/text_field.dart';
import '../widgets/text_field_password.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
    required this.image,
    required this.firstname,
    required this.lastname,
    required this.gender,
    required this.email,
    required this.username,
  }) : super(key: key);
  final String image;
  final String firstname;
  final String lastname;
  final String gender;
  final String email;
  final String username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controllerPass = TextEditingController();
  final TextEditingController controllerUser = TextEditingController();
  final TextEditingController controlleremail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
            body: ChangeNotifierProvider(
          create: (context) => MyModel(),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                  child: ListView(
                    children: [
                      Container(
                        height: 280,
                      ),
                      Text(
                        "${widget.firstname} ${widget.lastname}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8, left: 8),
                        child: Text(
                          "Username",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      CustomTextForm(
                        hinttext: widget.username,
                        mycontroller: controllerPass,
                        validator: (validator) {},
                      ),
                      Container(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8, left: 8),
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      CustomTextForm(
                        hinttext: widget.email,
                        mycontroller: controlleremail,
                        validator: (validator) {},
                      ),
                      Container(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8, left: 8),
                        child: Text(
                          "Gender",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      CustomTextForm(
                        hinttext: widget.gender,
                        mycontroller: controllerPass,
                        validator: (value) {},
                        obscure: true,
                      ),
                      Consumer<MyModel>(builder: ((context, model, child) {
                        return CustomButtonAuth(
                          title: 'Log out',
                          color: Colors.red,
                          onPressed: () {
                            setState(() {});
                            model.chnagereadme();
                            CachHelper.putData(value: false);
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: ((context) {
                              return LoginPage();
                            })), (route) => false);
                          },
                        );
                      })),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Image.asset(
                  'assets/Rectangle1135.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
              Positioned(
                child: Image.asset(
                  'assets/XMLID27.png',
                ),
                left: 0,
                top: 0,
              ),
              Positioned(
                child: Image.asset(
                  'assets/XMLID12.png',
                ),
                right: 0,
                top: 95,
              ),
              Positioned(
                child: Image.asset(
                  'assets/XMLID25.png',
                ),
                left: 40,
                top: 20,
              ),
              Positioned(
                child: Image.asset(
                  'assets/XMLID_9.png',
                ),
                left: 0,
                top: 95,
              ),
              Positioned(
                child: Image.asset(
                  'assets/XMLID_9.png',
                ),
                left: 0,
                top: 95,
              ),
              Positioned(
                child: Image.asset(
                  'assets/XMLID_10.png',
                ),
                left: 90,
                top: 95,
              ),
              Positioned(
                child: Image.asset(
                  'assets/XMLID_15.png',
                ),
                right: 0,
                top: 95,
              ),
              Positioned(
                child: Container(
                  width: 116,
                  height: 116,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(widget.image),
                    ),
                  ),
                ),
                right: 150,
                top: 150,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
