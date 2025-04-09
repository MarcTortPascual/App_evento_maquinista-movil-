import 'dart:io';

import 'package:app_maquinista/custom_widgets/pop_up_speaker_card.dart';
import 'package:app_maquinista/model/net/net_monlautech.dart';
import 'package:app_maquinista/project_individual_layout.dart';

import 'custom_widgets/custom_card.dart';
import 'custom_widgets/line_painter.dart';

import 'custom_widgets/pop_up_speaker_card.dart';
import 'exhibitors_layout.dart';

import 'model/companies.dart';
import 'model/dinamicTest.dart';
import 'model/meetings.dart';
import 'model/net/http_overwide.dart';
import 'model/net/net_companies.dart';
import 'model/net/net_meetings.dart';
import 'model/net/net_projects.dart';
import 'model/projectos.dart';

import 'map_layout.dart';

import 'projectos_detalles_page.dart';
import 'projects_layout.dart';

import 'speakers_layout.dart';
import 'title_section.dart';

import 'package:flutter/material.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monlau MotorSport',
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

//lista para guardar los datos cargados de la bbdd
List<Proyecto> projectos = [];
List<Meetings> meets = [];
List<DinamicTest> testdinamicos = [];
List<DinamicTest> monlautech = [];
List<Companies> companies = [];

//Inicializamos las classes para cargar los datos
NetProjects proj_mng = NetProjects(10, "projectsPages", "projects");
NetMonalautech mont_mng = NetMonalautech(10);
NetCompanies com_mng = NetCompanies(70);
NetMeetings met_mng = NetMeetings(10);

//classe pricipal del widget del la pantalla de inicio
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<int> load() async {
    projectos = await proj_mng.get_page(1);
    monlautech = await mont_mng.get_page(1);
    companies = await com_mng.get_page(1);
    meets = await met_mng.get_page(1);
    return 1;
  }

  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    load();
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _homeScreen(),
          ProjectsLayout(projects: projectos,proj_mng: proj_mng, monlauTech_mng: mont_mng, monlauTechPrj: monlautech),
          MapLayout(),
          SpeakersLayout(
            ponencias: meets,
          ),
          ExhibitorsLayout(companies: companies,),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Inicio',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_crash, color: Colors.white),
              label: 'Proyectos',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.map, color: Colors.white),
              label: 'Mapa',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.flag, color: Colors.white),
              label: 'Ponentes',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_home_work_sharp, color: Colors.white),
              label: 'Expositores',
              backgroundColor: Colors.black),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black,
      ),
    );
  }

  Widget _homeScreen() {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Ytvideo(
                  videoUrl: 'https://youtu.be/O5OcIboxnkw',
                  hide_control: true,
                  is_muted: true,
                ))
              ],
            ),
            Row(children: [
              Expanded(
                  child: TitleSection(
                title: 'DESCUBRE TODOS LOS PROYECTOS',
                subtitle: 'PROYECTOS',
                onTitleTap: () {},
                onSubtitleTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProjectsLayout(
                          projects: projectos,
                          proj_mng: proj_mng,
                          monlauTech_mng: mont_mng,
                          monlauTechPrj: testdinamicos,
                        ),
                      )
                  );
                },
              ))
            ]),
            Row(children: [
              CustomPaint(size: const Size(100, 10), painter: LinePainter())
            ]),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 130, // Altura fija para el ListView horizontal
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: projectos.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProjectIndividualLayout(
                                    project: projectos[index]),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 4,
                              child: Container(
                                width: 250,
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      projectos[index].Titulo ??
                                          "Título por defecto",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      projectos[index].Autor[0].name ??
                                          "Sin descripción",
                                      style: const TextStyle(fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(children: [
              CustomPaint(size: const Size(100, 10), painter: LinePainter())
            ]),
            Row(children: [
              Expanded(
                  child: TitleSection(
                title: 'DESCUBRE LOS PONENTES',
                subtitle: 'PONENTES',
                onTitleTap: () {},
                onSubtitleTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SpeakersLayout(ponencias: meets)
                        ),
                      );
                  },
              ))
            ]),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: meets.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showDialog(context: context, builder: (BuildContext context) {
                        return SpeakersPopUpCArd(speakers: meets[index].speakers[0]);
                      });
                    },
                    child: CustomCard(
                        title: meets[index].name ?? "Título por defecto",
                        time: meets[index].initTime ?? "00:00",
                        imageUrl: "",
                        description:
                            meets[index].description ?? "Sin descripción"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _placeholderScreen(String title) {
    return Center(child: Text(title, style: const TextStyle(fontSize: 24)));
  }
}
