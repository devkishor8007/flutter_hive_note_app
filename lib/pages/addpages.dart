import 'package:flutter/material.dart';
import 'package:hive2021_crud/model/profile_model.dart';
import 'package:hive2021_crud/utilities/usable_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);

  final TextEditingController _name = TextEditingController();
  final TextEditingController _desc = TextEditingController();

  final Box todo = Hive.box<Profile>('myprofilebox');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _name,
                decoration: const InputDecoration(
                  hintText: "name",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _desc,
                decoration: const InputDecoration(
                  hintText: "desc",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                color: Colors.indigo,
                textColor: Colors.white,
                child: const Text('Add'),
                onPressed: () {
                  if (_name.text != '' || _desc.text != '') {
                    Profile newProfile = Profile(
                      name: _name.text,
                      desc: _desc.text,
                      isComplete: false,
                      isDate: DateTime.now(),
                    );
                    todo.add(newProfile);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text("Adding Profile"),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
