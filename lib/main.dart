import 'dart:io';

import 'package:bloc_mimarisi/seviye1/cubit/giris_cubit.dart';
import 'package:bloc_mimarisi/seviye2/cubit/swc_cubit.dart';
import 'package:bloc_mimarisi/seviye2/cubit/user_cubit.dart';
import 'package:bloc_mimarisi/seviye2/page/log.dart';
import 'package:bloc_mimarisi/seviye3/cubit/get_user.dart';
import 'package:bloc_mimarisi/seviye3/model/user_model.dart';
import 'package:bloc_mimarisi/seviye3/page/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  //User veri tabani
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('dbuser');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => GirisCubit()),
        BlocProvider(create: (BuildContext context) => SwcCubit()),
        BlocProvider(create: (BuildContext context) => UserCubit()),
        BlocProvider(create: (BuildContext context) => GetUserCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const Home(),
      ),
    );
  }
}
