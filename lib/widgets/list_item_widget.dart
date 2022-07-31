import 'package:flutter/material.dart';
import 'package:flutter_assignment_todo/utils/colors.dart';
import 'package:flutter_assignment_todo/utils/text_styles.dart';

import '../models/task.dart';

class ListItemWidget extends StatefulWidget {
  final Task task;

  const ListItemWidget({required this.task, Key? key}) : super(key: key);

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: APPColors.kcGraphPrimary.withOpacity(0.1),
                radius: 30,
                child: Icon(
                  Icons.task_outlined,
                  color: APPColors.kcGraphSecondary.withOpacity(0.5),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.task.title ?? '',
                    style: AppTypography.kNunitoBold14(),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    widget.task.description ?? '',
                    style: AppTypography.kNunitoSemiBold14(),
                  ),
                ],
              ),
              Checkbox(
                checkColor: Colors.white,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                activeColor: APPColors.kcGraphPrimary.withOpacity(0.6),
                value: _isChecked,
                shape: const CircleBorder(),
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
