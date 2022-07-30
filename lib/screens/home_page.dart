import 'package:flutter/material.dart';
import 'package:flutter_assignment_todo/utils/colors.dart';
import 'package:flutter_assignment_todo/utils/text_styles.dart';

import '../widgets/page_view_widget.dart';

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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              // color: Colors.red.withOpacity(0.1),
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'TODO',
                  style: AppTypography.kGilroyBoldGeneric(
                      fontSize: 60, color: APPColors.kcDarkGrey),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.yellow.withOpacity(0.1),
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              child: PageViewWidget(),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
