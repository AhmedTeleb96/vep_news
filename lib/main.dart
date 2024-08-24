import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vep_news/MyNewsPage.dart';
import 'package:vep_news/NewsBloc/NewsBloc.dart';
import 'package:vep_news/Repo/NewsRepository.dart';
import 'package:vep_news/SampleBloc/MyBloc.dart';

import 'MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vep News',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<NewsBloc>(
        create: (BuildContext context) => NewsBloc(NewsRepository()),
        child: const MyNewsPage(),
      )
    );
  }
}

