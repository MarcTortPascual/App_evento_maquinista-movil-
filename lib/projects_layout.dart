import 'package:app_maquinista/model/projectos.dart';
import 'package:app_maquinista/model/students.dart';
import 'package:flutter/material.dart';
import 'custom_widgets/project_cards.dart';
import 'custom_widgets/line_painter.dart';
import 'project_individual_layout.dart';
import 'model/net/net_projects.dart';

class ProjectsLayout extends StatefulWidget {
  ProjectsLayout({super.key, required this.projects, required this.proj_mng});
  NetProjects proj_mng;
  List<Proyecto> projects;
  int current = 0;
  @override
  _ProjectsLayout createState() => _ProjectsLayout();
}

class _ProjectsLayout extends State<ProjectsLayout>
    with SingleTickerProviderStateMixin {
  String _filterSelectOption = "Todos";
  ScrollController Sc_Lw = ScrollController();
  final List<String> _filter = [
    "Todos",
    "CFGS Automación",
    "CFGM Electromecánica",
    "CFGM Carrocería",
    "CFGM Motocicletas"
  ];
  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Sc_Lw.addListener(() {
      if ((Sc_Lw.position.minScrollExtent < Sc_Lw.position.pixels &&
          Sc_Lw.position.maxScrollExtent - 100 > Sc_Lw.position.pixels)) {
        setState(() {
          widget.proj_mng.get_page(widget.current).then((proj) {
            if (widget.current <= widget.proj_mng.available_pages) {
              print("projectos ");
              print(proj);
              widget.projects.addAll(proj);
              widget.current++;
              print("actual page " + widget.current.toString());
            }
          });
        });
      }
    });

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
                                  bottom:
                                      BorderSide(color: Colors.transparent)),
                            ),
                            child: TabBar(
                              controller: _tabController,
                              indicator: const BoxDecoration(),
                              dividerColor: Colors.transparent,
                              indicatorColor: Colors.blue,
                              labelColor: Colors.blue,
                              unselectedLabelColor: Colors.grey,
                              labelPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              isScrollable: true,
                              tabAlignment: TabAlignment.start,
                              tabs: [
                                Tab(text: "Proyectos"),
                                Tab(text: "MonlauTech"),
                              ],
                            ),
                          ),
                          //const SizedBox(width: 110),
                        ],
                      ),
                    ),
                    DropdownButton<String>(
                      value: _filter.contains(_filterSelectOption)
                          ? _filterSelectOption
                          : null,
                      hint: Text("Selecciona una opción"),
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.black),
                      dropdownColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      underline: Container(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _filterSelectOption = newValue!;
                        });
                      },
                      items:
                          _filter.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: const TextStyle(color: Colors.black)),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  CustomPaint(
                    size: Size(100, 10),
                    painter: LinePainter(),
                  )
                ],
              ),
              Expanded(
                  child: TabBarView(
                      controller: _tabController,
                      children: [_projects(), _monlauTech()]))
            ],
          ),
        ),
      ),
    );
  }

  Widget _projects() {
    return SafeArea(
      child: Expanded(
          child: ListView.builder(
        controller: Sc_Lw,
        padding: EdgeInsets.zero,
        itemCount: widget.projects.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProjectIndividualLayout(
                            project: widget.projects[index],
                          )));
            },
            child: ProjectCards(
              projecto: widget.projects[index],
            ),
          );
        },
      )),
    );
  }

  Widget _monlauTech() {
    return SafeArea(
      child: Expanded(child: Column()),
    );
  }
}
