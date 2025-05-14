import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_ruler_picker/simple_ruler_picker.dart';

import '../blocs/height/height_bloc.dart';
import '../blocs/height/height_event.dart';
import '../blocs/height/height_state.dart';

class HeightScreen extends StatelessWidget {
  const HeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HeightBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const BackButton(),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: const Text("Skip",
                  style: TextStyle(color: Color.fromARGB(255, 82, 46, 210))),
            )
          ],
        ),
        body: BlocBuilder<HeightBloc, HeightState>(
          builder: (context, state) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: LinearProgressIndicator(
                    value: 1.0,
                    color: Color.fromARGB(255, 82, 46, 210),
                    backgroundColor: Colors.grey, //same
                  ),
                ),
                const SizedBox(height: 20),
                const Text("What’s your height?",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Text("Help us to create your personalize plan",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 82, 46, 210),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    child: Text(
                      "cm",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/human.svg'),
                      const SizedBox(width: 20),
                      RotatedBox(
                        quarterTurns: -1,
                        child: SizedBox(
                          height: 84,
                          width: 250,
                          child: SimpleRulerPicker(
                            minValue: 145,
                            maxValue: 190,
                            initialValue: state.height,
                            onValueChanged: (value) {
                              context
                                  .read<HeightBloc>()
                                  .add(UpdateHeight(value));
                            },
                            axis: Axis.horizontal,
                            scaleLabelSize: 14,
                            scaleItemWidth: 12,
                            longLineHeight: 20,
                            shortLineHeight: 10,
                            lineColor: Colors.grey,
                            selectedColor: Color.fromARGB(255, 82, 46, 210),
                            labelColor: Colors.grey,
                            lineStroke: 1.5,
                            height: 60,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${state.height} cm",
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 82, 46, 210)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 82, 46, 210),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(18),
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
