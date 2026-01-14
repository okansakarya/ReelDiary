import 'package:flutter_bloc/flutter_bloc.dart';

class KvkkCheckBoxCubit extends Cubit<bool>{
  KvkkCheckBoxCubit() : super(false);
  void toggleCheck() => emit(!state);
}