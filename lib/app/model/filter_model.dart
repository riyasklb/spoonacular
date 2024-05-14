class CuisineData {
  String name;
  bool isChecked;

  CuisineData({required this.name, required this.isChecked});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isChecked': isChecked,
    };
  }

  factory CuisineData.fromMap(Map<String, dynamic> map) {
    return CuisineData(
      name: map['name'],
      isChecked: map['isChecked'],
    );
  }
}

class SelectionData {
  String name;
  String paramName;
  String activeIcon;
  String inactiveIcon;
  bool isSelected;

  SelectionData(
      {required this.name,
      required this.paramName,
      required this.activeIcon,
      required this.inactiveIcon,
      required this.isSelected});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'paramName': paramName,
      'activeIcon': activeIcon,
      'inactiveIcon': inactiveIcon,
      'isSelected': isSelected,
    };
  }

  factory SelectionData.fromMap(Map<String, dynamic> map) {
    return SelectionData(
      name: map['name'],
      activeIcon: map['activeIcon'],
      inactiveIcon: map['inactiveIcon'],
      isSelected: map['isSelected'],
      paramName: map['paramName'],
    );
  }
}

class RecipeSelectionData {
  String name;
  double quantity;
  String unit;
  String unitLong;
  String? pantryName;
  bool isChecked;

  RecipeSelectionData(
      {required this.name,
      required this.isChecked,
      required this.quantity,
      required this.unit,
      required this.unitLong,
      this.pantryName});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isChecked': isChecked,
      'quantity': quantity,
      'unit': unit,
      'unitLong': unitLong,
      'pantryName': pantryName
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'unit': unitLong,
      'quantity': quantity,
      'name': name
    };
  }

  factory RecipeSelectionData.fromMap(Map<String, dynamic> map) {
    return RecipeSelectionData(
      name: map['name'],
      isChecked: map['isChecked'],
      quantity: map['quantity'],
      unit: map['unit'],
      unitLong: map['unitLong'],
      pantryName: map['pantryName']
    );
  }
}
