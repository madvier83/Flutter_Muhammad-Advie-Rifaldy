import 'package:equatable/equatable.dart';

abstract class PhoneRecomendationState extends Equatable {
  @override
  List<Object> get props => [];
}

class PhoneRecomendationInitial extends PhoneRecomendationState {}
class PhoneRecomendationLoading extends PhoneRecomendationState {}

class PhoneRecomendationSuccess extends PhoneRecomendationState {
  final String result;
  PhoneRecomendationSuccess({required this.result});
}
