

import 'package:flutter/material.dart';
import 'package:app_maquinista/model/projectos.dart';
import 'package:app_maquinista/model/net/net_projects.dart';
import 'custom_widgets/project_cards.dart';
import 'custom_widgets/line_painter.dart';
import 'project_individual_layout.dart';

class ProjectsLayout extends StatefulWidget {
  ProjectsLayout({super.key, required this.projects, required this.projects_mng});

  final NetProjects projects_mng;
  final List<Proyecto> projects;
  int current = 1;
  final ScrollController scController = ScrollController();

  @override
  _ProjectsLayoutState createState() => _ProjectsLayoutState();
}

class _ProjectsLayoutState extends State<ProjectsLayout> {
  String _filterSelectOption = "Todos";
  final List<String> _filter = [
    "Todos",
    "CFGS Automación",
    "CFGM Electromecánica",
    "CFGM Carrocería",
    "CFGM Motocicletas"
  ];

  @override
  void initState() {
    super.initState();
    widget.scController.addListener(_onScroll);
  }

  void _onScroll() {
    if (widget.scController.position.pixels >= widget.scController.position.maxScrollExtent) {
      _loadMoreProjects();
    }
  }

  Future<void> _loadMoreProjects() async {
    if (widget.current <= widget.projects_mng.available_pages) {
      List<Proyecto> newProjects = await widget.projects_mng.get_page(widget.current);
      if (newProjects.isNotEmpty) {
        setState(() {
          widget.projects.addAll(newProjects);
          widget.current++;
        });
      }
    }
  }

  @override
  void dispose() {
    widget.scController.removeListener(_onScroll);
    widget.scController.dispose();
    super.dispose();
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
                          SizedBox(
                            width: 150,
                            child: Text(
                              "Proyectos",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                          const SizedBox(width: 110),
                        ],
                      ),
                    ),
                    DropdownButton<String>(
                      value: _filter.contains(_filterSelectOption)
                          ? _filterSelectOption
                          : null,
                      hint: Text("Selecciona una opción"),
                      icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                      dropdownColor: Colors.white,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _filterSelectOption = newValue!;
                        });
                      },
                      items: _filter.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: const TextStyle(color: Colors.black)),
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
                child: ListView.builder(
                  controller: widget.scController,
                  padding: EdgeInsets.zero,
                  itemCount: widget.projects.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProjectIndividualLayout(project: widget.projects[index],)
                        ));
                      },
                      child: ProjectCards(
                          projecto: widget.projects[index],
                        ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
