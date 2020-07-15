import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandling{
  var log = Logger();
  //TODO: add base url here
  String baseurl = "enter url here";
  Future<dynamic> get(String url) async{
    //user/register
    url = formatter(url);
    var response = await http.get(url);
    log.i(response.body);
    log.i(response.statusCode);
  }

  String formatter(String url){
    return baseurl+url;
  }

  //putting data into database
  Future<dynamic> post(String url, Map<String,String>body) async{
    
    url = formatter(url);
    var response = await http.post(url, body: body);
    if(response.statusCode== 200 || response.statusCode == 201){
      log.i(response.body);
      return response;
    }
    log.d(response.body);
    log.i(response.statusCode);
  }
}