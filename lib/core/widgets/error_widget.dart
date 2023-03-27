import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/constants.dart';

class MyErrorWidget extends StatelessWidget {
  final String msg;
  final double width = Constants.screenWidth!;
  MyErrorWidget({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning_amber_rounded,
              size: width / 3,
            ),
            Text(
              msg,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: width / 25),
              child: Text(
                'please try again',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.grey,
                      fontSize: width / 25,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            TextButton(
              onPressed: () {
                // TODO
                context.read<MyCubit>().doSomething();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: width / 70, horizontal: width / 10),
                child: Text(
                  'Reload Screen',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white), //TextStyle(,color: Colors.white),
                ),
              ),
            ),
          ]),
    );
  }
}