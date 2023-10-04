import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tugas_api/models/contact_model.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final Dio dio = Dio();
  ContactBloc() : super(ContactInitial()) {
    on<AddContact>((event, emit) async {
      String url =
          "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts";
      try {
        Response res = await dio.post(
          url,
          data: {
            "name": event.contact.name,
            "phone": event.contact.phone,
          },
        );
      } catch (err) {
        print(err);
      }
    });
  }
}
