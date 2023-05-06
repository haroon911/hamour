import 'package:flutter/material.dart';

class ProductThumbnail extends StatelessWidget {
  const ProductThumbnail({super.key});
  // final Product product;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 250,
      width: size.width,
      child: GridView(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: size.width / 2 - 10,
            maxCrossAxisExtent: 375,
            childAspectRatio: 12 / 13,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        children: [
          ...List.generate(
              8,
              (index) => Container(
                    constraints:
                        const BoxConstraints.expand(height: 350, width: 25),
                    child: Column(
                      children: [
                        Expanded(
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Ink.image(
                              image: AssetImage(
                                  "assets/images/product_item_images/col1.jpg"),
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0)
                              .copyWith(top: 5, bottom: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                " product.about",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                '\${product.productItem.first.price} ريال',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
        ],
      ),
    );
  }
}


/*


 */