import 'package:equatable/equatable.dart';
import 'package:tugas_12/models/contact_model.dart';

class ContactState extends Equatable {
  final List<Contact> value;
  const ContactState({required this.value});

  @override
  List<Object?> get props => [value];
}
