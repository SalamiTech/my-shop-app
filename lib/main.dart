import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/router/user_router.gr.dart';
import 'package:flutter_boilerplate/widgets/loader/loader_controller.dart';
import 'package:flutter_boilerplate/widgets/loader/loader_screen.dart';
import 'package:provider/provider.dart';

class _AppDataProviders extends StatelessWidget {
  final Widget child;

  const _AppDataProviders({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoaderController>(create: (_) => LoaderController()),
      ],
      child: child,
    );
  }
}

void main() {
  runApp(_AppDataProviders(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final userRouter = UserRouter();

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: userRouter.defaultRouteParser(),
      routerDelegate: userRouter.delegate(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Boilerplate',
      builder: (_, child) {
        return LoaderWrapper(child: child!);
      },
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}
