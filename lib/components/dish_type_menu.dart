import 'package:apetit/utils/custom_colors.dart';
import 'package:apetit/utils/dish_types.dart';
import 'package:flutter/cupertino.dart';

import '../utils/routes.dart';
import 'buttons/action_image.dart';

class DishTypeMenu extends StatelessWidget {
  const DishTypeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Main Course',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CustomColors.secondary
          )
        ),
        const SizedBox(height: 5),
        ActionImage(
          onClick: () => Navigator.of(context).pushNamed(Routes.generateRecipe, arguments: DishTypes.mainCourse),
          iconPath: 'assets/images/main-course.png',
          size: MediaQuery.of(context).size.width * 0.22,
          paddingTop: MediaQuery.of(context).size.width * 0.03,
          paddingBottom: MediaQuery.of(context).size.width * 0.03,
          withShadow: true,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.027),
        const Text('Snack',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CustomColors.secondary
          )
        ),
        const SizedBox(height: 5),
        ActionImage(
          onClick: () => Navigator.of(context).pushNamed(Routes.generateRecipe, arguments: DishTypes.snack),
          iconPath: 'assets/images/snack.png',
          size: MediaQuery.of(context).size.width * 0.22,
          paddingTop: MediaQuery.of(context).size.width * 0.04,
          paddingBottom: MediaQuery.of(context).size.width * 0.04,
          withShadow: true,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.027),
        const Text('Dessert',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CustomColors.secondary
          )
        ),
        const SizedBox(height: 5),
        ActionImage(
          onClick: () => Navigator.of(context).pushNamed(Routes.generateRecipe, arguments: DishTypes.dessert),
          iconPath: 'assets/images/dessert.png',
          size: MediaQuery.of(context).size.width * 0.22,
          paddingTop: MediaQuery.of(context).size.width * 0.027,
          paddingBottom: MediaQuery.of(context).size.width * 0.04,
          withShadow: true,
        ),
      ],
    );
  }
}
