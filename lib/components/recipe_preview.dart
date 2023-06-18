import 'package:apetit/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';

class RecipePreview extends StatelessWidget {
  //take as argument a title and an image
  //display the title and the image
  final String title;
  final String image;

  const RecipePreview({Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/recipe', arguments: title),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          bottom: MediaQuery.of(context).size.height * 0.06,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.white
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect (
                  borderRadius: BorderRadius.all(
                    Radius.circular(MediaQuery.of(context).size.width * 0.07),
                  ),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(image),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}