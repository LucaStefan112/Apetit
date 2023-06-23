import 'package:flutter/cupertino.dart';

import '../../utils/custom_colors.dart';
import '../buttons/navigation_icon.dart';

class BasicHeader extends StatelessWidget {
  final String title;
  final NavigationIconRoutes route1;
  final NavigationIconRoutes route2;

  const BasicHeader({Key? key,
    required this.title,
    required this.route1,
    required this.route2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.028
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: CustomColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(MediaQuery.of(context).size.width * 0.2),
          bottomRight: Radius.circular(MediaQuery.of(context).size.width * 0.2),
        ),
        boxShadow: const [
          BoxShadow(
            color: CustomColors.secondary,
            offset: Offset(0, 1),
            blurRadius: 10,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigationIcon(
                    route: route1,
                    size: MediaQuery.of(context).size.width * 0.09
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.white,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                NavigationIcon(
                    route: route2,
                    size: MediaQuery.of(context).size.width * 0.09
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}