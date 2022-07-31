import 'package:flutter/material.dart';
import 'package:flutter_assignment_todo/utils/colors.dart';
import 'package:flutter_assignment_todo/utils/text_styles.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Look\'s like your list is empty.',
            style: AppTypography.kGilroyBoldGeneric(
                fontSize: 20, color: APPColors.kcDarkGrey),
          ),
          Icon(
            Icons.edit_note,
            size: 200,
            color: APPColors.kcGraphSecondary.withOpacity(0.4),
          )
        ],
      ),
    );
  }
}
