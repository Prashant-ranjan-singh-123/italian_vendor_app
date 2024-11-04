import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'regester_state.dart';

class RegesterCubit extends Cubit<RegesterState> {
  RegesterCubit() : super(RegesterInitial());
}
