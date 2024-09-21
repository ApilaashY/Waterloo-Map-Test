import 'dart:math';

import 'package:flutter/material.dart';
import 'modules/routes.dart' as routes;

final List<List<String>> buildings = [
  ["ACW", "Accelerator Centre Waterloo"],
  ["AL", "Arts Lecture Hall"],
  ["AVR", "Autonomous Vehicle Research &Intelligence Laboratory (AVRIL)"],
  ["B1", "Biology 1"],
  ["B2", "Biology 2"],
  ["BMH", "H B.C. Matthews Hall"],
  ["BRH", "Brubacher House"],
  ["BSC", "Bright Starts Co-operative Early Learning Centre"],
  ["C2", "Chemistry 2"],
  ["CGR", "Conrad Grebel University College"],
  ["CIF", "Columbia Icefield"],
  ["CLN", "Columbia Lake Village North"],
  ["CLV", "Columbia Lake Village"],
  ["CMH", "Claudette Millar Hall"],
  ["COG", "Columbia Greenhouses"],
  ["COM", "Commissary"],
  ["CPH", "Carl A. Pollock Hall"],
  ["CSB", "Central Services Building"],
  ["DC", "William G. Davis Computer"],
  ["Research", "Centre"],
  ["DWE", "Douglas Wright Engineering Building"],
  ["E2", "Engineering 2"],
  ["E3", "Engineering 3"],
  ["E5", "Engineering 5"],
  ["E6", "Engineering 6"],
  ["E7", "Engineering 7"],
  ["EC1", "East Campus 1"],
  ["EC2", "East Campus 2"],
  ["EC3", "East Campus 3"],
  ["EC4", "East Campus 4"],
  ["EC5", "East Campus 5"],
  ["ECH", "East Campus Hall"],
  ["EIT", "Centre for Environmental &"],
  ["Information", "Technology"],
  ["ERC", "Energy Research Centre"],
  ["ESC", "Earth Sciences & Chemistry"],
  ["EV1", "Environment 1"],
  ["EV2", "Environment 2"],
  ["EV3", "Environment 3"],
  ["EXP", "Health Expansion Building"],
  ["FED", "Federation Hall"],
  ["GH", "Graduate House"],
  ["GSC", "General Services Complex"],
  ["HH", "J.G. Hagey Hall of the Humanities"],
  ["HS", "Health Services"],
  ["LHI", "Lyle S. Hallman Institute for Health"],
  ["Promotion", ""],
  ["LIB", "Dana Porter Library"],
  ["M3", "Mathematics 3"],
  ["MC", "Mathematics & Computer Building"],
  ["MHR", "Minota Hagey Residence"],
  ["MKV", "William Lyon Mackenzie King Village"],
  ["ML", "Modern Languages"],
  ["NH", "Ira G. Needles Hall and Extension"],
  ["OPT", "School of Optometry and"],
  ["Vision", "Science"],
  ["PAC", "Physical Activities Complex"],
  ["PAS", "Psychology, Anthropology, Sociology"],
  ["PHY", "Physics"],
  ["QNC", "Mike & Ophelia Lazaridis"],
  ["Quantum-Nano", "Centre"],
  ["RAC", "Research Advancement Centre"],
  ["RA2", "Research Advancement Centre 2"],
  ["RCH", "J.R. Coutts Engineering Lecture Hall"],
  ["REN", "Renison University College"],
  ["REV", "Ron Eydt Village"],
  ["SCH", "South Campus Hall"],
  ["SLC", "Student Life Centre"],
  ["STC", "Science Teaching Complex"],
  ["STJ", "St. Jerome's University"],
  ["TC", "William M. Tatham Centre for"],
  ["Co-operative", "Education &"],
  ["Career", "Action"],
  ["TJB", "Toby Jenkins Applied Health"],
  ["Research", "Building"],
  ["TH", "Tutors' Houses"],
  ["UC", "University Club"],
  ["UTD", "United College"],
  ["UWP", "University of Waterloo Place"],
  ["V1", "Student Village 1"],
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: routes.controller,
      initialRoute: "Home",
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int buildingIndex = -1;
  List<List<String>> gameBuildings = List.from(buildings);
  Random rand = Random();
  bool choosing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${buildings.length - gameBuildings.length + 1}/${buildings.length} Completed",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 30),
            Text(
              "${gameBuildings.length - 1}/${buildings.length} Left",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 30),
            Text(
              "Building: ${(buildingIndex >= 0) ? gameBuildings[buildingIndex][0] : ""}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                if (gameBuildings.length == 1) {
                  showDialog(
                      context: context,
                      builder: (context) => const AlertDialog.adaptive(
                            title: Text("No more buildings"),
                          ));
                  return;
                }
                if (choosing) return;
                choosing = true;
                print(gameBuildings.length);
                if (gameBuildings.length > 1 && buildingIndex >= 0)
                  print(gameBuildings.removeAt(buildingIndex));
                setState(() {
                  buildingIndex = rand.nextInt(gameBuildings.length);
                });

                await showDialog(
                  context: context,
                  builder: (context) => AlertDialog.adaptive(
                    title: Text(
                      "Building: ${(buildingIndex >= 0) ? "${gameBuildings[buildingIndex][0]} - ${gameBuildings[buildingIndex][1]}" : ""}",
                    ),
                  ),
                );
                choosing = false;
              },
              child: const Text("Randomize"),
            )
          ],
        ),
      ),
    );
  }
}
