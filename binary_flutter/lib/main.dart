import 'package:binary_flutter/constants/constants.dart';
import 'package:binary_flutter/provider/login_provider.dart';
import 'package:binary_flutter/screens/dogs/first_screen/dog_register_first.dart';
import 'package:binary_flutter/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: LoginProvider())],
      child: MaterialApp(
        theme: ThemeData(appBarTheme: AppBarTheme(color: kWhite)),
        title: 'ASDF',
        home: Consumer<LoginProvider>(builder: (ctx, item, _) {
          print(item.status);
          if (item.status == Status.auth) return HomePage();
          return DogRegisterFirst();
        }),
      ),
    );
  }
}
