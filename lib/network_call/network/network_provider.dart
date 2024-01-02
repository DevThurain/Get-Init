import 'package:get/get.dart';
import 'package:get_init/network_call/data/joke_vo.dart';

class NetworkProvider extends GetConnect {
  Future<Response<Map<String, dynamic>>> getRandomJoke() =>
      get('https://api.chucknorris.io/jokes/random');

  Future<Response<Map<String, dynamic>>> getInvalidJoke() => get('https://api.chucknorris.io/nothing');
}
