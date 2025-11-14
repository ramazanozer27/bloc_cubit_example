import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/swc_cubit.dart';
import '../cubit/user_cubit.dart';
import '../model/user_model.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Home Screen')),
      body: Center(
        child: BlocBuilder<UserCubit, UserModel?>(
          builder: (context, state) {
            if (state != null) {
              return Card(
                color: context.read<SwcCubit>().state == false
                    ? Colors.red
                    : Colors.blue,
                child: ListTile(
                  title: Text(state.name),
                  subtitle: Text(state.password),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
