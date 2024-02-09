import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp_intern/Provider/state.dart';
import 'package:temp_intern/auth/login.dart';

import 'package:temp_intern/services/shared_preference.dart';
import 'package:temp_intern/ui/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: BulidHomePage(),
    );
  }
}

class BulidHomePage extends StatelessWidget {
  const BulidHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyModel(),
      child: Consumer<MyModel>(
        builder: ((context, model, child) {
          List<String> user = CachHelper.getuserdata();
          return CachHelper.getdate() && user.isNotEmpty
              ? HomePage(
                  image: user[3],
                  firstname: user[0],
                  lastname: user[1],
                  gender: user[5],
                  email: user[4],
                  username: user[2],
                )
              : LoginPage();
        }),
      ),
    );
  }
}
