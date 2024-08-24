import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'SampleBloc/MyBloc.dart';
import 'SampleBloc/MyBlocEvent.dart';
import 'SampleBloc/MyBlocState.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BLoC Example")),
      body: BlocBuilder<MyBloc, MyBlocState>(
        builder: (context, state) {
          if (state is MyStateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MyStateLoaded) {
            return Center(child: Text(state.data));
          } else if (state is MyStateError) {
            return Center(child: Text("Error: ${state.error}"));
          }
          return const Center(child: Text("Press the button to load data"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<MyBloc>().add(MyEventStarted());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}