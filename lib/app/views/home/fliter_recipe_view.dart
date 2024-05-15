// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:spoonacular/app/constants/custom_button.dart';
import 'package:spoonacular/app/constants/custom_button1.dart';

import 'package:spoonacular/app/views/home/widgets/filter_expansion_tile.dart';
import 'package:spoonacular/app/constants/selection_button.dart';
import 'package:spoonacular/app/controllers/recipes_controller.dart';
import 'package:spoonacular/app/views/home/widgets/body_container_arc_widget.dart';

class FliterRecipeView extends GetView<RecipesController> {
  const FliterRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BodyContainerArcWidget(
            isLeadingNeeded: false,
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
                                // activeIcon: item.activeIcon,
                                //    inactiveIcon: item.inactiveIcon,
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
                color: Colors.orange,
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
                    print('no data');
                  }
                },
                text: "Clear",
                borderSideColor: Colors.orange,
                textColor: Colors.orange,
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
