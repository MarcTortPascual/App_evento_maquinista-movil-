import 'package:app_maquinista/model/companies.dart';
import 'package:app_maquinista/model/meetings.dart';
import 'package:app_maquinista/model/net/Netload.dart';
import 'package:app_maquinista/model/projectos.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



class NetMeetings extends Netload<Meetings> {
  NetMeetings(int limit) :super(limit,"presentationsPages","presentations");


  // Obtener página
  @override
  Future<List<Meetings>> get_page(int pages) async {
    var json  = await get_items_page(pages);
    return json.map((i) => Meetings.fromjson(i)).toList();
  }
}