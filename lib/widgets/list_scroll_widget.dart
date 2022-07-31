import 'package:flutter/material.dart';

import '../screens/task_list_screen.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/text_styles.dart';

class ListScrollWidget extends StatefulWidget {
  const ListScrollWidget({Key? key}) : super(key: key);

  @override
  State<ListScrollWidget> createState() => _ListScrollWidgetState();
}

class _ListScrollWidgetState extends State<ListScrollWidget> {
  void navigate({required NavigateToPage navigateTo}) {
    switch (navigateTo) {
      case NavigateToPage.today:
        {
          Navigator.of(context).pushNamed(TaskListScreen.routeName,
              arguments: {'loadTaskListFor': TaskList.today});
        }
        break;

      case NavigateToPage.tomorrow:
        {
          Navigator.of(context).pushNamed(TaskListScreen.routeName,
              arguments: {'loadTaskListFor': TaskList.tomorrow});
        }
        break;

      default:
        {
          Navigator.of(context).pushNamed(TaskListScreen.routeName,
              arguments: {'loadTaskListFor': TaskList.upcoming});
        }
        break;
    }
  }

  Widget pageWidget({required String title, required Function onPressed}) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: APPColors.kcBlue.withOpacity(0.1),
          height: 200,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: AppTypography.kGilroyBoldGeneric(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Icon(
                  Icons.task_rounded,
                  size: 200,
                  color: APPColors.kcGraphSecondary,
                )
                // Image.asset(
                //   "assets/images/todo.png",
                //   fit: BoxFit.contain,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        pageWidget(
          title: "Today's tasks",
          onPressed: () => navigate(navigateTo: NavigateToPage.today),
        ),
        pageWidget(
          title: "Tomorrow's tasks",
          onPressed: () => navigate(navigateTo: NavigateToPage.tomorrow),
        ),
        pageWidget(
          title: "Upcoming tasks",
          onPressed: () => navigate(navigateTo: NavigateToPage.upcoming),
        ),
      ],
    );
  }
}
