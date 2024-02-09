import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp_intern/Provider/state.dart';
import 'package:temp_intern/auth/login.dart';

import '../ui/widgets/custom_button.dart';
import '../ui/widgets/text_field.dart';
import '../ui/widgets/text_field_password.dart';

class RegisertPage extends StatefulWidget {
  const RegisertPage({super.key});

  @override
  State<RegisertPage> createState() => _RegisertPageState();
}

class _RegisertPageState extends State<RegisertPage> {
  final TextEditingController controllerPass = TextEditingController();
  final TextEditingController controllerUser = TextEditingController();
  final TextEditingController controlleremail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ChangeNotifierProvider(
          create: (context)=>MyModel(),
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
                    const Text(
                      "Create new account",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: const Text(
                        "Username",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    CustomTextForm(
                      hinttext: 'Enter User Name',
                      mycontroller: controllerUser,
                      cancel: true,
                      validator: (validator) {},
                    ),
                    Container(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: const Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    CustomTextForm(
                      hinttext: 'Enter email',
                      cancel: true,
                      mycontroller: controlleremail,
                      validator: (validator) {},
                    ),
                    Container(
                      height: 10,
                    ),
                    const Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                   Consumer<MyModel>(builder: (context, model, child) {
                      return customFormPassword(
                        suufixicon: model.icon,
                        obscure: model.abs,
                        hinttext: "ُEnter Your Password",
                        mycontroller: controllerPass,
                        validator: (value) {
                          if (value == "") {
                            return 'password must not be empty';
                          }
                          return null;
                        },
                      );
                   }
                   ),
                   
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon:const Icon(Icons.check_box_outline_blank),
                              ),
                              Text('Remember me'),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Have a problem?'),
                          ),
                        ],
                      ),
                    ),
                    CustomButtonAuth(
                      title: 'Register',
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: Row(
                        children: [
                          Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return LoginPage();
                                  },
                                ),
                              );
                            },
                            child: Text('Log in'),
                          )
                        ],
                      ),
                    ),
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
              child: Container(
                width: 116,
                height: 116,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/Rectangle1136.png')),
                ),
              ),
              right: 150,
              top: 150,
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
          ],
        ),
        )
      ),
    );
  }
}
