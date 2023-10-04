part of 'contact_bloc.dart';

@immutable
sealed class ContactEvent {}

class AddContact extends ContactEvent {
  final ContactModel contact;
  AddContact({required this.contact});
}
