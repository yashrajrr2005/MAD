import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "", show = "";

  @override
  Widget build(BuildContext c) => Scaffold(
        appBar: AppBar(title: const Text("Flutter UI")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://images.pexels.com/photos/36430583/pexels-photo-36430583.jpeg',
              height: 150,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image_not_supported, size: 80),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Hello $show",
                  style: const TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                onChanged: (v) => name = v,
                decoration: const InputDecoration(hintText: "Enter name"),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => setState(() => show = name),
              child: const Text("Submit"),
            ),
          ],
        ),
      );
}
