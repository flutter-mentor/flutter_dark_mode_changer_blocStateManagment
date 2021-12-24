import 'package:bloc/bloc.dart';
import 'package:dark_mode/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModeChangerCubit extends Cubit<ModeChangerStates> {
  static ModeChangerCubit get(context) => BlocProvider.of(context);
  ModeChangerCubit() : super(ModeChangerInitailState());
  bool isDark = false;
  void changeMode() {
    isDark = !isDark;
    emit(ModeChangeState());
  }
}
