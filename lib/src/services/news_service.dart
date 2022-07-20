// ignore_for_file: constant_identifier_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/news_models.dart';
import '../models/category_model.dart';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
const _URL_NEWS = 'https://newsapi.org/v2';
const _APIKEY = '628ac7eba46b4944b9f0fc9533eedfc4';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology')
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    this.getTopHeadlines();

    categories.forEach((item) {
      this.categoryArticles[item.name] = [];
    });
  }

  String get selectedCategory => this._selectedCategory;
  set selectedCategory(String valor){
    this._selectedCategory = valor;

    this.getArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article>? get getArticulosCategoriaSeleccionada => this.categoryArticles[this.selectedCategory];

  getTopHeadlines() async {
   final url = Uri.parse('$_URL_NEWS/top-headlines?country=us&apiKey=$_APIKEY');
   final resp = await http.get(url);
   final newsResponse = newsResponseFromJson(resp.body);

   headlines.addAll(newsResponse.articles);
   notifyListeners();
  }

  getArticlesByCategory(String category) async {

    if(categoryArticles[category]!.isNotEmpty){
      return categoryArticles[category];
    }

    final url = Uri.parse('$_URL_NEWS/top-headlines?country=us&apiKey=$_APIKEY&category=$category');
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);

    this.categoryArticles[category]?.addAll(newsResponse.articles);

    notifyListeners();
  }
}