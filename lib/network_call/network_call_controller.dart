import 'package:get/get.dart';
import 'package:get_init/network_call/data/joke_vo.dart';
import 'package:get_init/network_call/network/network_provider.dart';

class NetworkCallController extends GetxController with StateMixin<JokeVO> {
  final NetworkProvider networkProvider = Get.put(NetworkProvider());

  @override
  void onInit() {
    super.onInit();
    getRandomJoke();
  }

  void getRandomJoke() async {
    change(null, status: RxStatus.loading());

    try {
      var result = await networkProvider.getRandomJoke();

      if (result.statusCode == 200) {
        change(JokeVO(id: "_", value: result.body?['value'] ?? "Unknown Joke"),
            status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error("${result.statusCode} - ${result.bodyString}"));
      }
    } on Exception catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void getInvalidJoke() async {
    change(null, status: RxStatus.loading());

    try {
      var result = await networkProvider.getInvalidJoke();

      if (result.statusCode == 200) {
        change(JokeVO(id: "_", value: result.body?['value'] ?? "Unknown Joke"),
            status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error("${result.statusCode} - ${result.bodyString}}"));
      }
    } on Exception catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
