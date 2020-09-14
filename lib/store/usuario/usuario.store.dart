import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ipro_app/models/familia.model.dart';
import 'package:ipro_app/util/consts.dart';

import 'package:mobx/mobx.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as secure;
import 'package:dio/src/options.dart' as opt;

part 'usuario.store.g.dart'; //Nome do arquivo gerado pelo mobx

class UsuarioStore = _UsuarioStore with _$UsuarioStore;

abstract class _UsuarioStore with Store {
  FlutterSecureStorage scr = secure.FlutterSecureStorage();

  Dio dio = Dio();

  List<Familia> familias = List();

  @observable
  bool isLoading = false;

  Future pegarFamilias() async {
    isLoading = true;
    familias.clear();
    pegarFamiliasApi().then((element) {
      if (element.statusCode == 200) {
        for (var familia in element.data['familias']) {
          familias.add(Familia.fromJson(familia));
        }
      } else {
        familias.clear();
      }
      isLoading = false;
    });
  }

  Future pegarFamiliasApi() async {
    isLoading = true;

    try {
      Response response = await dio.get(Consts.devURL + '/users/familia');
      return response;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      isLoading = false;
      return null;
    }
  }

  Future criarFamiliaApi(Map familia) async {
    isLoading = true;

    try {
      Response response = await dio.post(
        Consts.devURL + '/users/familia',
        data: jsonEncode(familia),
        options: opt.Options(
          validateStatus: (status) {
            return status <= 500;
          },
        ),
      );
      return response;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      isLoading = false;
      return null;
    }
  }
}
