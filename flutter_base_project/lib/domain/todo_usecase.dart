// handle logic bussiness todo

import 'package:flutter_base_project/data/dio/dio_util.dart';
import 'package:flutter_base_project/data/response_model/anime_model.dart';

class TodoUsecase {
  Future<List<AnimeModel>?> getFacts() async {
    try {
      final result = await DioUtil.instance
          .genApiWithoutAuth()
          .getFacts(placement: "naruto");
      return (result.data as List).map((e) => AnimeModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
