
import 'package:app_maquinista/model/dinamicTest.dart';
import 'package:app_maquinista/model/net/Netload.dart';
import 'package:app_maquinista/model/net/net_projects.dart';
import 'package:app_maquinista/model/projectos.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



class NetMonalautech extends NetProjects{
  //aqui pado los endpoints directamente
  NetMonalautech(int limit) :super(limit,"dinamicTestPages","dynamictestings");
}
