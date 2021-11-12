import 'package:kma_app/BusinessLayer/DataAccess/Http/api_client.dart';
import 'package:kma_app/Helper/extention/map_parse.dart';
import 'package:kma_app/Model/home.dart';

class HomeService {
  ApiClient _apiClient;


  HomeService(this._apiClient);

  Future<List<SlideNews>> getSlideNews() async{
    final response = await _apiClient.get('http://171.244.141.137/news');

    if(response.statusCode == 200) {
      Map<String, dynamic> jsonData = response.data as Map<String, dynamic>;

      Map<String, dynamic> jsonSlideNews = jsonData['data'];

      List listData = jsonSlideNews.arrayValueOfEmpty('slideNews');

      List<SlideNews> data = listData.map((e) => SlideNews.fromJson(e)).toList();

      return data;
    } else {
      return [];
    }
  }
}