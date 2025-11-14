import 'package:bloc_mimarisi/constant/widget/textfield.dart';
import 'package:bloc_mimarisi/seviye3/cubit/get_user.dart';
import 'package:bloc_mimarisi/seviye3/page/home/home.dart';
import 'package:bloc_mimarisi/seviye3/page/kisi_ekle/kisi_ekle_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KisiEkleSayfasi extends StatefulWidget {
  const KisiEkleSayfasi({super.key});

  @override
  State<KisiEkleSayfasi> createState() => _KisiEkleSayfasiState();
}

class _KisiEkleSayfasiState extends State<KisiEkleSayfasi> with KisiEkleViewModel{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kişi Ekle Sayfası')),
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
            ElevatedButton(onPressed: (){
              kaydetButonClick();
            }, child: Text('Kaydet'))
          ],
        ),
      ),
    );
  }
}
