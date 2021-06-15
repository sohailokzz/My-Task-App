import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback saveTask;
  const TaskForm({
    Key key,
    this.title = '',
    this.description = '',
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    @required this.saveTask,
  }) : super(key: key);

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          style: TextStyle(fontSize: 18.0),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: 'Title',
            labelStyle: TextStyle(fontSize: 18.0),
          ),
          validator: (title) {
            if (title.isEmpty) {
              return "This can't be empty";
            }
            return null;
          },
          initialValue: widget.title,
          onChanged: widget.onChangedTitle,
          textCapitalization: TextCapitalization.sentences,
        ),
        SizedBox(
          height: 15.0,
        ),
        TextFormField(
          maxLines: 2,
          style: TextStyle(fontSize: 18.0),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: 'Description',
            labelStyle: TextStyle(fontSize: 18.0),
          ),
          validator: (input) =>
              input.trim().isEmpty ? 'Please Enter Task Description' : null,
          initialValue: widget.description,
          onChanged: widget.onChangedDescription,
          textCapitalization: TextCapitalization.sentences,
        ),
        SizedBox(
          height: 15.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          height: 50.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: FlatButton(
            onPressed: widget.saveTask,
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }
}
