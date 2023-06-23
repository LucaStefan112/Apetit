import 'package:apetit/entities/recipe.dart';
import 'package:apetit/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';

class RecipeDetails extends StatelessWidget {
  final Recipe? recipe;

  const RecipeDetails({Key? key,
    this.recipe
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  recipe!.name,
                  style: const TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.white,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // add a description
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  bottom: MediaQuery.of(context).size.height * 0.02,
                ),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 1,
                color: CustomColors.white,
              ),
              const Text(
                'Description:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.white
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  recipe!.description,
                  style: const TextStyle(
                    fontSize: 20,
                    color: CustomColors.white,
                  ),
                  maxLines: 20,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  bottom: MediaQuery.of(context).size.height * 0.02,
                ),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 1,
                color: CustomColors.white,
              ),
              const Text(
                'Ingredients:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.white
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              for (var ingredient in recipe!.ingredients)
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    bottom: MediaQuery.of(context).size.height * 0.02,
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Text(
                          ingredient['name'],
                          style: const TextStyle(
                            fontSize: 20,
                            color: CustomColors.white,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Text(
                          '${ingredient['quantity']}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: CustomColors.white,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  bottom: MediaQuery.of(context).size.height * 0.02,
                ),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 1,
                color: CustomColors.white,
              ),
              const Text(
                'Steps:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.white
                ),
              ),
              for (var step in recipe!.steps)
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    bottom: MediaQuery.of(context).size.height * 0.02,
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Text(
                          '${recipe!.steps.indexOf(step) + 1}.',
                          style: const TextStyle(
                            fontSize: 20,
                            color: CustomColors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          step,
                          style: const TextStyle(
                            fontSize: 20,
                            color: CustomColors.white,
                          ),
                          textAlign: TextAlign.justify
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        )
    );
  }
}