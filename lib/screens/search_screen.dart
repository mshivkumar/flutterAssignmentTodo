import 'package:flutter/material.dart';
import 'package:flutter_assignment_todo/utils/colors.dart';
import 'package:flutter_assignment_todo/view_models/task_list_view_model.dart';
import 'package:flutter_assignment_todo/view_models/task_view_model.dart';
import 'package:flutter_assignment_todo/widgets/list_item_widget.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchController;
  late TaskListViewModel _taskListVM;
  late List<TaskViewModel> _allTasksVM = _taskListVM.allTasks;

  @override
  void initState() {
    super.initState();
    _taskListVM = Provider.of<TaskListViewModel>(context, listen: false);
    _taskListVM.getAllTasks();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // _allTasksVM = _taskListVM.allTasks;
    return SafeArea(
      child: Hero(
        tag: 'search',
        child: Scaffold(
          body: SingleChildScrollView(
            child: Consumer<TaskListViewModel>(
              builder: (BuildContext ctx, TaskListViewModel taskListVM, _) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 1.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: APPColors.kcGraphSecondary,
                                ),
                              )),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              child: TextField(
                                controller: _searchController,
                                style: const TextStyle(fontSize: 18.0),
                                onChanged: searchTask,
                                decoration: InputDecoration(
                                    hintText: 'Search',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: APPColors.kcGraphPrimary
                                          .withOpacity(0.5),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        _searchController.clear();
                                      },
                                      icon: Icon(
                                        Icons.clear,
                                        color: APPColors.kcGraphPrimary
                                            .withOpacity(0.5),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                          child: ListView.builder(
                        itemCount: _allTasksVM.length,
                        itemBuilder: (ctx, index) {
                          return ListItemWidget(
                            taskVM: _allTasksVM[index],
                            isCalledFromSearch: true,
                          );
                        },
                      ))
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void searchTask(String query) {
    final suggestions = _taskListVM.allTasks.where((task) {
      final taskTitle = task.title.toLowerCase().trim();
      final input = query.toLowerCase().trim();
      return taskTitle.contains(input);
    }).toList();
    setState(() => _allTasksVM = suggestions);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.clear();
  }
}
