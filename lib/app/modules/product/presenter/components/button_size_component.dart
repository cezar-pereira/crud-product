import 'package:crud_products/app/modules/home/domain/entities/size_product_entity.dart';
import 'package:flutter/material.dart';

class ButtonSizeComponent extends StatelessWidget {
  final VoidCallback onTap;
  final SizeProductEntity size;
  const ButtonSizeComponent({Key? key, required this.onTap, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: size.available ? Colors.green : Colors.black12),
        child: Text(size.size),
      ),
    );
  }
}
