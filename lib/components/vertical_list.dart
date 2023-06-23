import 'package:apetit/components/buttons/action_image.dart';
import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';
import '../utils/dish_types.dart';

class VerticalList extends StatelessWidget {
  final List<VerticalListItemData> list;

  const VerticalList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: list.isEmpty ? [
          const SizedBox(height: 20,),
          const Text(
            'No recipes found...',
            style: TextStyle(
              color: CustomColors.secondary,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ] : list.map((item) =>
          VerticalListItem(item: item)
        ).toList(),
      ),
    );
  }
}

class VerticalListItem extends StatelessWidget {
  final VerticalListItemData item;

  const VerticalListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => item.onClick(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
        decoration: BoxDecoration(
            color: CustomColors.primary,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
              color: CustomColors.secondary,
                offset: Offset(0, 1),
                blurRadius: 1,
              ),
            ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ActionImage(
              onClick: item.onClick,
              iconPath:
                item.iconType == DishTypes.mainCourse ? 'assets/images/main-course.png' :
                item.iconType == DishTypes.snack ? 'assets/images/snack.png' :
                'assets/images/dessert.png',
              paddingLeft: item.iconType == DishTypes.snack ? 8 : 5,
              paddingRight: item.iconType == DishTypes.snack ? 8 : 5,
            ),
            Expanded(
              child: Text(
                item.title,
                style: const TextStyle(
                  color: CustomColors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerticalListItemData {
  final String title;
  final Function onClick;
  final String iconType;

  VerticalListItemData({
    required this.title,
    required this.onClick,
    required this.iconType
  });
}