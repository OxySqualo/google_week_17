import 'package:flutter/material.dart';
import 'package:google_week_17/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("List of coordinates"),
          centerTitle: true,
        ),
        body: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: mylat?.length ?? 0,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (_, int index) {
              return Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      height: 40,
                      child: Text(
                        mylat?[index] ?? '',
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      height: 40,
                      child: Text(
                        mylong?[index] ?? '',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      tooltip: 'delete',
                      onPressed: () {
                        mylat?.removeAt(index);
                        mylong?.removeAt(index);
                        setState(() {});
                      },
                    ),
                  ],
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
            child: const Text('Map'),
            onPressed: () {
              Navigator.pushNamed(context, '/work');
              setState(() {});
            }));
  }
}
