import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../blocs/weight/weight_bloc.dart';
import '../blocs/weight/weight_event.dart';
import '../blocs/weight/weight_state.dart';

class WeightScreen extends StatelessWidget {
  const WeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeightBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const BackButton(),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/height');
              },
              child: const Text("Skip",
                  style: TextStyle(
                    color: Color.fromARGB(255, 82, 46, 210),
                  )),
            )
          ],
        ),
        body: BlocBuilder<WeightBloc, WeightState>(
          builder: (context, state) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: LinearProgressIndicator(
                    value: 0.66,
                    color: Color.fromARGB(255, 82, 46, 210),
                    backgroundColor: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                const Text("What’s your Weight?",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Text("Help us to create your personalize plan",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtons(
                      renderBorder: false,
                      borderRadius: BorderRadius.circular(30),
                      isSelected: [state.isKg, !state.isKg],
                      onPressed: (index) =>
                          context.read<WeightBloc>().add(const ToggleUnit()),
                      selectedColor: Colors.white,
                      fillColor: Color.fromARGB(255, 82, 46, 210),
                      children: const [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Text("KG")),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Text("LBS")),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 80,
                      maximum: 116,
                      interval: 5,
                      radiusFactor: .9,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.15,
                        color: Colors.grey.shade200,
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                      majorTickStyle: const MajorTickStyle(
                        length: 10,
                        thickness: 1.5,
                        color: Colors.grey,
                      ),
                      minorTickStyle: const MinorTickStyle(
                        length: 5,
                        thickness: 1.0,
                        color: Colors.grey,
                      ),
                      axisLabelStyle: const GaugeTextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          enableDragging: true,
                          onValueChanged: (value) {
                            context.read<WeightBloc>().add(UpdateWeight(value));
                          },
                          value: state.weight,
                          needleColor: Color.fromARGB(255, 82, 46, 210),
                          knobStyle: const KnobStyle(
                            color: Color.fromARGB(255, 82, 46, 210),
                            borderColor: Colors.transparent,
                            borderWidth: 2,
                          ),
                          tailStyle: const TailStyle(
                            length: 0.15,
                            width: 4,
                            color: Color.fromARGB(255, 82, 46, 210),
                          ),
                        ),
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Text(
                            '${state.weight.toInt()} ${state.isKg ? 'KG' : 'LBS'}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 82, 46, 210),
                            ),
                          ),
                          angle: 90,
                          positionFactor: 1,
                        ),
                      ],
                    ),
                  ],
                ),
                const Text(
                  'Drag Needle To Select Your Weight',
                  style: TextStyle(color: Colors.grey),
                ),
                const Spacer(),

                // Next Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/height');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 82, 46, 210),
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
