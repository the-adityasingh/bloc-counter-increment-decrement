import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc counter',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        body: BlocProvider(
            builder: (BuildContext context) => CounterBloc(),
            child: CounterScreen()),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<CounterBloc, int>(
              builder: (BuildContext context, int state) {
            return Text(
              'Value of counter is : $state',
              style: TextStyle(fontSize: 30),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                key: const Key('fab_increment'),
                child: const Icon(Icons.add),
                onPressed: () {
                  _counterBloc.add(CounterEvents.increment);
                },
              ),
              const SizedBox(width: 8),
              FloatingActionButton(
                key: const Key('fab_decrement'),
                child: const Icon(Icons.remove),
                onPressed: () {
                  _counterBloc.add(CounterEvents.decrement);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
