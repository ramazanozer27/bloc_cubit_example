import 'package:bloc_mimarisi/seviye3/page/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/get_user.dart';

mixin HomeViewModel on State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetUserCubit>().getAllUsers();
  }
}