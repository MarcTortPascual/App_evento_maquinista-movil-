import 'package:app_maquinista/main.dart';
import 'package:app_maquinista/model/net/Netload.dart';
import 'package:app_maquinista/model/net/net_filter_projects.dart';
import 'package:flutter/material.dart';
import 'package:app_maquinista/model/projectos.dart';
import 'package:app_maquinista/model/dinamicTest.dart';
import 'custom_widgets/project_cards.dart';
import 'custom_widgets/line_painter.dart';
import 'model/net/net_projects.dart';
import 'project_individual_layout.dart';

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
    _searchController.addListener(()=>_filterProjectos());
   
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
  void _filterProjectos() async {
    final query = _searchController.text.toLowerCase();
    if (query.isNotEmpty){
      List<Proyecto> projs = [];
      widget.current = 1;
      
      widget.filter_mng_tittle.value = query;
      widget.filter_mng_students.value = query;
      widget.filter_mng_tittle.where = "title";
      widget.filter_mng_students.where = "student";
      projs.addAll(await widget.filter_mng_tittle.get_page(1));
      projs.addAll(await widget.filter_mng_students.get_page(1));
      setState(() {
          widget.projects = filtrar(projs);
      });
    }else{
      widget.current = 1;
      widget.proj_mng = widget.proj_all;
      widget.projects = widget.projects = filtrar(await widget.proj_mng.get_page(1) as List<Proyecto>);
    }
  }

  // Cargar más proyectos cuando se llega al final de la lista
  void _onScroll() {
    if (widget.scController.position.pixels != 0 && widget.scController.position.atEdge) {
      _loadMoreProjects();
    }
  }

  Future<void> _loadMoreProjects() async {
    if (widget.current <= widget.proj_mng.available_pages) {
      final query = _searchController.text.toLowerCase();
      if (query.isNotEmpty){
        List<Proyecto> newProjects = await widget.filter_mng_students.get_page(widget.current) ;
        
        newProjects.addAll(await widget.filter_mng_tittle.get_page(widget.current));
        if (newProjects.isNotEmpty) {
          setState(() {
            widget.projects.addAll(filtrar(newProjects));
            widget.current ++;
          });
        }
      }
      else{
        List<Proyecto> newProjects = await widget.proj_mng.get_page(widget.current) as List<Proyecto>;
        if (newProjects.isNotEmpty) {
          setState(() {
            widget.projects.addAll(filtrar(newProjects));
            widget.current++;
          });
        }
      }
      
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
                            _filterProjectos(); // Aplicar filtro cuando cambia la selección
                          });
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