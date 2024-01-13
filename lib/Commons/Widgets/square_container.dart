import 'package:flutter/material.dart';

class SquareContainer extends StatelessWidget {
  final double widthAndHeight;
  final bool? isAddOrRemoveButton;
  final Widget? child;
  const SquareContainer({
    super.key,
    this.isAddOrRemoveButton = false,
    required this.widthAndHeight,
    this.child = const Icon(
      Icons.favorite,
      color: Colors.white,
      size: 22,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthAndHeight,
      height: widthAndHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          25,
        ),
        color: isAddOrRemoveButton! ? Colors.white : Colors.grey.shade400,
      ),
      child: child,
    );
  }
}
