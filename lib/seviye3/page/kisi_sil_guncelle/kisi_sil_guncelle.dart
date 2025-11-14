import 'package:bloc_mimarisi/constant/widget/textfield.dart';
import 'package:bloc_mimarisi/seviye3/cubit/get_user.dart';
import 'package:bloc_mimarisi/seviye3/page/home/home.dart';
import 'package:bloc_mimarisi/seviye3/page/kisi_sil_guncelle/kisi_sil_guncelle_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/user_model.dart';

class KisiSilGuncelle extends StatefulWidget {
  final UserModel userModel;
  const KisiSilGuncelle({super.key,required this.userModel});

  @override
  State<KisiSilGuncelle> createState() => _KisiSilGuncelleState();
}

class _KisiSilGuncelleState extends State<KisiSilGuncelle> with KisiSilGuncelleView{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kişi Sil Güncelle Sayfası')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SbtTextField(controller: nameController, label: 'İsim'),
            SbtTextField(
              controller: numberController,
              label: 'Numaranız',
              klavyeNumber: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),onPressed: (){
                  guncelleButonClick();

                }, child: Text('Güncelle')),
                ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor: Colors.red),onPressed: (){
               silButonClick();
                }, child: Text('Sil')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
