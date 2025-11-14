import 'dart:io';

import 'package:bloc_mimarisi/seviye2/cubit/swc_cubit.dart';
import 'package:bloc_mimarisi/seviye2/cubit/user_cubit.dart';
import 'package:bloc_mimarisi/seviye2/model/user_model.dart';
import 'package:bloc_mimarisi/seviye2/page/user_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/widget/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var nameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seviye 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SbtTextField(controller: nameController, label: 'Name'),
            const SizedBox(height: 20),
            SbtTextField(controller: passwordController, label: 'Password'),
            BlocBuilder<SwcCubit, bool>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    state ? const Text('Admin') : const Text('Person'),
                    Switch(
                      value: state,
                      onChanged: (value) {
                        context.read<SwcCubit>().durumDegistir();
                      },
                    ),
                  ],
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  var userModel = UserModel(
                    name: nameController.text,
                    password: passwordController.text,
                  );
                  context.read<UserCubit>().userKaydet(userModel);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserHomeScreen()),
                  );
                } else {}
              },
              child: Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
