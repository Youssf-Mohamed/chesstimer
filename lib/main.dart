import 'package:chesstimer/bloc/TimerCubit.dart';
import 'package:chesstimer/screens/HomeScreen.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentry_flutter/sentry_flutter.dart';


Future<void> main() async {
  if(kReleaseMode){
    await SentryFlutter.init(
          (options) {
        options.experimental.replay.sessionSampleRate =0.01;
        options.experimental.replay.onErrorSampleRate = 0.01;
        options.dsn = 'https://ccf84ba97449fbbb630f44b9f201c3f4@o4509389243809792.ingest.de.sentry.io/4509389245448272';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 0.01;
      },
      appRunner: () => runApp(BetterFeedback(child: SentryWidget(child: const MyApp()))),
    );
    // // TODO: Remove this line after sending the first sample event to sentry.
    // await Sentry.captureException(Exception('This is a sample exception.'));
  }
  else{
   runApp(BetterFeedback(child: const MyApp()));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.jockeyOneTextTheme(),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
