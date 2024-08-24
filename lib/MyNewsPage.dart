import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'NewsBloc/NewsBloc.dart';
import 'NewsBloc/NewsEvent.dart';
import 'NewsBloc/NewsState.dart';

class MyNewsPage extends StatelessWidget {
  const MyNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewsLoaded) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                final article = state.articles[index];
                return ListTile(
                  leading: article.urlToImage != null
                      ? Image.network(article.urlToImage)
                      : null,
                  title: Text(article.title),
                  subtitle: Text(article.description),
                );
              },
            );
          } else if (state is NewsError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Press button to load news'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           context.read<NewsBloc>().add(FetchNews());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}