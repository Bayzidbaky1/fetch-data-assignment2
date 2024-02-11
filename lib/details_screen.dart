import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final title;
  final id;
  final image;
 const DetailsScreen({super.key, this.title, this.id, this.image});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Photo Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(widget.image),
            const SizedBox(height: 15,),
            Text("Title : ${widget.title}"),
            Text("id : ${widget.id}")
          ],
        ),
      ),
    );
  }
}