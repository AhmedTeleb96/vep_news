import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vep_news/SharedPreferencesUtils.dart';
import 'NewsBloc/NewsBloc.dart';
import 'NewsBloc/NewsEvent.dart';
import 'NewsBloc/NewsState.dart';

class MyNewsPage extends StatelessWidget {
   MyNewsPage();

  final userName = SharedPreferencesUtils.loadStringValue("userName");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome $userName'),
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
                  leading:  article.urlToImage != null
                      ? Image.network(article.urlToImage!)
                      : Image.network('https://fastly.picsum.photos/id/870/200/300.jpg?blur=2&grayscale&hmac=ujRymp644uYVjdKJM7kyLDSsrqNSMVRPnGU99cKl6Vs'),
                  title: Text(article.title),
                  subtitle: Text(article.description ?? 'No description available.'),
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