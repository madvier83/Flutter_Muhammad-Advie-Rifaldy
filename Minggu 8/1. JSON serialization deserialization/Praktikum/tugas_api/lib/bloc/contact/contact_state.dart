part of 'contact_bloc.dart';

@immutable
sealed class ContactState extends Equatable {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final String req = "";
  final String res = "";

  @override
  List<Object> get props => [
        nameController,
        phoneController,
        req,
        res,
      ];
}

final class ContactInitial extends ContactState {}
