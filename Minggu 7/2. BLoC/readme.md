# Flutter State Management (BLoC)

Untuk menggunakan BLoC diperlukan 2 dependency, yaitu flutter_bloc dan equatable.

struktur bloc biasa menggunakan 3 file, yaitu bloc, event dan state

contoh file state
```
import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int value;
  const CounterState({required this.value});

  @override
  List<Object?> get props => [value];
}
```

contoh event
```
import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class Increment extends CounterEvent {}
class Decrement extends CounterEvent {}
```

contoh BLoC
```
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(value: 0)) {
    on<Increment>(
      (event, emit) => emit(
        CounterState(value: state.value + 1),
      ),
    );
    on<Decrement>(
      (event, emit) => emit(
        CounterState(value: state.value - 1),
      ),
    );
  }
}
```

Sama seperti provider kita harus mendaftarkan dulu bloc yang sudah dibuat ke aplikasi.
```
Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<ContactBloc>(create: (context) => ContactBloc())
      ],
      child: MaterialApp(),
    );
  }
```

Property dan method yang sudah didaftarkan dapat dipakai di semua widget dengan membungkus widget dengan BlocBuilder
```
body: BlocBuilder<CounterBloc, CounterState>( //BlocBuilder
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${state.value}"), // penggunaan state
                FilledButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(Increment()); // penggunaan method
                  },
                  child: const Text("Increment"),
                ),
                FilledButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(Decrement()); // penggunaan method
                  },
                  child: const Text("Decrement"),
                ),
              ],
            ),
          );
        },
      ),
```