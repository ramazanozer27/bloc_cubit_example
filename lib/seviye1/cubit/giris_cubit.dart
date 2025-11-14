import 'package:bloc_mimarisi/seviye1/repo/giris_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GirisCubit extends Cubit<int>{
  GirisCubit():super(0);
  var repo = GirisRepo();

   arttir() =>emit(repo.arttir(state));
   azalt() =>emit(repo.azalt(state));
}