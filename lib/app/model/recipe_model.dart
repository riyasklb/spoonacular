// To parse this JSON data, do
//
//     final likedRecipeModel = likedRecipeModelFromJson(jsonString);

import 'dart:convert';

LikedRecipeModel likedRecipeModelFromJson(String str) =>
    LikedRecipeModel.fromJson(json.decode(str));

String likedRecipeModelToJson(LikedRecipeModel data) =>
    json.encode(data.toJson());

class LikedRecipeModel {
  List<RecipeData> results;
  int offset;
  int number;
  int totalResults;

  LikedRecipeModel({
    required this.results,
    required this.offset,
    required this.number,
    required this.totalResults,
  });

  factory LikedRecipeModel.fromJson(Map<String, dynamic> json) =>
      LikedRecipeModel(
        results: List<RecipeData>.from(
            json["results"].map((x) => RecipeData.fromJson(x))),
        offset: json["offset"],
        number: json["number"],
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "offset": offset,
        "number": number,
        "totalResults": totalResults,
      };
}

class RecipeData {
  bool vegetarian;
  bool vegan;
  bool glutenFree;
  bool dairyFree;
  bool veryHealthy;
  bool cheap;
  bool veryPopular;
  bool sustainable;
  bool lowFodmap;
  int weightWatcherSmartPoints;
  String gaps;
  int preparationMinutes;
  int cookingMinutes;
  int aggregateLikes;
  int healthScore;
  String creditsText;
  String sourceName;
  double pricePerServing;
  List<EdIngredient> extendedIngredients;
  int id;
  String title;
  int readyInMinutes;
  int servings;
  String sourceUrl;
  String? image;
  String? imageType;
  String summary;
  List<String> cuisines;
  List<String> dishTypes;
  List<String> diets;
  List<String> occasions;
  List<AnalyzedInstruction> analyzedInstructions;
  double spoonacularScore;
  String spoonacularSourceUrl;
  int? usedIngredientCount;
  int? missedIngredientCount;
  List<EdIngredient>? missedIngredients;
  int? likes;
  List<dynamic>? usedIngredients;
  List<dynamic>? unusedIngredients;
  String? license;
  WinePairing? winePairing;
  String? instructions;
  dynamic report;
  Tips? tips;
  int? openLicense;
  double? suspiciousDataScore;
  int? approved;
  List<dynamic>? unknownIngredients;
  List<dynamic>? userTags;
  dynamic originalId;

  RecipeData({
    required this.vegetarian,
    required this.vegan,
    required this.glutenFree,
    required this.dairyFree,
    required this.veryHealthy,
    required this.cheap,
    required this.veryPopular,
    required this.sustainable,
    required this.lowFodmap,
    required this.weightWatcherSmartPoints,
    required this.gaps,
    required this.preparationMinutes,
    required this.cookingMinutes,
    required this.aggregateLikes,
    required this.healthScore,
    required this.creditsText,
    required this.sourceName,
    required this.pricePerServing,
    required this.extendedIngredients,
    required this.id,
    required this.title,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
    this.image,
    this.imageType,
    required this.summary,
    required this.cuisines,
    required this.dishTypes,
    required this.diets,
    required this.occasions,
    required this.analyzedInstructions,
    required this.spoonacularScore,
    required this.spoonacularSourceUrl,
    this.usedIngredientCount,
    this.missedIngredientCount,
    this.missedIngredients,
    this.likes,
    this.usedIngredients,
    this.unusedIngredients,
    this.license,
    this.winePairing,
    this.instructions,
    this.report,
    this.tips,
    this.openLicense,
    this.suspiciousDataScore,
    this.approved,
    this.unknownIngredients,
    this.userTags,
    this.originalId,
  });

