import 'package:crud_products/app/modules/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardProductComponent extends StatelessWidget {
  final ProductEntity product;
  const CardProductComponent({Key? key, required this.product})
      : super(key: key);

  final double border = 10;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.maxFinite,
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: product.image.isEmpty
                ? const Icon(Icons.broken_image_rounded,
                    size: 100, color: Colors.black45)
                : ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(border),
                        topLeft: Radius.circular(border)),
                    child: Hero(
                        tag: product.image,
                        child: Image.network(product.image)),
                  ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, maxLines: 2),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: product.actualPrice < product.regularPrice,
                          child: Text(
                            'R\$ ${(product.regularPrice).toStringAsFixed(2)}',
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.black45),
                          ),
                        ),
                        Text('R\$ ${(product.actualPrice).toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                  Text('ATÉ ${product.installments}'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
