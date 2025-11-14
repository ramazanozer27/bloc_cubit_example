import 'package:flutter_bloc/flutter_bloc.dart';

class SwcCubit extends Cubit<bool>{

  SwcCubit():super(false);

  durumDegistir()=>emit(!state);

}