  factory RecipeData.fromJson(Map<String, dynamic> json) => RecipeData(
        vegetarian: json["vegetarian"],
        vegan: json["vegan"],
        glutenFree: json["glutenFree"],
        dairyFree: json["dairyFree"],
        veryHealthy: json["veryHealthy"],
        cheap: json["cheap"],
        veryPopular: json["veryPopular"],
        sustainable: json["sustainable"],
        lowFodmap: json["lowFodmap"],
        weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
        gaps: json["gaps"],
        preparationMinutes: json["preparationMinutes"],
        cookingMinutes: json["cookingMinutes"],
        aggregateLikes: json["aggregateLikes"],
        healthScore: json["healthScore"],
        creditsText: json["creditsText"],
        sourceName: json["sourceName"],
        pricePerServing: json["pricePerServing"]?.toDouble(),
        extendedIngredients: List<EdIngredient>.from(
            json["extendedIngredients"].map((x) => EdIngredient.fromJson(x))),
        id: json["id"],
        title: json["title"],
        readyInMinutes: json["readyInMinutes"],
        servings: json["servings"],
        sourceUrl: json["sourceUrl"],
        image: json["image"],
        imageType: json["imageType"],
        summary: json["summary"],
        cuisines: List<String>.from(json["cuisines"].map((x) => x)),
        dishTypes: List<String>.from(json["dishTypes"].map((x) => x)),
        diets: List<String>.from(json["diets"].map((x) => x)),
        occasions: List<String>.from(json["occasions"].map((x) => x)),
        analyzedInstructions: List<AnalyzedInstruction>.from(
            json["analyzedInstructions"]
                .map((x) => AnalyzedInstruction.fromJson(x))),
        spoonacularScore: json["spoonacularScore"]?.toDouble(),
        spoonacularSourceUrl: json["spoonacularSourceUrl"],
        usedIngredientCount: json["usedIngredientCount"],
        missedIngredientCount: json["missedIngredientCount"],
        missedIngredients: json["missedIngredients"] == null
            ? []
            : List<EdIngredient>.from(json["missedIngredients"]!
                .map((x) => EdIngredient.fromJson(x))),
        likes: json["likes"],
        usedIngredients: json["usedIngredients"] == null
            ? []
            : List<dynamic>.from(json["usedIngredients"]!.map((x) => x)),
        unusedIngredients: json["unusedIngredients"] == null
            ? []
            : List<dynamic>.from(json["unusedIngredients"]!.map((x) => x)),
        license: json["license"],
        winePairing: json["winePairing"] == null
            ? null
            : WinePairing.fromJson(json["winePairing"]),
        instructions: json["instructions"],
        report: json["report"],
        tips: json["tips"] == null ? null : Tips.fromJson(json["tips"]),
        openLicense: json["openLicense"],
        suspiciousDataScore: json["suspiciousDataScore"]?.toDouble(),
        approved: json["approved"],
        unknownIngredients: json["unknownIngredients"] == null
            ? []
            : List<dynamic>.from(json["unknownIngredients"]!.map((x) => x)),
        userTags: json["userTags"] == null
            ? []
            : List<dynamic>.from(json["userTags"]!.map((x) => x)),
        originalId: json["originalId"],
      );

  set isLiked(bool isLiked) {}

  Map<String, dynamic> toJson() => {
        "vegetarian": vegetarian,
        "vegan": vegan,
        "glutenFree": glutenFree,
        "dairyFree": dairyFree,
        "veryHealthy": veryHealthy,
        "cheap": cheap,
        "veryPopular": veryPopular,
        "sustainable": sustainable,
        "lowFodmap": lowFodmap,
        "weightWatcherSmartPoints": weightWatcherSmartPoints,
        "gaps": gaps,
        "preparationMinutes": preparationMinutes,
        "cookingMinutes": cookingMinutes,
        "aggregateLikes": aggregateLikes,
        "healthScore": healthScore,
        "creditsText": creditsText,
        "sourceName": sourceName,
        "pricePerServing": pricePerServing,
        "extendedIngredients":
            List<dynamic>.from(extendedIngredients.map((x) => x.toJson())),
        "id": id,
        "title": title,
        "readyInMinutes": readyInMinutes,
        "servings": servings,
        "sourceUrl": sourceUrl,
        "image": image,
        "imageType": imageType,
        "summary": summary,
        "cuisines": List<dynamic>.from(cuisines.map((x) => x)),
        "dishTypes": List<dynamic>.from(dishTypes.map((x) => x)),
        "diets": List<dynamic>.from(diets.map((x) => x)),
        "occasions": List<dynamic>.from(occasions.map((x) => x)),
        "analyzedInstructions":
            List<dynamic>.from(analyzedInstructions.map((x) => x.toJson())),
        "spoonacularScore": spoonacularScore,
        "spoonacularSourceUrl": spoonacularSourceUrl,
        "usedIngredientCount": usedIngredientCount,
        "missedIngredientCount": missedIngredientCount,
        "missedIngredients": missedIngredients == null
            ? []
            : List<dynamic>.from(missedIngredients!.map((x) => x.toJson())),
        "likes": likes,
        "usedIngredients": usedIngredients == null
            ? []
            : List<dynamic>.from(usedIngredients!.map((x) => x)),
        "unusedIngredients": unusedIngredients == null
            ? []
            : List<dynamic>.from(unusedIngredients!.map((x) => x)),
        "license": license,
        "winePairing": winePairing?.toJson(),
        "instructions": instructions,
        "report": report,
        "tips": tips?.toJson(),
        "openLicense": openLicense,
        "suspiciousDataScore": suspiciousDataScore,
        "approved": approved,
        "unknownIngredients": unknownIngredients == null
            ? []
            : List<dynamic>.from(unknownIngredients!.map((x) => x)),
        "userTags":
            userTags == null ? [] : List<dynamic>.from(userTags!.map((x) => x)),
        "originalId": originalId,
      };
}

class AnalyzedInstruction {
  String name;
  List<Step> steps;

  AnalyzedInstruction({
    required this.name,
    required this.steps,
  });

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) =>
      AnalyzedInstruction(
        name: json["name"],
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
      };
}

class Step {
  int number;
  String step;
  List<Ent> ingredients;
  List<Ent> equipment;
  Length? length;

