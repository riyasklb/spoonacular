// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:spoonacular/app/local/sqflite.dart';
import 'package:spoonacular/app/model/filter_model.dart';
import 'package:spoonacular/app/model/local_model.dart';
import 'package:spoonacular/app/model/recipe_model.dart';

enum LoadingStatus { loading, completed, error }

const String iconImage = 'assets/images/play_store_512.png';

class RecipesController extends GetxController {
  var loadingStatus = LoadingStatus.loading.obs;

  final _recipeList = Rx<List<RecipeData>>([]);

  RxDouble value = 0.0.obs;

  // final searchDebouncer = SearchDebouncer();
  var searchController = TextEditingController().obs;

  List<RecipeData> get recipeList => _recipeList.value;

  final _pantryIngredients = Rx<List<String>>([]);

  List<String> get pantryIngredients => _pantryIngredients.value;
  RxString searchQuery = "".obs;

  final recipeScrollController = ScrollController();
  int itemsPerPage = 15;
  RxInt currentPage = 1.obs;

  final isRefreshAllowed = true.obs;

  final dietaryPreference = Rx<List<SelectionData>>([
    SelectionData(
      name: "Vegan",
      paramName: 'Vegan',
      activeIcon: iconImage,
      inactiveIcon: iconImage,
      isSelected: false,
    ),
    SelectionData(
      name: "Vegetarian",
      paramName: 'Vegetarian',
      activeIcon: iconImage,
      inactiveIcon: iconImage,
      isSelected: false,
    ),
    SelectionData(
        name: "Gluten free",
        activeIcon: iconImage,
        inactiveIcon: iconImage,
        isSelected: false,
        paramName: 'Gluten Free'),
  ]);

  RxString selectedCuisines = ''.obs;
  RxString selectedDietPreference = ''.obs;
  RxString selectedFoodAllergies = ''.obs;

  @override
  void onInit() async {
    fetchRecipes();
    super.onInit();
  }

  void configureScrollController() {
    if (recipeScrollController.position.pixels ==
        recipeScrollController.position.maxScrollExtent) {
      // Reached the end of the list, fetch more recipes
      fetchRecipes();
    }
  }

//test new key

  Future<void> fetchRecipes() async {
    try {
      List<RecipeData> listWithIngredients = [];
      List<RecipeData> listWithoutIngredients = [];
      List<RecipeData> results = [];

      if (loadPantryRecipe() == true) {
        // Request with 'includeIngredients' parameter
        final responseWithIngredients = await Dio().get(
          'https://api.spoonacular.com/recipes/complexSearch',
          queryParameters: {
            'apiKey': '5df0657f8e9947eda7518df4e17a2f8d',
            'query': searchQuery.value,
            'addRecipeInformation': true,
            'fillIngredients': true,
            'includeIngredients': pantryIngredients.join(","),
            'sort': 'max-used-ingredients',
            'sortDirection': 'asc',
            'cuisine': selectedCuisines.value,
            'diet': selectedDietPreference.value,
            'intolerances': selectedFoodAllergies,
            'number': itemsPerPage,
            'offset': (currentPage.value - 1) * itemsPerPage,
            "instructionsRequired": true,
            // Add other query parameters as needed
          },
        );
        print("responseWithIngredients $responseWithIngredients");

        listWithIngredients = (responseWithIngredients.data["results"] as List)
            .map((e) => RecipeData.fromJson(e))
            .toList();

        results.addAll(listWithIngredients);
      } else {
        // Request without 'includeIngredients' parameter
        final responseWithoutIngredients = await Dio().get(
          'https://api.spoonacular.com/recipes/complexSearch',
          queryParameters: {
            'apiKey': '5df0657f8e9947eda7518df4e17a2f8d',
            'query': searchQuery.value,
            'addRecipeInformation': true,
            'fillIngredients': true,
            'cuisine': selectedCuisines.value,
            'diet': selectedDietPreference.value,
            'intolerances': selectedFoodAllergies,
            'number': itemsPerPage,
            'offset': (currentPage.value - 1) * itemsPerPage,
            "instructionsRequired": true,
            // Add other query parameters as needed
          },
        );
        print("responseWithIngredients $responseWithoutIngredients");

        listWithoutIngredients =
            (responseWithoutIngredients.data["results"] as List)
                .map((e) => RecipeData.fromJson(e))
                .toList();

        results.addAll(listWithoutIngredients);
      }

      _recipeList.value.addAll(results);
      _recipeList.refresh();

      // Increment page and update loading status
      currentPage.value++;
      loadingStatus(LoadingStatus.completed);
      update();
      print("SUCCESS");
    } catch (error) {
      // Handle DioError
      print('Error: $error');
    }
  }

  bool loadPantryRecipe() {
    if (isFilterSelected() == false && searchQuery.value == "") {
      return true;
    } else {
      return false;
    }
  }

  void searchRecipe({required String query}) {
    loadingStatus(LoadingStatus.loading);
    _recipeList.value = [];
    currentPage.value = 1;
    searchQuery.value = query;

    if (searchQuery.value == "") {
      itemsPerPage = 15;
    } else {
      itemsPerPage = 15;
    }

    fetchRecipes();
  }

  void refreshRecipe() {
    loadingStatus(LoadingStatus.loading);
    searchQuery.value = "";
    searchController.value.clear();
    itemsPerPage = 15;
    _recipeList.value = [];
    _recipeList.refresh();
    currentPage.value = 1;

    fetchRecipes();
  }

  void updateSelectedData() {
    List<String> selectedDietData = dietaryPreference.value
        .where((item) => item.isSelected)
        .map((selectedItem) => selectedItem.paramName)
        .toList();

    selectedDietPreference.value = selectedDietData.join(', ');

    print("Selected cuisine = ${selectedCuisines.value}");
    print("Selected diet = ${selectedDietPreference.value}");
    print("Selected food allergy = ${selectedFoodAllergies.value}");
  }

  void saveFilterData() {
    final storage = GetStorage();

    List<Map<String, dynamic>> dietDataMapList =
        dietaryPreference.value.map((data) => data.toMap()).toList();

    storage.write('dietaryFilterData', jsonEncode(dietDataMapList));
  }

  void loadFilterData() {
    final storage = GetStorage();

    String? dietDataJson = storage.read<String>('dietaryFilterData');

    if (dietDataJson != null) {
      List<Map<String, dynamic>> dietDataMapList =
          List<Map<String, dynamic>>.from(jsonDecode(dietDataJson));

      dietaryPreference.value =
          dietDataMapList.map((map) => SelectionData.fromMap(map)).toList();
      dietaryPreference.refresh();
    }

    updateSelectedData();
    update();
  }

  void clearFilter() {
    for (var data in dietaryPreference.value) {
      data.isSelected = false;
    }

    selectedCuisines.value = "";
    selectedDietPreference.value = "";
    selectedFoodAllergies.value = "";

    // cuisineTypes.refresh();
    dietaryPreference.refresh();

    saveFilterData();
    refreshRecipe();

    update();
  }

  bool isFilterSelected() {
    if (dietaryPreference.value.any((data) => data.isSelected == true) ||
        dietaryPreference.value.any((data) => data.isSelected == true) ||
        dietaryPreference.value.any((data) => data.isSelected == true)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void onClose() {
    recipeScrollController.dispose();
    super.onClose();
  }
}
