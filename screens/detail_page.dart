import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gap/gap.dart';
import 'package:my_riverpod_practice/constants/themes.dart';
import 'package:my_riverpod_practice/controller/item_bag_controller.dart';
import 'package:my_riverpod_practice/controller/product_controller.dart';
import 'package:my_riverpod_practice/models/product_model.dart';
import 'package:my_riverpod_practice/screens/cart_page.dart';
import 'package:my_riverpod_practice/screens/home_page.dart';
import '../widgets/product_card.dart';

class DetailPage extends ConsumerWidget {
  DetailPage({super.key, required this.getIndex});

  int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final product = ref.watch(productNotifierProvider);
    final itemBag = ref.watch(itemBagProvider);
    final detaiPageItem = product[getIndex];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: const Text('Details Pages'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: Badge(
              label: Text(itemBag.length.toString()),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.local_mall),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              color: kLightBackground,
              child: Image.asset(product[getIndex].imgUrl),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product[getIndex].title,
                    style: AppTheme.kBigTitle.copyWith(color: kPrimaryColor),
                  ),
                  const Gap(12),
                  Row(
                    children: [
                      RatingBar(
                        itemSize: 20,
                        initialRating: 1,
                        minRating: 1,
                        maxRating: 5,
                        allowHalfRating: true,
                        ratingWidget: RatingWidget(
                          full: const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          half: const Icon(Icons.star_half_sharp,
                              color: Colors.amber),
                          empty: const Icon(
                            Icons.star_border,
                            color: Colors.amber,
                          ),
                        ),
                        onRatingUpdate: (value) => null,
                      ),
                      const Gap(12),
                      const Text('125 review'),
                    ],
                  ),
                  const Gap(8),
                  Text(product[getIndex].longDescription),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product[getIndex].price * product[getIndex].qty}',
                        style: AppTheme.kHeadingOne,
                      ),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                ref
                                    .read(productNotifierProvider.notifier)
                                    .decreaseQty(product[getIndex].pid);
                              },
                              icon: const Icon(
                                Icons.do_not_disturb_on_outlined,
                                size: 30,
                              ),
                            ),
                            Text(
                              product[getIndex].qty.toString(),
                              style: AppTheme.kCardTitle,
                            ),
                            IconButton(
                              onPressed: () {
                                ref
                                    .read(productNotifierProvider.notifier)
                                    .incrementQty(product[getIndex].pid);
                              },
                              icon: const Icon(
                                Icons.add_circle_outline,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      ref
                          .read(productNotifierProvider.notifier)
                          .isSelectItem(detaiPageItem.pid, getIndex);

                      if (detaiPageItem.isSelected == false) {
                        ref.read(itemBagProvider.notifier).addNewItemToitemBag(
                            ProductModel(
                                pid: detaiPageItem.pid,
                                imgUrl: detaiPageItem.imgUrl,
                                title: detaiPageItem.title,
                                price: detaiPageItem.price,
                                shortDescription:
                                    detaiPageItem.shortDescription,
                                longDescription: detaiPageItem.longDescription,
                                reviews: detaiPageItem.reviews,
                                rating: detaiPageItem.rating));
                      }
                    },
                    child: const Text('Add item to bag'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) =>
            ref.read(currentIndexProvider.notifier).update((state) => value),
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kSecondaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorite',
            activeIcon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'Location',
            activeIcon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notification',
            activeIcon: Icon(Icons.notifications),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
