
import 'package:app_maquinista/model/companies.dart';
import 'package:app_maquinista/model/net/Netload.dart';
import 'package:app_maquinista/model/projectos.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



class NetCompanies extends Netload<Companies> {
  NetCompanies(int limit) :super(limit,"companiesPages","companies");


  // Obtener página
  @override
  Future<List<Companies>> get_page(int pages) async {
    var json  = await get_items_page(pages);
    return json.map((i) => Companies.fromJson(i)).toList();
  }
}