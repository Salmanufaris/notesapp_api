import 'package:dio/dio.dart';
import 'package:flutter_application_todo/model/model.dart';

class ApiService {
  Dio dio = Dio();
  final url = "https://65a123b4600f49256fb0fff8.mockapi.io/NOTES/Notes";

  Future<List<Model>> fetchApi() async {
    try {
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        var jsonList = response.data as List;

        List<Model> notes = jsonList.map((json) {
          return Model.fromJson(
              json); // Ensure Model.fromJson is correctly implemented
        }).toList();
        return notes;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (error) {
      throw Exception("Failed to fetch data: $error");
    }
  }

  createnotes(Model value) async {
    try {
      await dio.post(url, data: value.toJson());
      fetchApi();
    } catch (error) {
      throw Exception(error);
    }
  }

  delete({required id}) async {
    var deleteurl =
        "https://65a123b4600f49256fb0fff8.mockapi.io/NOTES/Notes/$id";
    try {
      await dio.delete(deleteurl);
    } catch (error) {
      throw Exception(error);
    }
  }

  editNotes({required value, required id}) async {
    try {
      await dio.put(
          "https://65a123b4600f49256fb0fff8.mockapi.io/NOTES/Notes/$id",
          data: value.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }
}
