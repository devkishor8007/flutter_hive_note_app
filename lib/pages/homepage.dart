import 'package:flutter/material.dart';
import 'package:hive2021_crud/model/profile_model.dart';
import 'package:hive2021_crud/pages/addpages.dart';
import 'package:hive2021_crud/utilities/usable_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final Box box = Hive.box<Profile>("myprofilebox");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pushRoute(context, widget: AddPage());
          },
          child: const Icon(Icons.add),
        ),
        body: ValueListenableBuilder(
            valueListenable: box.listenable(),
            builder: (context, Box box, widget) {
              if (box.isEmpty) {
                return const Center(child: Text('Empty Profile'));
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      Profile profile = box.getAt(index);
                      return ListTile(
                        title: Text(
                          profile.name,
                          style: TextStyle(
                            decoration: profile.isComplete
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color:
                                profile.isComplete ? Colors.red : Colors.black,
                          ),
                        ),
                        subtitle: Text(profile.desc),
                        leading: Checkbox(
                            value: profile.isComplete,
                            onChanged: (val) {
                              Profile newProfile = Profile(
                                name: profile.name,
                                desc: profile.desc,
                                isComplete: val!,
                                isDate: DateTime.now(),
                              );
                              box.putAt(index, newProfile);
                            }),
                        trailing: IconButton(
                          onPressed: () {
                            box.deleteAt(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 5),
                                content: Text("Delete Successfully!"),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 25),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        profile.isComplete
                                            ? SizedBox(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Complete this Profile Task',
                                                      style: TextStyle(
                                                        fontSize:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .headline6!
                                                                .fontSize,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Please move to other",
                                                      style: TextStyle(
                                                        fontSize:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .headline6!
                                                                .fontSize,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Text(
                                                profile.name,
                                                style: TextStyle(
                                                  fontSize: Theme.of(context)
                                                      .textTheme
                                                      .headline6!
                                                      .fontSize,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                      );
                    });
              }
            }),
      ),
    );
  }
}
