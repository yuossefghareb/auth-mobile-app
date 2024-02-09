import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp_intern/auth/register.dart';
import 'package:temp_intern/models/user.dart';
import 'package:temp_intern/services/dp_helper.dart';
import 'package:temp_intern/services/shared_preference.dart';
import 'package:temp_intern/ui/pages/home_page.dart';

import '../Provider/state.dart';
import '../ui/widgets/custom_button.dart';
import '../ui/widgets/text_field.dart';
import '../ui/widgets/text_field_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controllerPass = TextEditingController();
  final TextEditingController controllerUser = TextEditingController();

  List<UserModel> userslist = [];
  @override
  void initState() {
    super.initState();
    generatedate();
  }

  Future<void> generatedate() async {
    userslist = await DBhelper(Dio()).getdate();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      height: 310,
                    ),
                    const Text(
                      "Login to in your account",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Username",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    CustomTextForm(
                      cancel: true,
                      hinttext: 'Enter User Name',
                      mycontroller: controllerUser,
                      validator: (validator) {},
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
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
                    }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Consumer<MyModel>(
                                builder: (context, model, child) {
                                  return IconButton(
                                    onPressed: () {
                                      model.chnagereadme();
                                    },
                                    icon: Icon(model.iconRead),
                                  );
                                },
                              ),
                              const Text('Remember me'),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Forgot Password?'),
                          ),
                        ],
                      ),
                    ),
                    Consumer<MyModel>(builder: ((context, model, child) {
                      return CustomButtonAuth(
                        title: 'Log in',
                        onPressed: () {
                          setState(() async {
                            await CachHelper.putData(value: model.isread);
                            bool isvalid = false;
                            if (controllerUser.text.isEmpty ||
                                controllerPass.text.isEmpty) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.info,
                                animType: AnimType.rightSlide,
                                title: 'error',
                                desc: 'email or Wrong password provided',
                              ).show();
                            } else {
                              for (var us in userslist) {
                                if (us.username == controllerUser.text &&
                                    us.password == controllerPass.text) {
                                  isvalid = true;
                                  if (model.isread) {
                                    CachHelper.putuserdata(
                                        firstname: us.firstname,
                                        lastname: us.lastname,
                                        image: us.image,
                                        gender: us.gender,
                                        email: us.email,
                                        username: us.username);
                                  }
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return HomePage(
                                          image: us.image,
                                          firstname: us.firstname,
                                          lastname: us.lastname,
                                          gender: us.gender,
                                          email: us.email,
                                          username: us.username);
                                    },
                                  ));
                                  break;
                                }
                              }
                              if(!isvalid)
                              {
                                 AwesomeDialog(
                                context: context,
                                dialogType: DialogType.info,
                                animType: AnimType.rightSlide,
                                title: 'error',
                                desc: 'email or Wrong password provided',
                              ).show();
                              }
                              print('hereeeeeeeeeeee');
                            }
                          });
                        },
                      );
                    })),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              setState(() {});
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const RegisertPage();
                                  },
                                ),
                              );
                            },
                            child: const Text('Register'),
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
      )),
    );
  }
}
