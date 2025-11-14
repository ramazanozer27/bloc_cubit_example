import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../seviye3/model/user_model.dart';
import '../../cubit/get_user.dart';
import '../home/home.dart';
import 'kisi_sil_guncelle.dart';

mixin KisiSilGuncelleView on State<KisiSilGuncelle> {
  var nameController = TextEditingController();
  var numberController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController.text=widget.userModel.userName;
    numberController.text=widget.userModel.userNumber;

  }
  guncelleButonClick(){
    var usermodel=UserModel(userId: widget.userModel.userId, userName: nameController.text, userNumber: numberController.text);
    context.read<GetUserCubit>().updateUser(usermodel);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
  }
  silButonClick(){
    context.read<GetUserCubit>().deleteUser(widget.userModel);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
  }
}