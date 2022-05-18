import 'package:flutter/material.dart';
import 'dart:math';
import 'bmiresultscreen.dart';


class BmiCalc extends StatefulWidget {
  const BmiCalc({Key? key}) : super(key: key);



  @override
  _BmiCalcState createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {

Color? color = Colors.grey[300];
bool isMale=true;
double height = 120.0;
int weight = 40;
int age = 18;
//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('BMI Calculator'),
      ),
      body:
  Container(
    color: Colors.black38,
    child: Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap:(){
                      setState(() {
                        isMale=true;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(image: AssetImage('assets/images/male.png'),
                        height: 90,
                        width: 90,),
                        SizedBox(height: 5,),
                        Text('MALE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30

                        ),),
                      ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: isMale ? Colors.red : Colors.grey[300]
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isMale=false;
                      });
                    },
                    child: Container(
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(image: AssetImage('assets/images/female.png'),
                            height: 90,
                            width: 90,),
                          SizedBox(height: 5,),
                          Text('FEMALE',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30

                            ),),
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: isMale ? Colors.grey[300] : Colors.red
                      ),
                    ),
                  ),

                ),

              ],
             ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30

                    ),
                  ),
                  const SizedBox(height:10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('${height.round()}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30

                        ),
                      ),
                      const SizedBox(width: 5,),
                      const Text('CM',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15

                        ),
                      ),
                    ],
                  ),
                  Slider(value: height,
                      onChanged: (value)
                    {
                      setState(() {
                        height = value;
                      });
                    },
                    max:220,
                    min:80,
                    activeColor: Colors.red,
                  ),

                ],
                  ),

            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const Text("WEIGHT",
                       style: TextStyle(
                         fontSize: 30,
                           fontWeight: FontWeight.bold
                       ),),
                        Text(
                            "$weight",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            FloatingActionButton(onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                              heroTag: 'weight++',
                              backgroundColor: Colors.red,
                              mini: true,
                            child: const Icon(
                              Icons.add

                            ),
                            ),

                            FloatingActionButton(onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                              heroTag: 'weight--',
                              backgroundColor: Colors.red,
                              mini: true,
                              child: const Icon(
                                  Icons.remove

                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[300]
                    ),
                  ),
                ),
                const SizedBox(width:10,),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("AGE",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                        Text(
                          "$age",
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            FloatingActionButton(onPressed: (){
                              setState(() {
                                age++;
                              });
                            },
                              heroTag: 'age++',
                              backgroundColor: Colors.red,
                              mini: true,
                              child: const Icon(
                                  Icons.add

                              ),
                            ),

                            FloatingActionButton(onPressed: (){
                              setState(() {
                                age--;
                              });
                            },
                              heroTag: 'age--',
                              backgroundColor: Colors.red,
                              mini: true,
                              child: const Icon(
                                  Icons.remove

                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[300]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 50.0,
          width: double.infinity,
          color: Colors.red,
          child: MaterialButton(onPressed: (){
            var result = weight / pow(height.round()/100,2);
            Navigator.push(context, MaterialPageRoute(builder: (context) => BmiResult(
              age: age,
              isMale: isMale,
              result: double.parse(result.toStringAsFixed(2)),
            )
            ));
          },
       child: const Text(
           'Calculate',
         style: TextStyle(
           color: Colors.white,
           fontWeight: FontWeight.bold,
         ),
       ),
          ),
        )
      ],
    ),
  )
    );
  }
}
