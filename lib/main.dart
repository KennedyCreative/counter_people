import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CounterPeople(),
  ));
}

class CounterPeople extends StatefulWidget {
  const CounterPeople({super.key});

  @override
  State<CounterPeople> createState() => _CounterPeopleState();
}

class _CounterPeopleState extends State<CounterPeople> {
  Size get size => MediaQuery.of(context).size;

  int peopleCount = 1;
  int numberMaxPeople = 20;

  bool get minorZeroIs => peopleCount <= 0;
  bool get majorNumberPeopleIs => peopleCount >= numberMaxPeople;
  bool get attentionManyPeople => peopleCount >= (numberMaxPeople - (numberMaxPeople * 0.20));

  void oneMore() => setState(() => peopleCount++);
  void oneLess() => setState(() => peopleCount--);

  void oneMorePeople() => setState(() => numberMaxPeople++);
  void oneLessPeople() => setState(() => numberMaxPeople--);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/bar.jpg',
                fit: BoxFit.cover,
                height: size.height,
                width: size.width,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Maximun number of people',
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                        SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              IconButton(onPressed: oneMorePeople, icon: const Icon(Icons.arrow_drop_up)),
                              Text(
                                numberMaxPeople.toString(),
                                style: const TextStyle(fontSize: 18),
                              ),
                              IconButton(onPressed: numberMaxPeople <= 2 ? null : oneLessPeople, icon: const Icon(Icons.arrow_drop_down)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                      margin: const EdgeInsets.symmetric(vertical: 80),
                      color: attentionManyPeople ? Colors.redAccent : Colors.white70,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          peopleCount.toString(),
                          style: const TextStyle(fontSize: 30),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: minorZeroIs ? null : oneLess,
                        child: const Text(
                          '-1',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      const SizedBox(width: 30),
                      ElevatedButton(
                        onPressed: majorNumberPeopleIs ? null : oneMore,
                        child: const Text(
                          '+1',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
