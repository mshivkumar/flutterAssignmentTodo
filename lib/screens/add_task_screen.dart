import 'package:flutter/material.dart';
import 'package:flutter_assignment_todo/utils/colors.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  static const routeName = '/add-task-screen';

  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');
  final List<String> _priorities = ['Low', 'Medium', 'High'];
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descController;
  late TextEditingController _dateController;
  String _title = '';
  String _description = '';
  String _priority = 'Low';
  DateTime _date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descController = TextEditingController();
    _dateController = TextEditingController(text: _dateFormatter.format(_date));
  }

  /* TODO goes in VIEWMODEL */
  _handleDatePicker() async {
    DateTime startDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    DateTime endDate = startDate.add(const Duration(days: 10));
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: startDate,
      lastDate: endDate,
    );
    if (date != null) {
      setState(() {
        _date = date;
      });
      _dateController.text = _dateFormatter.format(date);
    }
  }

  /* TODO Goes in VIEWMODEL */
  _submit(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      print('$_title, $_date, $_priority');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: APPColors.kcWhite,
      appBar: AppBar(
        backgroundColor: APPColors.kcWhite,
        foregroundColor: APPColors.kcBlack,
        elevation: 0.0,
        title: const Text('Add'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      controller: _titleController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: const TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: const TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (input) =>
                          input!.trim().isEmpty ? 'Please enter a title' : null,
                      onSaved: (input) => _title = input!,
                      // initialValue: _title,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      controller: _descController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: const TextStyle(fontSize: 18.0),
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: const TextStyle(fontSize: 18.0),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (input) => input!.trim().isEmpty
                          ? 'Please enter a description'
                          : null,
                      onSaved: (input) => _description = input!,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: _dateController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: const TextStyle(fontSize: 18.0),
                      onTap: _handleDatePicker,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        labelStyle: const TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    DropdownButtonFormField(
                      isDense: true,
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      iconSize: 25.0,
                      items: _priorities.map((String priority) {
                        return DropdownMenuItem(
                          value: priority,
                          child: Text(
                            priority,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                        );
                      }).toList(),
                      style: const TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        labelText: 'Priority',
                        labelStyle: const TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (input) => _priority == null
                          ? 'Please select a priority level'
                          : null,
                      onChanged: (value) {
                        setState(() {
                          _priority = value.toString();
                        });
                      },
                      value: _priority,
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    GestureDetector(
                      onTap: _submit,
                      child: Container(
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: APPColors.kcGraphSecondary,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descController.dispose();
    _dateController.dispose();
  }
}
