import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_project/questions_answers_screen.dart';

void main() {
  runApp(const MyApp());
}

enum SingingCharacter { first, lafayette, jefferson }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  List<dynamic> items = [];
  List<String> firstList = [];
  List<String> secondList = [];
  List<String> thirdList = [];

  List<String> fourthList = [];
  List<String> fifthList = [];
  List<String> sixthList = [];
  List<String> seventhList = [];

  List<String> valList = [];

  bool isChecked = false;

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    _loadJsonData();
    tabController = TabController(
      initialIndex: 0,
      length: 5,
      vsync: this,
    );
  }

  Future<void> _loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/Questions.json');
    setState(() {
      Map<String, dynamic> jsonData = json.decode(jsonString);
      items = jsonData['schema']['fields'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              bottom: TabBar(
                controller: tabController,
                padding: EdgeInsets.zero,
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.greenAccent,
                tabs: const [
                  Tab(
                    text: '',
                  ),
                  Tab(
                    text: '',
                  ),
                  Tab(
                    text: '',
                  ),
                  Tab(
                    text: '',
                  ),
                  Tab(
                    text: '',
                  ),
                ],
              ),
              title: const Text(
                'About Loan',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height -200,
                child: TabBarView(
                  controller: tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      child: items.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> currentField = items[0];
                                String name = currentField['schema']['label'];
                                List<dynamic> options =
                                    currentField['schema']['options'];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        name ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: options.map<Widget>((option) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0,
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              if (firstList
                                                  .contains(option['value'])) {
                                                firstList.remove(option['value']);
                                                setState(() {});
                                              } else if (firstList.isNotEmpty) {
                                                firstList.remove(option['value']);
                                                setState(() {});
                                              } else {
                                                firstList.add(option['value']);
                                                //valList.add(option['value']);
                                                setState(() {});
                                              }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 20),
                                              child: Row(
                                                children: [
                                                  firstList.contains(option['value'])
                                                      ? const Icon(
                                                          Icons.radio_button_checked,
                                                          color: Colors.orange,
                                                        )
                                                      : const Icon(
                                                          Icons.radio_button_off),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(option['value'] ?? '')
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                );
                              },
                            ),
                    ),
                    SizedBox(
                      child: items.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> currentField = items[1];
                                String name = currentField['schema']['label'];
                                List<dynamic> options =
                                    currentField['schema']['options'];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        name ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: options.map<Widget>((option) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: InkWell(
                                            onTap: () {
                                              if (secondList
                                                  .contains(option['value'])) {
                                                secondList.remove(option['value']);
                                                setState(() {});
                                              } else if (secondList.isNotEmpty) {
                                                secondList.remove(option['value']);
                                                setState(() {});
                                              } else {
                                                secondList.add(option['value']);
                                                setState(() {});
                                              }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 20),
                                              child: Row(
                                                children: [
                                                  secondList.contains(option['value'])
                                                      ? const Icon(
                                                          Icons.radio_button_checked,
                                                          color: Colors.orange,
                                                        )
                                                      : const Icon(
                                                          Icons.radio_button_off),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(option['value'] ?? '')
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                );
                              },
                            ),
                    ),
                    SizedBox(
                      child: items.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> currentField = items[2];
                                String name = currentField['schema']['label'];
                                List<dynamic> options =
                                    currentField['schema']['fields'];
                                List<dynamic> labels =
                                    options.map((item) => item['schema']).toList();
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        name ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (thirdList.contains(labels[0]['label'])) {
                                          thirdList.remove(labels[0]['label']);
                                          setState(() {});
                                        } else if (thirdList.isNotEmpty) {
                                          thirdList.remove(labels[0]['label']);
                                          setState(() {});
                                        } else {
                                          thirdList.add(labels[0]['label']);
                                          setState(() {});
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Row(
                                          children: [
                                            thirdList.contains(labels[0]['label'])
                                                ? const Icon(
                                                    Icons.radio_button_checked,
                                                    color: Colors.orange,
                                                  )
                                                : const Icon(Icons.radio_button_off),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(labels[0]['label'] ?? '')
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (fourthList.contains(labels[1]['label'])) {
                                          fourthList.remove(labels[1]['label']);
                                          setState(() {});
                                        } else if (fourthList.isNotEmpty) {
                                          fourthList.remove(labels[1]['label']);
                                          setState(() {});
                                        } else {
                                          fourthList.add(labels[1]['label']);
                                          setState(() {});
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Row(
                                          children: [
                                            fourthList.contains(labels[1]['label'])
                                                ? const Icon(
                                                    Icons.radio_button_checked,
                                                    color: Colors.orange,
                                                  )
                                                : const Icon(Icons.radio_button_off),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(labels[1]['label'] ?? '')
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                    ),
                    SizedBox(
                      child: items.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> currentField = items[3];
                                String name = currentField['schema']['label'];
                                List<dynamic> options =
                                    currentField['schema']['options'];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        name ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: options.map<Widget>((option) {
                                        return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: InkWell(
                                              onTap: () {
                                                if (fifthList
                                                    .contains(option['value'])) {
                                                  fifthList.remove(option['value']);
                                                  setState(() {});
                                                } else if (fifthList.isNotEmpty) {
                                                  fifthList.remove(option['value']);
                                                  setState(() {});
                                                } else {
                                                  fifthList.add(option['value']);
                                                  setState(() {});
                                                }
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.only(top: 20),
                                                child: Row(
                                                  children: [
                                                    fifthList
                                                            .contains(option['value'])
                                                        ? const Icon(
                                                            Icons
                                                                .radio_button_checked,
                                                            color: Colors.orange,
                                                          )
                                                        : const Icon(
                                                            Icons.radio_button_off),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(option['value'] ?? '')
                                                  ],
                                                ),
                                              ),
                                            ));
                                      }).toList(),
                                    ),
                                  ],
                                );
                              },
                            ),
                    ),
                    SizedBox(
                      child: items.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> currentField = items[4];
                                String name = currentField['schema']['label'];
                                List<dynamic> options =
                                    currentField['schema']['fields'];
                                List<dynamic> labels =
                                    options.map((item) => item['schema']).toList();
                                Map<String, dynamic> currentFieldName = items[4];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        labels[0]['label'] ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      ListView.builder(
                                          padding: const EdgeInsets.only(left: 40),
                                          shrinkWrap: true,
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            List<String> data = [
                                              currentFieldName['schema']['fields'][0]
                                                  ['schema']['options'][0]['value'],
                                              currentFieldName['schema']['fields'][0]
                                                  ['schema']['options'][1]['value'],
                                              currentFieldName['schema']['fields'][0]
                                                  ['schema']['options'][2]['value'],
                                            ];
                                            return InkWell(
                                              onTap: () {
                                                if (sixthList.contains(data[index])) {
                                                  sixthList.remove(data[index]);
                                                  setState(() {});
                                                } else if (sixthList.isNotEmpty) {
                                                  sixthList.remove(data[index]);
                                                  setState(() {});
                                                } else {
                                                  sixthList.add(data[index]);
                                                  setState(() {});
                                                }
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.only(top: 20),
                                                child: Row(
                                                  children: [
                                                    sixthList.contains(data[index])
                                                        ? const Icon(
                                                            Icons
                                                                .radio_button_checked,
                                                            color: Colors.orange,
                                                          )
                                                        : const Icon(
                                                            Icons.radio_button_off),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(data[index] ?? '')
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        labels[1]['label'] ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      ListView.builder(
                                          padding: const EdgeInsets.only(
                                            left: 40,
                                          ),
                                          shrinkWrap: true,
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            List<String> data = [
                                              currentFieldName['schema']['fields'][1]
                                                  ['schema']['options'][0]['value'],
                                              currentFieldName['schema']['fields'][1]
                                                  ['schema']['options'][1]['value'],
                                              currentFieldName['schema']['fields'][1]
                                                  ['schema']['options'][2]['value'],
                                            ];
                                            return InkWell(
                                              onTap: () {
                                                if (seventhList
                                                    .contains(data[index])) {
                                                  seventhList.remove(data[index]);
                                                  setState(() {});
                                                } else if (seventhList.isNotEmpty) {
                                                  seventhList.remove(data[index]);
                                                  setState(() {});
                                                } else {
                                                  seventhList.add(data[index]);
                                                  setState(() {});
                                                }
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.only(top: 20),
                                                child: Row(
                                                  children: [
                                                    seventhList.contains(data[index])
                                                        ? const Icon(
                                                            Icons
                                                                .radio_button_checked,
                                                            color: Colors.orange,
                                                          )
                                                        : const Icon(
                                                            Icons.radio_button_off),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(data[index] ?? '')
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      Center(
                                        child: TextButton(
                                          onPressed: () {
                                            valList
                                              ..addAll(firstList)
                                              ..addAll(secondList)
                                              ..addAll(thirdList)
                                              ..addAll(fourthList)
                                              ..addAll(fifthList)
                                              ..addAll(sixthList)
                                              ..addAll(seventhList);
                                            if(valList.isNotEmpty){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      QuestionsAnswersScreen(
                                                        questionsData: valList,
                                                      ),
                                                ),
                                              );
                                            }

                                          },
                                          child: const Text('Next Page'),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                    )
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (tabController != null && tabController.index > 0) {
                      tabController.animateTo(tabController.index - 1);
                      setState(() {});
                    }
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back_ios_new_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Back'),
                    ],
                  ),
                ),
                tabController.index == 4
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          if (tabController != null &&
                              tabController.index < 4) {
                            tabController.animateTo(tabController.index + 1);
                          }
                        },
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.orange,
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