  Step({
    required this.number,
    required this.step,
    required this.ingredients,
    required this.equipment,
    this.length,
  });

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        number: json["number"],
        step: json["step"],
        ingredients:
            List<Ent>.from(json["ingredients"].map((x) => Ent.fromJson(x))),
        equipment:
            List<Ent>.from(json["equipment"].map((x) => Ent.fromJson(x))),
        length: json["length"] == null ? null : Length.fromJson(json["length"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "step": step,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "equipment": List<dynamic>.from(equipment.map((x) => x.toJson())),
        "length": length?.toJson(),
      };
}

class Ent {
  int id;
  String name;
  String localizedName;
  String image;

  Ent({
    required this.id,
    required this.name,
    required this.localizedName,
    required this.image,
  });

  factory Ent.fromJson(Map<String, dynamic> json) => Ent(
        id: json["id"],
        name: json["name"],
        localizedName: json["localizedName"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "localizedName": localizedName,
        "image": image,
      };
}

class Length {
  int number;
  String unit;

  Length({
    required this.number,
    required this.unit,
  });

  factory Length.fromJson(Map<String, dynamic> json) => Length(
        number: json["number"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "unit": unit,
      };
}

class EdIngredient {
  int id;
  String? aisle;
  String? image;
  String? consistency;
  String name;
  String? nameClean;
  String original;
  String originalName;
  double amount;
  String unit;
  List<String> meta;
  Measures? measures;
  String? unitLong;
  String? unitShort;
  String? extendedName;

  EdIngredient({
    required this.id,
    required this.aisle,
    required this.image,
    this.consistency,
    required this.name,
    this.nameClean,
    required this.original,
    required this.originalName,
    required this.amount,
    required this.unit,
    required this.meta,
    this.measures,
    this.unitLong,
    this.unitShort,
    this.extendedName,
  });

  factory EdIngredient.fromJson(Map<String, dynamic> json) => EdIngredient(
        id: json["id"],
        aisle: json["aisle"],
        image: json["image"],
        consistency: json["consistency"],
        name: json["name"],
        nameClean: json["nameClean"],
        original: json["original"],
        originalName: json["originalName"],
        amount: json["amount"]?.toDouble(),
        unit: json["unit"],
        meta: List<String>.from(json["meta"].map((x) => x)),
        measures: json["measures"] == null
            ? null
            : Measures.fromJson(json["measures"]),
        unitLong: json["unitLong"],
        unitShort: json["unitShort"],
        extendedName: json["extendedName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "aisle": aisle,
        "image": image,
        "consistency": consistency,
        "name": name,
        "nameClean": nameClean,
        "original": original,
        "originalName": originalName,
        "amount": amount,
        "unit": unit,
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "measures": measures?.toJson(),
        "unitLong": unitLong,
        "unitShort": unitShort,
        "extendedName": extendedName,
      };
}

class Measures {
  Metric us;
  Metric metric;

  Measures({
    required this.us,
    required this.metric,
  });

  factory Measures.fromJson(Map<String, dynamic> json) => Measures(
        us: Metric.fromJson(json["us"]),
        metric: Metric.fromJson(json["metric"]),
      );

  Map<String, dynamic> toJson() => {
        "us": us.toJson(),
        "metric": metric.toJson(),
      };
}

class Metric {
  double amount;
  String unitShort;
  String unitLong;

  Metric({
    required this.amount,
    required this.unitShort,
    required this.unitLong,
  });

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
        amount: json["amount"]?.toDouble(),
        unitShort: json["unitShort"],
        unitLong: json["unitLong"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "unitShort": unitShort,
        "unitLong": unitLong,
      };
}

class Tips {
  List<String> health;
  List<String> price;
  List<String> cooking;
  List<String> green;

  Tips({
    required this.health,
    required this.price,
    required this.cooking,
    required this.green,
  });

  factory Tips.fromJson(Map<String, dynamic> json) => Tips(
        health: List<String>.from(json["health"].map((x) => x)),
        price: List<String>.from(json["price"].map((x) => x)),
        cooking: List<String>.from(json["cooking"].map((x) => x)),
        green: List<String>.from(json["green"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "health": List<dynamic>.from(health.map((x) => x)),
        "price": List<dynamic>.from(price.map((x) => x)),
        "cooking": List<dynamic>.from(cooking.map((x) => x)),
        "green": List<dynamic>.from(green.map((x) => x)),
      };
}

class WinePairing {
  List<dynamic>? pairedWines;
  String? pairingText;
  List<dynamic>? productMatches;

  WinePairing({
    this.pairedWines,
    this.pairingText,
    this.productMatches,
  });

  factory WinePairing.fromJson(Map<String, dynamic> json) => WinePairing(
        pairedWines: json["pairedWines"] == null
            ? []
            : List<dynamic>.from(json["pairedWines"]!.map((x) => x)),
        pairingText: json["pairingText"],
        productMatches: json["productMatches"] == null
            ? []
            : List<dynamic>.from(json["productMatches"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "pairedWines": pairedWines == null
            ? []
            : List<dynamic>.from(pairedWines!.map((x) => x)),
        "pairingText": pairingText,
        "productMatches": productMatches == null
            ? []
            : List<dynamic>.from(productMatches!.map((x) => x)),
      };
}
