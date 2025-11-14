import 'package:bloc_mimarisi/seviye3/model/user_model.dart';
import 'package:bloc_mimarisi/seviye3/page/home/home_view_model.dart';
import 'package:bloc_mimarisi/seviye3/page/kisi_ekle/kisi_ekle.dart';
import 'package:bloc_mimarisi/seviye3/page/kisi_sil_guncelle/kisi_sil_guncelle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../seviye2/cubit/swc_cubit.dart';
import '../../cubit/get_user.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with HomeViewModel{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kişiler')),
      body: Center(
        child: BlocBuilder<GetUserCubit, List<UserModel>>(
          builder: (context, state) {
            if (state.isNotEmpty) {
              return ListView.builder(
                itemCount: state.length,
                itemBuilder: (context, index) {
                  UserModel item = state[index];
                  return Card(
                    color: Colors.amberAccent,
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>KisiSilGuncelle(userModel: item)));
                      },
                      title: Text(state[index].userName),
                      subtitle: Text(state[index].userNumber),
                    ),
                  );
                },
              );
            } else {
              return Text('Görüntülenecek kişi yoktur.');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KisiEkleSayfasi()),
          );
        },
        child: const Icon(Icons.group_add_sharp, color: Colors.amber),
      ),
    );
  }
}
