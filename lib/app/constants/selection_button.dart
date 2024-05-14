import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SelectionButton extends StatelessWidget {
  const SelectionButton({
    super.key,
    required this.name,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.isSelected,
    required this.onTap,
  });

  final String name;
  final String activeIcon;
  final String inactiveIcon;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
          border: Border.all(
              color: isSelected == true ? Colors.black : Colors.grey,
              width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    child: isSelected == true
                        ? Image.asset(activeIcon)
                        : Image.asset(inactiveIcon)),
                SizedBox(
                  height: 5,
                ),
                Text(name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 11,
                          fontWeight: isSelected == true
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color:
                              isSelected == true ? Colors.grey : Colors.black,
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
