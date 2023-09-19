import 'package:equatable/equatable.dart';
import 'package:tugas_12/models/contact_model.dart';

abstract class ContactEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddContact extends ContactEvent {
  final Contact contact;
  AddContact({
    required this.contact,
  });
}

class UpdateContact extends ContactEvent {
  final Contact contact;
  final int index;
  UpdateContact({
    required this.index,
    required this.contact,
  });
}

class DeleteContact extends ContactEvent {
  final int index;
  DeleteContact({required this.index});
}
