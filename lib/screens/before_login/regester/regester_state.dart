part of 'regester_cubit.dart';

sealed class RegesterState extends Equatable {
  const RegesterState();
}

final class RegesterInitial extends RegesterState {
  @override
  List<Object> get props => [];
}
