import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(child: Text('Maximun number of people')),
                      SizedBox(
                        width: 120,
                        child: Row(
                          children: [
                            IconButton(onPressed: oneMorePeople, icon: const Icon(Icons.arrow_drop_up)),
                            Text(numberMaxPeople.toString()),
                            IconButton(onPressed: numberMaxPeople <= 2 ? null : oneLessPeople, icon: const Icon(Icons.arrow_drop_down)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Card(
                      color: attentionManyPeople ? Colors.redAccent : Colors.white70,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Quantidade de pessoas $peopleCount'),
                      )),
                  ElevatedButton(
                    onPressed: majorNumberPeopleIs ? null : oneMore,
                    child: const Text('+1'),
                  ),
                  ElevatedButton(
                    onPressed: minorZeroIs ? null : oneLess,
                    child: const Text('-1'),
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
