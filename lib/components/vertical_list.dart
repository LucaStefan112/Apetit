import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';
import 'action_icon.dart';

class VerticalList extends StatelessWidget {
  final List<VerticalListItemData> list;

  const VerticalList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: list.map((item) =>
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
      onPressed: () => Navigator.pushNamed(context, item.route),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 2),
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
            ActionIcon(
              onClick: () => Navigator.pushNamed(context, item.route),
              iconPath:
                item.iconType == IconType.mainDish ? 'assets/images/main-dish.png' :
                item.iconType == IconType.snack ? 'assets/images/snack.png' :
                'assets/images/dessert.png',
              paddingLeft: item.iconType == IconType.snack ? 8 : 5,
              paddingRight: item.iconType == IconType.snack ? 8 : 5,
            ),
            Text(
              item.title,
              style: const TextStyle(
                  color: CustomColors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum IconType {
  mainDish,
  snack,
  dessert
}

class VerticalListItemData {
  final String title;
  final String route;
  final IconType iconType;

  VerticalListItemData({required this.title, required this.route, required this.iconType});
}