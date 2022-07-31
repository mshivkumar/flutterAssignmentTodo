import 'package:flutter/material.dart';
import 'package:flutter_assignment_todo/screens/add_task_screen.dart';
import 'package:flutter_assignment_todo/utils/colors.dart';
import 'package:flutter_assignment_todo/utils/text_styles.dart';
import '../widgets/page_view_widget.dart';
import 'search_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: APPColors.kcWhite,
        body: Container(
          height: MediaQuery.of(context).size.height * 1.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'TODO',
                            style: AppTypography.kGilroyBoldGeneric(
                                fontSize: 60, color: APPColors.kcDarkGrey),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Hero(
                          tag: 'search',
                          child: TextButton.icon(
                              onPressed: () {
                                Navigator.of(context).pushNamed(SearchScreen.routeName);
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(
                                      color: APPColors.kcGraphSecondary,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                              icon: const Icon(
                                Icons.search,
                                color: APPColors.kcDarkGrey,
                              ),
                              label: Text(
                                'Search',
                                style: AppTypography.kNunitoSemiBold14(),
                              )),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: double.infinity,
                child: const PageViewWidget(),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AddTaskScreen.routeName);
          },
          backgroundColor: APPColors.kcOrange,
          child: const Icon(
            Icons.add,
            size: 25.0,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
