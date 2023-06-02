import 'package:apetit/utils/CustomColors.dart';
import 'package:flutter/cupertino.dart';

class RecipeDetails extends StatelessWidget {
  final String title;

  const RecipeDetails({Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.65,
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          bottom: MediaQuery.of(context).size.height * 0.05,
        ),
        decoration: BoxDecoration(
          color: CustomColors.primary,
          borderRadius: BorderRadius.all(
            Radius.circular(MediaQuery.of(context).size.width * 0.07),
          ),
          boxShadow: const [
            BoxShadow(
              color: CustomColors.secondary,
              offset: Offset(0, 1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            const Text(
              'Ingredients:',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.white
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const [
                    Text(
                      'Ingredient 1',
                      style: TextStyle(
                          fontSize: 20,
                          color: CustomColors.white,
                      ),
                    ),
                    Text(
                      'Ingredient 2',
                      style: TextStyle(
                          fontSize: 20,
                          color: CustomColors.white
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      'Ingredient 3',
                      style: TextStyle(
                          fontSize: 20,
                          color: CustomColors.white
                      ),
                    ),
                    Text(
                      'Ingredient 4',
                      style: TextStyle(
                          fontSize: 20,
                          color: CustomColors.white
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const Text(
              'Steps:',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.white
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Column(
              children: const [
                Text(
                  'Step 1',
                  style: TextStyle(
                      fontSize: 20,
                      color: CustomColors.white
                  ),
                ),
                Text(
                  'Step 2',
                  style: TextStyle(
                      fontSize: 20,
                      color: CustomColors.white
                  ),
                ),
                Text(
                  'Step 3',
                  style: TextStyle(
                      fontSize: 20,
                      color: CustomColors.white
                  ),
                ),
                Text(
                  'Step 4',
                  style: TextStyle(
                      fontSize: 20,
                      color: CustomColors.white
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
}