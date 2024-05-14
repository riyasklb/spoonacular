import 'package:flutter/material.dart';

class CheckBoxWithTitle extends StatelessWidget {
  const CheckBoxWithTitle({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.orange,
              side: const BorderSide(color: Colors.grey, width: 1.4),
              value: isSelected,
              onChanged: (bool? value) {
                onTap();
              })
        ],
      ),
    );
  }
}
