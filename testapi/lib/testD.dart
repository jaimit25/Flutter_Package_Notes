import 'package:dio/dio.dart';

class testD {
  String? url;

  testD() {
    print("DIO INIT");
    url = 'https://jsonplaceholder.typicode.com/users';
  }

  testD.custom(url) {
    this.url = url;
  }

  Dio dio = Dio();

  getData() async {
    var response = await dio.get(url!);
    print("Data is : " + response.data.toString());
    return response.data;
  }
}
