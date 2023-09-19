import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_12/bloc/bloc/counter_bloc.dart';
import 'package:tugas_12/bloc/bloc/counter_event.dart';
import 'package:tugas_12/bloc/bloc/counter_state.dart';
import 'package:tugas_12/components/drawer_global.dart';

class BlocScreen extends StatefulWidget {
  const BlocScreen({super.key});

  @override
  State<BlocScreen> createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter BLoC"),
        centerTitle: true,
      ),
      drawer: const DrawerGlobal(),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${state.value}"),
                FilledButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(Increment());
                  },
                  child: const Text("Increment"),
                ),
                FilledButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(Decrement());
                  },
                  child: const Text("Decrement"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
