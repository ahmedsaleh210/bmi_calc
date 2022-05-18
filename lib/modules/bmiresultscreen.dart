import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  final double result;
  final bool isMale;
  final int age;
  const BmiResult({Key? key,
    required this.result,
    required this.age,
    required this.isMale,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.black,
      ),
      body:
      Container(
        color: Colors.black38,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 200),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
                  color:Colors.grey[300]
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(image: AssetImage('assets/images/bmi.png'),
                    height: 100,
                    width: 100,),
                  const SizedBox(height: 40,),
                  Text('Gender:${isMale ? 'MALE' : 'FEMALE'}',
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  const SizedBox(height: 10,),
                  Text('Age:$age',
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text('Result:$result',
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
