import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_stopwatch/cubit/cubit.dart';
import 'package:simple_stopwatch/cubit/states.dart';

class StopWatch extends StatelessWidget {
  const StopWatch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => StopWatchCubit(),
      child: BlocConsumer<StopWatchCubit, StopWatchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = StopWatchCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "StopWatch",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CupertinoButton(
                      onPressed: () {
                        cubit.changeTime();
                        cubit.startStopWatch();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 200,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.deepPurple, width: 5)),
                        child: Text(
                          "${cubit.minutes}:${cubit.seconds}:${cubit.milliseconds} ",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    CupertinoButton(
                        child: const Text(
                          "Reset",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          cubit.reset();
                        })
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
