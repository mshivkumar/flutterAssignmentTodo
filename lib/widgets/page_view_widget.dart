import 'package:flutter/material.dart';
import 'package:flutter_assignment_todo/screens/task_list_screen.dart';
import 'package:flutter_assignment_todo/utils/colors.dart';
import 'package:flutter_assignment_todo/utils/constants.dart';
import 'package:flutter_assignment_todo/utils/text_styles.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  /* todo add to viewmodel */
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
          width: 400,
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
    return PageView(
      allowImplicitScrolling: true,
      controller: _controller,
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
