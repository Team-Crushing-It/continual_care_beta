// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:continual_care_beta_web/home/bloc/bloc.dart';
import 'package:jobs_repository/jobs_repository.dart';

/// {@template home_page}
/// A description for HomePage
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  /// The static route for HomePage
  static MaterialPage<void> page() {
    return const MaterialPage<void>(child: HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => HomeBloc(
        jobsRepository: context.read<JobsRepository>(),
      )..add(const HomeSubscriptionRequested()),
      child: const HomeView(),
    );
  }
}

/// {@template home_view}
/// Displays the HomeView
/// {@endtemplate}
class HomeView extends StatelessWidget {
  /// {@macro home_view}
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _CustomAppBar(),
      body: const Text('this is the home'),
    );
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  _CustomAppBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(48.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120),
      child: AppBar(
        centerTitle: false,
        title: Container(
          height: 36,
          child: Image.asset('logo_dark_nobg.png'),
        ),
        actions: [
          InkWell(
            onTap: () {
              //TODO: Navigate to edit page
              print('tapped');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.add),
                  Text('add new caregiver',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white, fontSize: 16))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
