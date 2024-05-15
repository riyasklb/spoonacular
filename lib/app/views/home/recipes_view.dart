import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spoonacular/app/constants/app_constant.dart';
import 'package:spoonacular/app/views/home/widgets/recipe_listing_widget.dart';
import 'package:spoonacular/app/controllers/recipes_controller.dart';
import 'package:spoonacular/app/views/home/fliter_recipe_view.dart';
import 'package:spoonacular/app/views/home/widgets/body_container_arc_widget.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  final controller = Get.find<RecipesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyContainerArcWidget(
        titleText: "Recipes",
        isActionNeeded: true,
        isFlexibleSpaceNeeded: true,
        toolBarHeight: 100,
        flexibleSpace: PreferredSize(
          preferredSize: Size.fromHeight(
            60,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: 86,
              bottom: 18,
              left: 15,
              right: 15,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Obx(
                    () => TextField(
                      controller: controller.searchController.value,
                      textInputAction: TextInputAction.search,
                      onChanged: (query) {
                        controller.searchRecipe(
                          query: query,
                        );
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 20,
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                            top: 2,
                            left: 10,
                            right: 5,
                          ),
                          child: const Icon(
                            Icons.search,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xffD0D2D7),
                            style: BorderStyle.solid,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xffD0D2D7),
                            style: BorderStyle.solid,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xffD0D2D7),
                            style: BorderStyle.solid,
                          ),
                        ),
                        filled: true,
                        hintStyle:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                        hintText: 'Hungry?',
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: () {
                        Get.to(
                          () => const FliterRecipeView(),
                        );
                      },
                      child: Icon(
                        Icons.filter_3_outlined,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            AppConstants.disposeKeyboard();
          },
          child: RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            color: Colors.black,
            backgroundColor: Colors.white,
            strokeWidth: 2,
            onRefresh: () async {
              controller.refreshRecipe();
              controller.isRefreshAllowed(false);
              Future.delayed(
                const Duration(seconds: 2),
                () {
                  controller.isRefreshAllowed(true);
                },
              );
            },
            child: SingleChildScrollView(
              controller: controller.recipeScrollController,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Obx(
                      () => controller.loadingStatus.value ==
                              LoadingStatus.loading
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 250,
                                  ),
                                  Center(
                                    child: Platform.isAndroid
                                        ? CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.grey,
                                          )
                                        : CupertinoActivityIndicator(
                                            color: Colors.grey,
                                            animating: true,
                                            radius: 15,
                                          ),
                                  ),
                                ],
                              ),
                            )
                          : controller.recipeList.isEmpty
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 250,
                                      ),
                                      Text(
                                        "No recipes found",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                      ),
                                    ],
                                  ),
                                )
                              : ListView.builder(
                                  // controller: controller.recipeScrollController,
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount: controller.recipeList.length,
                                  itemBuilder: (context, index) {
                                    final recipe = controller.recipeList[index];

                                    return recipeListingWidget(
                                      context: context,
                                      image: recipe.image ?? iconImage,
                                      isAssetImage:
                                          recipe.image != null ? false : true,
                                      title: recipe.title,
                                      cookingTime: recipe.readyInMinutes,
                                      onTap: () {},
                                      score: recipe.spoonacularScore,
                                      rating: 3,
                                      isLiked: false,
                                      likeTap: (bool liked) async {
                                        print(!liked);
                                        return !liked;
                                      },
                                      recipeIngredients:
                                          recipe.extendedIngredients,
                                    );
                                  },
                                ),
                    ),
                    Obx(
                      () {
                        return controller.currentPage.value > 1
                            // &&
                            //         controller.currentPage.value <= 10
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Platform.isAndroid
                                        ? CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.grey,
                                          )
                                        : CupertinoActivityIndicator(
                                            color: Colors.grey,
                                            animating: true,
                                            radius: 15,
                                          ),
                                  ),
                                ],
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
