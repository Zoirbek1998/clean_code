import 'package:clean_business/bloc/counter_bloc.dart';
import 'package:clean_business/block_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  initializeBlocs();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CounterBloc _counterBloc;

  @override
  void initState() {
    super.initState();
    _counterBloc = GetIt.I.get<CounterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _counterBloc,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(child: _CounterText()),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () =>
                  context.read<CounterBloc>().add(const CounterEvent.reset()),
              tooltip: 'Decrement',
              child: const Icon(Icons.refresh),
            ),
            FloatingActionButton(
              onPressed: () => context
                  .read<CounterBloc>()
                  .add(const CounterEvent.increment()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class _CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = context.watch<CounterBloc>().state;
    return state.when(
      initial: () => const FlutterLogo(size: 120),
      loading: () => const CircularProgressIndicator(),
      loaded: (counter) => Text(
        '${counter.counter}',
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
