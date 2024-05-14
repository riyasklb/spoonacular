// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:spoonacular/app/model/filter_model.dart';
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

  final cuisineTypes = Rx<List<CuisineData>>([
    CuisineData(name: "American", isChecked: false),
    CuisineData(name: "Mexican", isChecked: false),
    CuisineData(name: "Thai", isChecked: false),
    CuisineData(name: "Chinese", isChecked: false),
    CuisineData(name: "Korean", isChecked: false),
    CuisineData(name: "Mediterranean", isChecked: false),
    CuisineData(name: "Italian", isChecked: false),
    CuisineData(name: "Indian", isChecked: false),
    CuisineData(name: "French", isChecked: false),
    CuisineData(name: "Vietnamese", isChecked: false),
    CuisineData(name: "Japanese", isChecked: false),
    CuisineData(name: "Caribbean", isChecked: false),
  ]);

  final dietaryPreference = Rx<List<SelectionData>>([
    // SelectionData(
    //     name: "Low carb",
    //     paramName: 'No param',
    //     activeIcon: Assets.images.filter.noCarbsActive.path,
    //     inactiveIcon: Assets.images.filter.noCarbsInactive.path,
    //     isSelected: false),
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
      name: "Keto",
      paramName: 'Ketogenic',
      activeIcon: iconImage,
      inactiveIcon: iconImage,
      isSelected: false,
    ),
    SelectionData(
      name: "Whole30",
      paramName: 'Whole30',
      activeIcon: iconImage,
      inactiveIcon: iconImage,
      isSelected: false,
    ),
    // SelectionData(
    //     name: "Plant based",
    //     activeIcon: Assets.images.filter.plantBasedActive.path,
    //     inactiveIcon: Assets.images.filter.plantBasedInactive.path,
    //     isSelected: false,
    //     paramName: 'No param'),
    // SelectionData(
    //     name: "Row food",
    //     activeIcon: Assets.images.filter.proteinActive.path,
    //     inactiveIcon: Assets.images.filter.proteinInactive.path,
    //     isSelected: false,
    //     paramName: 'No param'),
    SelectionData(
        name: "Gluten free",
        activeIcon: iconImage,
        inactiveIcon: iconImage,
        isSelected: false,
        paramName: 'Gluten Free'),
    // SelectionData(
    //     name: "Mediterranean",
    //     activeIcon: Assets.images.filter.mediterraneanActive.path,
    //     inactiveIcon: Assets.images.filter.mediterraneanInactive.path,
    //     isSelected: false,
    //     paramName: 'No param'),
    // SelectionData(
    //     name: "Dairy free",
    //     activeIcon: Assets.images.filter.dairyActive.path,
    //     inactiveIcon: Assets.images.filter.dairyInactive.path,
    //     isSelected: false,
    //     paramName: 'No param'),
    SelectionData(
        name: "Paleo",
        activeIcon: iconImage,
        inactiveIcon: iconImage,
        isSelected: false,
        paramName: 'Paleo'),
    SelectionData(
        name: "Pescatarian",
        activeIcon: iconImage,
        inactiveIcon: iconImage,
        isSelected: false,
        paramName: 'Pescetarian'),
  ]);

  final foodAllergies = Rx<List<SelectionData>>([
    SelectionData(
        name: "Dairy",
        activeIcon: iconImage,
        inactiveIcon: iconImage,
        isSelected: false,
        paramName: 'Dairy'),
    SelectionData(
        name: "Eggs",
        activeIcon: iconImage,
        inactiveIcon: iconImage,
        isSelected: false,
        paramName: 'Egg'),
    SelectionData(
        name: "Peanuts",
        activeIcon: iconImage,
        inactiveIcon: iconImage,
        isSelected: false,
        paramName: 'Peanut'),
    SelectionData(
        name: "Tree nuts",
        activeIcon: iconImage,
        inactiveIcon: iconImage,
        isSelected: false,
        paramName: 'Tree Nut'),
    SelectionData(
        name: "Soy",
        activeIcon: iconImage,
        inactiveIcon: iconImage,
        isSelected: false,
        paramName: 'Soy'),
    SelectionData(
        name: "Wheat",
        activeIcon: iconImage,
        inactiveIcon: iconImage,
        isSelected: false,
        paramName: 'Wheat'),
    SelectionData(
        name: "Fish",
        activeIcon: iconImage,
        inactiveIcon: iconImage,
        isSelected: false,
        paramName: 'Seafood'),
    SelectionData(
        name: "Shellfish",
        activeIcon: iconImage,
        inactiveIcon: iconImage,
        isSelected: false,
        paramName: 'Shellfish'),
  ]);

  RxString selectedCuisines = ''.obs;
  RxString selectedDietPreference = ''.obs;
  RxString selectedFoodAllergies = ''.obs;

  @override
  void onInit() async {
    // loadFilterData();
    // fetchPantryIngredients(
    //   init: true,
    // );
    // fetchLikedId();
    // recipeScrollController.addListener(configureScrollController);
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
    List<String> selectedCuisineData = cuisineTypes.value
        .where((item) => item.isChecked)
        .map((selectedItem) => selectedItem.name)
        .toList();

    List<String> selectedDietData = dietaryPreference.value
        .where((item) => item.isSelected)
        .map((selectedItem) => selectedItem.paramName)
        .toList();

    List<String> selectedAllergyData = foodAllergies.value
        .where((item) => item.isSelected)
        .map((selectedItem) => selectedItem.paramName)
        .toList();

    selectedCuisines.value = selectedCuisineData.join(', ');
    selectedDietPreference.value = selectedDietData.join(', ');
    selectedFoodAllergies.value = selectedAllergyData.join(', ');

    print("Selected cuisine = ${selectedCuisines.value}");
    print("Selected diet = ${selectedDietPreference.value}");
    print("Selected food allergy = ${selectedFoodAllergies.value}");
  }

  void saveFilterData() {
    final storage = GetStorage();

    List<Map<String, dynamic>> cuisineDataMapList =
        cuisineTypes.value.map((data) => data.toMap()).toList();

    List<Map<String, dynamic>> dietDataMapList =
        dietaryPreference.value.map((data) => data.toMap()).toList();

    List<Map<String, dynamic>> allergyDataMapList =
        foodAllergies.value.map((data) => data.toMap()).toList();

    storage.write('cuisineFilterData', jsonEncode(cuisineDataMapList));
    storage.write('dietaryFilterData', jsonEncode(dietDataMapList));
    storage.write('allergyFilterData', jsonEncode(allergyDataMapList));
  }

  void loadFilterData() {
    final storage = GetStorage();

    String? cuisineDataJson = storage.read<String>('cuisineFilterData');
    String? dietDataJson = storage.read<String>('dietaryFilterData');
    String? allergyDataJson = storage.read<String>('allergyFilterData');

    if (cuisineDataJson != null) {
      // Decode the JSON string into a list of maps
      List<Map<String, dynamic>> cuisineDataMapList =
          List<Map<String, dynamic>>.from(jsonDecode(cuisineDataJson));

      // Convert the list of maps back to a list of CuisineData objects
      cuisineTypes.value =
          cuisineDataMapList.map((map) => CuisineData.fromMap(map)).toList();
      cuisineTypes.refresh();
    }

    if (dietDataJson != null) {
      List<Map<String, dynamic>> dietDataMapList =
          List<Map<String, dynamic>>.from(jsonDecode(dietDataJson));

      dietaryPreference.value =
          dietDataMapList.map((map) => SelectionData.fromMap(map)).toList();
      dietaryPreference.refresh();
    }

    if (allergyDataJson != null) {
      List<Map<String, dynamic>> allergyDataMapList =
          List<Map<String, dynamic>>.from(jsonDecode(allergyDataJson));

      foodAllergies.value =
          allergyDataMapList.map((map) => SelectionData.fromMap(map)).toList();
      foodAllergies.refresh();
    }

    updateSelectedData();
    update();
  }

  void clearFilter() {
    // final storage = GetStorage();

    for (var data in cuisineTypes.value) {
      data.isChecked = false;
    }

    for (var data in dietaryPreference.value) {
      data.isSelected = false;
    }

    for (var data in foodAllergies.value) {
      data.isSelected = false;
    }

    selectedCuisines.value = "";
    selectedDietPreference.value = "";
    selectedFoodAllergies.value = "";

    cuisineTypes.refresh();
    dietaryPreference.refresh();
    foodAllergies.refresh();

    saveFilterData();
    refreshRecipe();

    update();
  }

  bool isFilterSelected() {
    if (cuisineTypes.value.any((data) => data.isChecked == true) ||
        dietaryPreference.value.any((data) => data.isSelected == true) ||
        foodAllergies.value.any((data) => data.isSelected == true)) {
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
