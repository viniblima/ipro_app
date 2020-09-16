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

  @computed
  dynamic get usuario => scr.read(key: 'usuario');

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

  Future criarUsuarioApi(Map usuario) async {
    isLoading = true;

    try {
      Response response = await dio.post(
        Consts.devURL + '/users/signup',
        data: jsonEncode(usuario),
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

  Future salvarUsuario(String token, String expiracao, Map usuario) async {
    await scr.write(key: 'token', value: token);
    await scr.write(key: 'expiracao', value: expiracao);
    await scr.write(key: 'nome', value: usuario['nome']);

    return true;
  }

  Future refreshToken(refresh) async {
    final Map<String, String> params = {"refresh": refresh};

    var data = json.encode(params);

    try {
      Response response = await dio.post(
        Consts.devURL + '/users/refresh/',
        options: opt.Options(
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
          validateStatus: (status) {
            return status <= 500;
          },
        ),
        data: data,
      );

      return response;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      isLoading = false;
      return null;
    }
  }

  Future checarToken() async {
    String token = await scr.read(key: 'token');
    String expiracao = await scr.read(key: 'expiracao');

    if (token != null && expiracao != null) {
      DateTime expiracaoData = DateTime.parse(expiracao);

      if (DateTime.now().toUtc().isAfter(expiracaoData)) {
        Response response = await refreshToken(token);

        if (response.statusCode == 200) {
          await scr.write(key: 'token', value: response.data['token']);
          await scr.write(key: 'expiracao', value: response.data['expires']);
          return true;
        } else {
          return false;
        }
      } else {
        return true;
      }
    } else {
      return false;
    }
  }
}
