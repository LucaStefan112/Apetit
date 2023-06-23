import 'dart:core';

class Recipe {
  final String id;
  final String name;
  final String type;
  final String description;
  final String? image;
  final List<Map<String, dynamic>> ingredients;
  final List<String> steps;
  final String? diet;
  late bool? liked;
  final List<String> keywords;
  final String? imageUrl;

  Recipe({
    required this.name,
    required this.type,
    required this.description,
    this.image,
    required this.ingredients,
    required this.steps,
    required this.id,
    this.liked,
    this.diet,
    required this.keywords,
    this.imageUrl
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> ingredients = [];

    for (var ingredient in json['ingredients']) {
      ingredients.add(Map<String, dynamic>.from(ingredient));
    }

    List<String> steps = [];

    for (var step in json['steps']) {
      steps.add(step);
    }

    List<String> keywords = [];

    for (var keyword in json['keywords']) {
      keywords.add(keyword);
    }

    return Recipe(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      description: json['description'],
      image: json['image'],
      ingredients: ingredients,
      steps: steps,
      diet: json['diet'],
      liked: json['liked'],
      keywords: keywords,
      imageUrl: json['imageUrl']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'description': description,
      'image': image,
      'ingredients': ingredients,
      'steps': steps,
      'diet': diet,
      'liked': liked,
      'keywords': keywords,
      'imageUrl': imageUrl
    };
  }
}