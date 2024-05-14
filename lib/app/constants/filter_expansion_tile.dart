import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FilterExpansionTile extends StatelessWidget {
  const FilterExpansionTile({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    RxBool widgetExpanded = false.obs;
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: EdgeInsets.symmetric(vertical: 5),
            title: Text(
              title,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            trailing: Obx(() => widgetExpanded.value == false
                ? Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.yellow,
                    size: 30,
                  )
                : Icon(
                    Icons.keyboard_arrow_up_sharp,
                    color: Colors.yellow,
                    size: 30,
                  )),
            onExpansionChanged: (bool expanded) {
              widgetExpanded.value = expanded;
            },
            children: children,
          ),
        ),
        const Divider(color: Colors.grey),
      ],
    );
  }
}
