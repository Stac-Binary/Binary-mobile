import 'package:binary_flutter/constants/constants.dart';
import 'package:binary_flutter/provider/dog_provider.dart';
import 'package:binary_flutter/provider/login_provider.dart';
import 'package:binary_flutter/screens/dogs/second_screen/dog_register_second.dart';
import 'package:binary_flutter/screens/login/login_screen.dart';
import 'package:binary_flutter/screens/route_page.dart';
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
      providers: [
        ChangeNotifierProvider.value(value: LoginProvider()),
        ChangeNotifierProvider.value(value: DogProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(appBarTheme: AppBarTheme(color: kWhite)),
        title: 'ASDF',
        home: Consumer<LoginProvider>(builder: (ctx, item, _) {
          print(item.status);
          if (item.status == Status.auth) return Body();
          return LoginScreen();
        }),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DogProvider>(context, listen: false).loadingDogs(
          Provider.of<LoginProvider>(context, listen: false).model.data.id);
    });
    return Consumer<DogProvider>(
      builder: (ctx, item, _) {
        if (item.status == DogStatus.end) return RoutePage();
        if (item.status == DogStatus.zero)
          return DogRegisterSecond(
              Provider.of<LoginProvider>(context, listen: false).model.data.id);
        if (item.status == DogStatus.error) return Text("Request to manager");
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
