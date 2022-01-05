import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_todo_app1/create_todo_view.dart';
import 'package:my_todo_app1/utilities.dart';

import 'create_todo_view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Map<String, dynamic>> completedTask = [];

  final List<Map<String, dynamic>> mydatabase = [
    {
      'title': 'Plan trip to Accra',
      'description': 'I will be going to Accra',
      'time': 'Yesterday',
      'isCompleted': false
    },
    {
      'title': 'Work on final flutter project',
      'description': 'Submit final project before 28 of this month',
      'time': 'Tomorrow',
      'isCompleted': true
    },
    {
      'title': 'Grade assignment',
      'description': 'Grade the assignment before the ending of December',
      'time': 'Today',
      'isCompleted': true
    }
  ];

  @override
  Widget build(BuildContext context) {
    for (var element in mydatabase) {
      if (element['isCompleted'] == true) {
        completedTask.add(element);
      }
    }
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 243, 243, 1),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Center(
              child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1637361890611-69854d19360e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
          )),
          title: const Text(
            "My Task",
            style: TextStyle(color: Colors.black),
          ),
          actions: const [
            Icon(Icons.filter_list, color: Colors.black),
            Icon(Icons.search, color: Colors.black),
          ]),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return TodoWidget(
                task: mydatabase[index]['title'],
                description: mydatabase[index]['description'],
                time: mydatabase[index]['time']);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
          itemCount: mydatabase.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return  CreateToDo();
          }));
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        // This is the card at the bottom of the home page showing
        // the completed task and the number of completed task
        child: InkWell(
          onTap: () {
            // this is the bottom sheet that displays our completed task
            showBarModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return TodoWidget(
                            task: completedTask[index]['title'],
                            description: completedTask[index]['description'],
                            time: completedTask[index]['time']);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: completedTask.length);
                });
          },
          child: Card(
            color: const Color.fromRGBO(220, 229, 238, 1),
            // color: Colors.blue[50],
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  const Icon(Icons.check_circle),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("Completed"),
                  const SizedBox(
                    width: 3,
                  ),
                  const Icon(Icons.arrow_drop_down),
                  const Spacer(),
                  Text(completedTask.length.toString())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// this is the widget that contains the todo task
class TodoWidget extends StatelessWidget {
  const TodoWidget({
    Key? key,
    required this.task,
    required this.description,
    required this.time,
  }) : super(key: key);
// this is the variable for the title
  final String task;
  final String description;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Card(
        elevation: 10,
        child: ListTile(
          leading: Icon(
            Icons.check_circle_outline,
            color: paint(time),
          ),
          title: Text(task),
          subtitle: Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.notifications,
                color: paint(time),
              ),
              Text(
                time,
                style: TextStyle(
                  color: paint(time),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
