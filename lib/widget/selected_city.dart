import 'package:flutter/material.dart';

class SelectedCity extends StatefulWidget {
  const SelectedCity({Key? key}) : super(key: key);

  @override
  State<SelectedCity> createState() => _SelectedCityState();
}

class _SelectedCityState extends State<SelectedCity> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selected City Form"),
      ),
      body: Form(
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "City",
                  hintText: "City",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context, _controller.text);
                },
                icon: Icon(Icons.search))
          ],
        ),
      ),
    );
  }
}
