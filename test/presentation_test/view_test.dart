import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_test/bloc/graphql_bloc.dart';
import 'package:graphql_test/domain/motty_models.dart';
import 'package:graphql_test/service/graphql_services_implementation.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<GraphqlBloc, GraphqlState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Center(
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: state.mutableList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Row(
                              children: [
                                Text(state.mutableList[index].name),
                                const Spacer(),
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.network(
                                    state.mutableList[index].image,
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<GraphqlBloc>().add(CounterBlocGraphqlApiCallEvent());
        }, //_incrementCounter, // CounterBlocGraphqlApiCallEvent
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
