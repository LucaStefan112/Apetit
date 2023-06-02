import 'dart:core';

class Recipe {
  final String id;
  final String name;
  final String description;
  final String? image;
  final List<String> ingredients;
  final List<String> steps;
  final String diet;
  final List<String> keywords;

  Recipe({
    required this.name,
    required this.description,
    this.image,
    required this.ingredients,
    required this.steps,
    required this.id,
    required this.diet,
    required this.keywords
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      ingredients: json['ingredients'].cast<String>(),
      steps: json['steps'].cast<String>(),
      diet: json['diet'],
      keywords: json['keywords'].cast<String>()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'ingredients': ingredients,
      'steps': steps,
      'diet': diet,
      'keywords': keywords
    };
  }
}