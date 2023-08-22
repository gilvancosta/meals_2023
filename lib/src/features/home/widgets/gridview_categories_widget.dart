import 'package:flutter/material.dart';
import 'package:meals_2023/src/core/data/dummy_data.dart';
import 'package:meals_2023/src/features/home/widgets/category_item_widget.dart';

class GridViewCategoriesWidget extends StatelessWidget {
  const GridViewCategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: dummyCategories.map((cat) {
        return CategoryItemWidget(cat);
      }).toList(),
    );
  }
}
