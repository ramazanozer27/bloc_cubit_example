import 'package:bloc_mimarisi/seviye1/cubit/giris_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GirisPage extends StatelessWidget {
  const GirisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text(),
            ElevatedButton(onPressed: (){
              context.read<GirisCubit>().azalt();
            }, child: Text('Azalt'))
          ],
        )),
        floatingActionButton:FloatingActionButton(onPressed: (){
         context.read<GirisCubit>().arttir();
        })
   );

  }

  BlocBuilder<GirisCubit, int> text() {
    return BlocBuilder<GirisCubit,int>(
            builder: (context,state){
              return Text(state.toString(),style: Theme.of(context).textTheme.headlineSmall,);
            },
          );
  }
}
