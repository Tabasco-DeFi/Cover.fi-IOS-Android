import 'package:get/get.dart';

class LendStateController extends GetxController {
  List<String> currencies = <String>["USDT", "USDC", "DAI"];
  // final selected = <int, List<bool>>{}.obs;
  // Collections nested inside another collection has to be Rx<T> in order to be observable
  final selected = RxMap<int, RxList<bool>>({});

  initializePeriod(List<dynamic> data){
    for(int i = 0; i <data.length; i++){
      selected[i] = RxList.filled(data[i]["period"].length, false);
    }
  }

  int checkSelected(int currencyIdx){
    // selected[currencyIdx]! => RxList<bool>
    // selected[currencyIdx]!.toList() => List<bool>
    return selected[currencyIdx]!.toList().indexOf(true);
  }

  updateSelected(int currencyIdx, int index){
    // print(selected[currencyIdx]![index].runtimeType); => bool
    selected[currencyIdx]![index] = !selected[currencyIdx]![index];
  }
}