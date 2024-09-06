import 'package:flutter/material.dart';
import 'package:vep_news/SharedPreferencesUtils.dart';

import 'MyNewsPage.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            TextField(
              controller: myController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Your Name',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  SharedPreferencesUtils.saveStringValue(
                      "userName", myController.text);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyNewsPage()),
                  );
                },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
