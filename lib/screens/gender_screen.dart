import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../blocs/gender/gender_bloc.dart';
import '../blocs/gender/gender_event.dart';
import '../blocs/gender/gender_state.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedOption = 0;
    return BlocProvider(
      create: (_) => GenderBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const BackButton(),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/weight');
              },
              child: const Text("Skip",
                  style: TextStyle(
                    color: Color.fromARGB(255, 82, 46, 210),
                  )),
            ),
          ],
        ),
        body: BlocBuilder<GenderBloc, GenderState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const LinearProgressIndicator(
                    value: 0.33,
                    color: Color.fromARGB(255, 82, 46, 210),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Select your Gender",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Help us to create your personalize plan",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 32),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _genderAvatar(
                        context,
                        'Female',
                        'assets/images/gender_female.svg',
                        state.selectedGender,
                      ),
                      _genderAvatar(
                        context,
                        'Male',
                        'assets/images/gender_male.svg',
                        state.selectedGender,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        context.read<GenderBloc>().add(SelectGender('Other'));
                      },
                      child: Container(
                        width: 120,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: state.selectedGender == 'Other'
                                ? Colors.purple
                                : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: state.selectedGender == 'Other'
                              ? const Color.fromARGB(255, 82, 46, 210)
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            'Other',
                            style: TextStyle(
                              color: state.selectedGender == 'Other'
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),

                  SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(value: 'Female', label: Text('Female')),
                      ButtonSegment(value: 'Male', label: Text('Male')),
                      ButtonSegment(value: 'Other', label: Text('Other')),
                    ],
                    selected: <String>{state.selectedGender},
                    onSelectionChanged: (Set<String> newSelection) {
                      final selected = newSelection.first;
                      context.read<GenderBloc>().add(SelectGender(selected));
                    },
                    showSelectedIcon: false,
                    style: ButtonStyle(
                      side: WidgetStateProperty.all(BorderSide.none),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      backgroundColor:
                          WidgetStateProperty.resolveWith<Color>((states) {
                        if (states.contains(WidgetState.selected)) {
                          return const Color.fromARGB(255, 82, 46, 210);
                        }
                        return Colors.grey.shade200;
                      }),
                      foregroundColor:
                          WidgetStateProperty.resolveWith<Color>((states) {
                        if (states.contains(WidgetState.selected)) {
                          return Colors.white;
                        }
                        return Colors.black;
                      }),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Next Button
                  ElevatedButton(
                    onPressed: state.selectedGender.isNotEmpty
                        ? () {
                            Navigator.pushNamed(context, '/weight');
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 82, 46, 210),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(18),
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _genderAvatar(
      BuildContext context, String label, String asset, String selected) {
    final isSelected = selected == label;
    return GestureDetector(
      onTap: () {
        context.read<GenderBloc>().add(SelectGender(label));
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: isSelected
                ? const Color.fromARGB(255, 82, 46, 210)
                : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                asset,
                width: 40,
                height: 40,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}
