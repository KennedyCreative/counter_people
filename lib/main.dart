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
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('+1'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
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
