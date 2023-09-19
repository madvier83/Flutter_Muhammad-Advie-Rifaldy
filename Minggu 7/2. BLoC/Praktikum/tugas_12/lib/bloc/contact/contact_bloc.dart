import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_12/bloc/bloc/counter_state.dart';
import 'package:tugas_12/bloc/contact/contact_event.dart';
import 'package:tugas_12/bloc/contact/contact_state.dart';
import 'package:tugas_12/models/contact_model.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(const ContactState(value: [])) {
    on<AddContact>(
      (event, emit) {
        List<Contact> newValue = state.value.toList();
        newValue.add(event.contact);
        emit(ContactState(value: newValue));
      },
    );
    on<DeleteContact>(
      (event, emit) {
        List<Contact> newValue = state.value.toList();
        newValue.removeAt(event.index);
        emit(ContactState(value: newValue));
      },
    );
    on<UpdateContact>(
      (event, emit) {
        List<Contact> newValue = state.value;
        newValue[event.index] = event.contact;
        emit(ContactState(value: newValue));
      },
    );
  }
}
