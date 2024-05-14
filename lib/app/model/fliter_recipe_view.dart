// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spoonacular/app/constants/app_constant.dart';
import 'package:spoonacular/app/constants/check_box_with_title.dart';
import 'package:spoonacular/app/constants/custom_button.dart';
import 'package:spoonacular/app/constants/custom_button1.dart';

import 'package:spoonacular/app/constants/filter_expansion_tile.dart';
import 'package:spoonacular/app/constants/selection_button.dart';
import 'package:spoonacular/app/controllers/recipes_controller.dart';
import 'package:spoonacular/app/views/home/body_container_arc_widget.dart';

class FliterRecipeView extends GetView<RecipesController> {
  const FliterRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BodyContainerArcWidget(
            isLeadingNeeded: true,
            leadingIconColor: Colors.white,
            titleText: "Filters",
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    const Divider(
                      color: Colors.grey,
                    ),
                    FilterExpansionTile(
                      title: 'Cuisine',
                      children: [
                        Obx(
                          () => ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: controller.cuisineTypes.value.length,
                              itemBuilder: (context, index) {
                                final item =
                                    controller.cuisineTypes.value[index];
                                return CheckBoxWithTitle(
                                  title: item.name,
                                  isSelected: item.isChecked,
                                  onTap: () {
                                    item.isChecked = !item.isChecked;
                                    controller.cuisineTypes.refresh();
                                  },
                                );
                              }),
                        )
                      ],
                    ),
                    FilterExpansionTile(
                      title: 'Dietary preference',
                      children: [
                        Obx(
                          () => GridView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 4 / 3,
                              crossAxisCount: 3,
                              // number of items in each row
                              mainAxisSpacing: 8.0,
                              // spacing between rows
                              crossAxisSpacing: 8.0, // spacing between columns
                            ),
                            padding: const EdgeInsets.all(8.0),
                            itemCount:
                                controller.dietaryPreference.value.length,
                            itemBuilder: (context, index) {
                              final item =
                                  controller.dietaryPreference.value[index];
                              return SelectionButton(
                                name: item.name,
                                activeIcon: item.activeIcon,
                                inactiveIcon: item.inactiveIcon,
                                isSelected: item.isSelected,
                                onTap: () {
                                  item.isSelected = !item.isSelected;
                                  print(item.isSelected);
                                  controller.dietaryPreference.refresh();
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    FilterExpansionTile(
                      title: 'Food allergies',
                      children: [
                        Obx(
                          () => GridView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 4 / 3,
                              crossAxisCount: 3,
                              // number of items in each row
                              mainAxisSpacing: 8.0,
                              // spacing between rows
                              crossAxisSpacing: 8.0, // spacing between columns
                            ),
                            padding: const EdgeInsets.all(8.0),
                            itemCount: controller.foodAllergies.value.length,
                            itemBuilder: (context, index) {
                              final item =
                                  controller.foodAllergies.value[index];
                              return SelectionButton(
                                name: item.name,
                                activeIcon: item.activeIcon,
                                inactiveIcon: item.inactiveIcon,
                                isSelected: item.isSelected,
                                onTap: () {
                                  item.isSelected = !item.isSelected;
                                  print(item.isSelected);
                                  controller.foodAllergies.refresh();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    FilterExpansionTile(
                      title: 'Serving size',
                      children: [
                        Obx(
                          () => Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 13,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                        11,
                                        (index) => Text(
                                              index == 0 ? "   " : "$index",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    color: index ==
                                                            controller
                                                                .value.value
                                                                .round()
                                                        ? Colors.red
                                                        : Colors.black,
                                                  ),
                                            )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 25,
          left: 20,
          right: 20,
        ),
        child: Row(
          children: [
            Flexible(
              child: CustomElevatedButton(
                onPressed: () {
                  if (controller.isFilterSelected()) {
                    controller.updateSelectedData();
                    controller.saveFilterData();
                    Get.back();
                    controller.refreshRecipe();
                  } else {
                    // AppConstants.showSnackbar(
                    //   headText: "Select Filter",
                    //   content: "Please select an option before apply filters",
                    //   position: SnackPosition.BOTTOM,
                    // );
                  }
                },
                width: Get.width,
                height: 50,
                textColor: Colors.white,
                color: Colors.blue,
                child: Text(
                  "Apply",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Flexible(
              child: CustomButton1(
                onTap: () {
                  if (controller.isFilterSelected()) {
                    Get.back();
                    controller.clearFilter();
                  } else {
                    // AppConstants.showSnackbar(
                    //   headText: "No filters Selected",
                    //   position: SnackPosition.BOTTOM,
                    //   content: "Please select atleast one filter to clear.",
                    // );
                  }
                },
                text: "Clear",
                borderSideColor: Colors.blue,
                textColor: Colors.blue,
                textFontSize: 15,
                width: Get.width,
                bgColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
