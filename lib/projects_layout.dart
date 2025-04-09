import 'package:app_maquinista/main.dart';
import 'package:app_maquinista/model/net/Netload.dart';
import 'package:app_maquinista/model/net/net_filter_projects.dart';
import 'package:app_maquinista/model/net/net_projects.dart';
import 'package:flutter/material.dart';
import 'package:app_maquinista/model/projectos.dart';
import 'package:app_maquinista/model/dinamicTest.dart';
import 'custom_widgets/project_cards.dart';
import 'custom_widgets/line_painter.dart';
import 'model/net/net_projects.dart';
import 'project_individual_layout.dart';
const Map<String,int>spe_idspe ={
  "GS Automoción":4 ,
  "GM Electromecánica":1,
  "GM Carrocería" : 3,
  "GM Motocicletas" : 2
};
class ProjectsLayout extends StatefulWidget {
  ProjectsLayout({
    super.key,
    required this.projects,
    required this.proj_mng,
    required this.monlauTech_mng,
    required this.monlauTechPrj,
  });

  Netload proj_mng;
  NetProjects proj_all = NetProjects(0,"","");
  NetFilterProjects filter_mng_students = NetFilterProjects(7);
  NetFilterProjects filter_mng_tittle = NetFilterProjects(7);
  NetFilterProjects filter_mng_course = NetFilterProjects(7);
  List<Proyecto> projects;

  Netload monlauTech_mng;
  final List<DinamicTest> monlauTechPrj;
  int current = 1;
  final ScrollController scController = ScrollController();

  @override
  _ProjectsLayout createState() => _ProjectsLayout();
}

class _ProjectsLayout extends State<ProjectsLayout>
    with SingleTickerProviderStateMixin {
  String _filterSelectOption = "Todos";
  final List<String> _filter = [
    "Todos",
    "GS Automoción",
    "GM Electromecánica",
    "GM Carrocería",
    "GM Motocicletas",
    "Num. Tribunal"
  ];
  List<Proyecto> filteredProjects = [];

  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  
  List<Proyecto> filtrar (List<Proyecto> prjs){
   
    if (_filterSelectOption != "Todos"){
      return prjs.where((test) => test.NivelEstudios == _filterSelectOption).toList();
    } else if (_filterSelectOption != "Num. Tribunal") {
      return prjs.where((test) => test.Box == _filterSelectOption).toList();
    } else{
      return prjs;
    }
  }
  @override
  void initState() {
    super.initState();
    widget.proj_all = proj_mng;

    _tabController = TabController(length: 2, vsync: this);
    filteredProjects = widget.projects; // Inicializar con todos los proyectos
    _searchController.addListener(()=>_filterProjectos(widget.current));
   
    widget.scController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();

    widget.scController.removeListener(_onScroll);
    widget.scController.dispose();
    super.dispose();
  }

  // Filtrar proyectos basados en el texto de búsqueda y el filtro seleccionado
  void _filterProjectos(int page) async {
    final query = _searchController.text.toLowerCase();
    if (query.isNotEmpty && _filterSelectOption == "Todos"){
      List<Proyecto> projs = [];
      widget.current = 1;
      
      widget.filter_mng_tittle.value = query;
      widget.filter_mng_students.value = query;
      widget.filter_mng_tittle.where = "title";
      widget.filter_mng_students.where = "student";
      widget.filter_mng_course.where ="idSpecialization";
      projs.addAll(await widget.filter_mng_tittle.get_page(page));
      projs.addAll(await widget.filter_mng_students.get_page(page));
      
      setState(() {
          widget.projects = projs;
      });
    }else if(query.isEmpty && _filterSelectOption != "Todos"){
      
      widget.filter_mng_course.where ="idSpecialization";
      widget.filter_mng_course.value = spe_idspe[_filterSelectOption].toString();
      List<Proyecto> a = await widget.filter_mng_course.get_page(page);
      setState(() {
        widget.projects = a;
      });

    }else if(query.isEmpty && _filterSelectOption == "Todos"){
      List<Proyecto> a = await widget.proj_mng.get_page(widget.current) as List<Proyecto>;
      setState(() {
          widget.projects = a;
      });
    }else if (query.isNotEmpty && _filterSelectOption != "Todos"){
      List<Proyecto> projs = [];
      widget.current = 1;
      
      widget.filter_mng_tittle.value = query;
      widget.filter_mng_students.value = query;
      widget.filter_mng_tittle.where = "title";
      widget.filter_mng_students.where = "student";
      widget.filter_mng_course.where ="idSpecialization";
      projs.addAll(await widget.filter_mng_tittle.get_page(page));
      projs.addAll(await widget.filter_mng_students.get_page(page));
      
      setState(() {
          widget.projects = filtrar(projs);
      });
    }
  }

  // Cargar más proyectos cuando se llega al final de la lista
  void _onScroll() {
    /*widget.scController.position.pixels != 0 && widget.scController.position.atEdge */
    if (widget.scController.position.pixels >= widget.scController.position.maxScrollExtent - 200) {
      _loadMoreProjects();
    }
  }

  Future<void> _loadMoreProjects() async {
    if (widget.current <= widget.proj_mng.available_pages) {
      _filterProjectos(widget.current);
      widget.current ++;
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 110,
                child: Image.asset('assets/img/logomonlau.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.transparent)),
                            ),
                            child: TabBar(
                              controller: _tabController,
                              indicator: const BoxDecoration(),
                              dividerColor: Colors.transparent,
                              indicatorColor: Colors.blue,
                              labelColor: Colors.blue,
                              unselectedLabelColor: Colors.grey,
                              labelPadding: EdgeInsets.symmetric(
                                  horizontal: MediaQuery.of(context).size.width * 0.02, vertical: 0),
                              isScrollable: true,
                              tabAlignment: TabAlignment.start,
                              tabs: const [
                                Tab(text: "Proyectos"),
                                Tab(text: "MonlauTech"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 10),
                      child: DropdownButton<String>(
                        value: _filter.contains(_filterSelectOption)
                            ? _filterSelectOption
                            : null,
                        hint: const Text("Selecciona una opción"),
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                        dropdownColor: Colors.white,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _filterSelectOption = newValue!;
                        
                            
                          });
                          _filterProjectos(widget.current);
                         
                        },
                        items: _filter.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: const TextStyle(color: Colors.black)),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  CustomPaint(
                    size: Size(100, 10),
                    painter: LinePainter(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Buscar proyecto',
                    //prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
             
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [_projects(), _monlauTech()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _projects() {
    return ListView.builder(
      controller: widget.scController,
      padding: EdgeInsets.zero,
      itemCount: widget.projects.length, // Usar la lista filtrada
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProjectIndividualLayout(
                  project: widget.projects[index], // Usar la lista filtrada
                ),
              ),
            );
          },
          child: ProjectCards(
            projecto:widget.projects[index], // Usar la lista filtrada
          ),
        );
      },
    );
  }

  Widget _monlauTech() {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: widget.monlauTechPrj.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProjectIndividualLayout(
                  project: widget.monlauTechPrj[index],
                ),
              ),
            );
          },
          child: ProjectCards(
            projecto: widget.monlauTechPrj[index],
          ),
        );
      },
    );
  }
}