import 'package:flutter/material.dart';
import 'package:flutter_web_template/app/core/widgets/template_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
        body: _body(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint('You clicked');
          },
          child: const Icon(Icons.mouse),
        ));
  }

  Widget _body(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/wallpaper.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          height: 40,
          width: 320,
          color: Color.fromARGB(186, 34, 48, 90),
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 20,
              color: Color(0xFFD4D5D7),
            ),
            child: Center(child: Text("Welcome Page")),
          ),
        ),
      ),
    );
  }
}
