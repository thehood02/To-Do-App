import 'package:flutter/material.dart';

class DailyTasks extends StatefulWidget {
  @override
  createState() => new DailyTasksState();
}

class DailyTasksState extends State<DailyTasks> {
  List<String> _dailyTaskItems = [];

  void _addTaskItem(String task) {
    if (task.length > 0) {
      setState(() => _dailyTaskItems.add(task));
    }
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text('Daily Tasks')),
      body: _buildDailyTaskList(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _pushAddTaskScreen,
          tooltip: 'Add task',
          child: new Icon(Icons.add)),
    );
  }

  void _pushAddTaskScreen() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(title: new Text('Add a new task')),
          body: new TextField(
            autofocus: true,
            onSubmitted: (val) {
              _addTaskItem(val);
              Navigator.pop(context);
            },
            decoration: new InputDecoration(
                hintText: 'Enter something to do...',
                contentPadding: const EdgeInsets.all(16.0)),
          ));
    }));
  }

  Widget _buildDailyTaskList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if (index < _dailyTaskItems.length) {
          return _buildDailyTaskItem(_dailyTaskItems[index], index);
        }
      },
    );
  }

  Widget _buildDailyTaskItem(String taskText, int index) {
    return new ListTile(
      title: new Text(taskText),
      onTap: () => _promptRemoveTaskItem(index),
    );
  }

  void _removeTaskItem(int index) {
    setState(() => _dailyTaskItems.removeAt(index));
  }

  void _promptRemoveTaskItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text('Mark "${_dailyTaskItems[index]}" as done?'),
              actions: <Widget>[
                new TextButton(
                    child: new Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop()),
                new TextButton(
                    child: new Text('Mark As Done'),
                    onPressed: () {
                      _removeTaskItem(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }
}
