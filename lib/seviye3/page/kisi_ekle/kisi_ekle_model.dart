import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/get_user.dart';
import '../home/home.dart';
import 'kisi_ekle.dart';

mixin KisiEkleViewModel on State<KisiEkleSayfasi>{
  var nameController = TextEditingController();
  var numberController = TextEditingController();
 kaydetButonClick()  {
   context.read<GetUserCubit>().saveUser(nameController.text, numberController.text);
   Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
 }
}