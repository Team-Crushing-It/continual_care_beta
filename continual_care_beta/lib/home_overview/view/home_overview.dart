import 'package:continual_care_beta/app/app.dart';
import 'package:continual_care_beta/home_overview/bloc/home_overview_bloc.dart';
import 'package:continual_care_beta/home_overview/home_overview.dart';
import 'package:continual_care_beta/log_flow/log_flow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_repository/jobs_repository.dart';

class HomeOverviewPage extends StatelessWidget {
  const HomeOverviewPage({Key? key}) : super(key: key);

  static Page page() => const SlideRightPage<void>(
        key: ValueKey('home_overview_page'),
        child: HomeOverviewPage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => HomeOverviewBloc(
        jobsRepository: context.read<JobsRepository>(),
      )..add(
          HomeOverviewSubscriptionRequested(
              context.read<AppBloc>().state.group),
        ),
      child: HomeOverviewView(),
    );
  }
}

class HomeOverviewView extends StatelessWidget {
  const HomeOverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 36,
          child: Image.asset('assets/logo_dark_nobg.png'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                _Upcoming(),
                _Icons(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: _ActivityFeed(),
            )
          ],
        ),
      ),
    );
  }
}

class _Upcoming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Container(
              width: double.maxFinite,
              height: 32,
              child: Text(
                "Upcoming",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color(0xff626262),
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<HomeOverviewBloc, HomeOverviewState>(
            builder: (context, state) {
              if (state.upcomingJob != null) {
                return JobListTile(
                    job: state.upcomingJob!,
                    onTap: () {
                      Navigator.of(context).push(
                        LogFlow.route(
                          upcomingJob: state.upcomingJob!,
                          recentJob: state.recentJob!,
                        ),
                      );
                    });
              }
              return Center(child: Text("No upcoming jobs"));
            },
          ),
        ],
      ),
    );
  }
}

class _Icons extends StatelessWidget {
  const _Icons();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16, right: 2),
      child: Column(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                size: 32,
              )),
          IconButton(
              onPressed: () {
                context.read<AppBloc>().add(AppLogoutRequested());
                context.read<HomeOverviewBloc>().close();
              },
              icon: Icon(
                Icons.account_circle,
                size: 32,
              ))
        ],
      ),
    );
  }
}

class _ActivityFeed extends StatelessWidget {
  const _ActivityFeed();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MainTitle(title: 'Activity Log'),
          BlocBuilder<HomeOverviewBloc, HomeOverviewState>(
            builder: (context, state) {
              if (state.jobs != null && state.jobs!.isNotEmpty) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.jobs!.length,
                  itemBuilder: ((context, index) {
                    return JobTile(
                      initialJob: state.jobs![index],
                      onTap: () {
                        // Navigator.of(context).push(
                        //   LogOverviewPage.route(
                        //     initialLog: state.jobs![index],
                        //   ),
                        // );
                      },
                    );
                  }),
                );
              }
              return Text("No logs yet");
            },
          ),
        ],
      ),
    );
  }
}
