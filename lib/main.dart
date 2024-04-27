import 'package:app/app_blocs.dart';
import 'package:app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:app/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // create: (context) => SubjectBloc(),
      providers: [
BlocProvider(create: (context) => WelcomeBloc(),),
BlocProvider(create: (context) => AppBlocs(),)

      ],
      child: ScreenUtilInit(
          // Use builder only if you need to use library outside ScreenUtilInit context
          builder: (_, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Welcome(),
        );
      }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
