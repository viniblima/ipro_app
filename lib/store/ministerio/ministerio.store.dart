import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ipro_app/models/curso.model.dart';
import 'package:ipro_app/models/ministerio.model.dart';
import 'package:ipro_app/util/consts.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as secure;

part 'ministerio.store.g.dart'; //Nome do arquivo gerado pelo mobx

class MinisterioStore = _MinisterioStore with _$MinisterioStore;

abstract class _MinisterioStore with Store {
  FlutterSecureStorage scr = secure.FlutterSecureStorage();

  Dio dio = Dio();

  List<Ministerio> ministerios = List();

  List<Curso> cursos = List();

  @observable
  bool isLoading = false;

  Future pegarMinisterios() async {
    isLoading = true;
    ministerios.clear();

    pegarMinisteriosApi().then((element) {
      if (element.statusCode == 200) {
        for (var ministerio in element.data) {
          ministerios.add(Ministerio.fromJson(ministerio));
        }
      } else {
        ministerios.clear();
      }
      isLoading = false;
    });
  }

  Future pegarMinisteriosApi() async {
    isLoading = true;

    try {
      Response response =
          await dio.get(Consts.devURL + '/ministerios/ministerio');
      return response;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      isLoading = false;
      return null;
    }
  }

  Future pegarCursos() async {
    isLoading = true;
    cursos.clear();

    pegarCursosApi().then((element) {
      if (element.statusCode == 200) {
        for (var curso in element.data) {
          cursos.add(Curso.fromJson(curso));
        }
      } else {
        cursos.clear();
      }
      isLoading = false;
    });
  }

  Future pegarCursosApi() async {
    isLoading = true;

    try {
      Response response =
          await dio.get(Consts.devURL + '/ministerios/curso');
      return response;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      isLoading = false;
      return null;
    }
  }
}
