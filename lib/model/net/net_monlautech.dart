import 'package:app_maquinista/model/dinamicTest.dart';
import 'package:app_maquinista/model/net/Netload.dart';
import 'package:app_maquinista/model/net/net_projects.dart';
import 'package:app_maquinista/model/projectos.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetMonalautech extends NetProjects{
  NetMonalautech(int limit) :super(limit,"monlautechPages","monlautech");

  @override
  Future<List<DinamicTest>> get_page(int pages) async {
    var json  = await get_items_page(pages);
    return json.map((i) => DinamicTest.fromJson(i, server)).toList();
  }
}
