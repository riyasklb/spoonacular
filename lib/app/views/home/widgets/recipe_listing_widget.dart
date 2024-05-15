import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:like_button/like_button.dart';
import 'package:spoonacular/app/controllers/recipes_controller.dart';
import 'package:spoonacular/app/model/recipe_model.dart';
import 'package:svg_flutter/svg.dart';

Padding recipeListingWidget({
  required BuildContext context,
  required String image,
  required bool isAssetImage,
  required String title,
  required int cookingTime,
  required double score,
  required int rating,
  required bool isLiked,
  required void Function() onTap,
  required List<EdIngredient> recipeIngredients,
  required Future<bool?> Function(bool)? likeTap,
}) {
// Define the availableItems and missingItems lists

// Iterate over pantryItems and check if they are in requiredItems

  return Padding(
    padding: EdgeInsets.only(
      bottom: 15,
    ),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: 210,
        width: 1,
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15,
          ),
          image: DecorationImage(
            image: isAssetImage
                ? AssetImage(
                    image,
                  )
                : CachedNetworkImageProvider(
                    image,
                  ) as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: -10,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                iconImage,
                width: 1,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.9),
                  BlendMode.srcIn,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 10,
                          ),
                          child: Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 17,
                        backgroundColor: Colors.white,
                        child: LikeButton(
                          likeBuilder: (isLiked) {
                            return isLiked
                                ? Icon(Icons.favorite,
                                    size: 24, color: Colors.red)
                                : Icon(
                                    Icons.favorite,
                                    size: 24,
                                    color: Colors.grey,
                                  );
                          },
                          isLiked: isLiked,
                          onTap: likeTap,
                          animationDuration: Duration.zero,
                          countPostion: CountPostion.top,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.timer,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${cookingTime.toString()} Mins",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
