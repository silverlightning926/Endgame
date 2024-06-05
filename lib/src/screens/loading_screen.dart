import 'package:endgame/src/constants/color_constants.dart';
import 'package:endgame/src/providers/home_screen_data_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // when loadHomeScreenData provider is done loading, navigate to the home screen route '/, otherwise stay on the loading screen route '/loading'
    final loadHomeScreenData = ref.watch(loadHomeScreenDataProvider);
    return loadHomeScreenData.when(
      data: (_) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          GoRouter.of(context).go('/');
        });
        return const SizedBox();
      },
      loading: () {
        return ScaffoldGradientBackground(
          gradient: ColorConstants.navigationGradient,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ENDGAME",
                textAlign: TextAlign.center,
                style: GoogleFonts.majorMonoDisplay(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 75,
              ),
              const SpinKitFadingCube(
                color: ColorConstants.primaryNavigationColor,
                size: 75,
              ),
              const SizedBox(
                height: 75,
              ),
              Text(
                "Loading...",
                textAlign: TextAlign.center,
                style: GoogleFonts.majorMonoDisplay(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        print("Error Loading Data: $stackTrace");
        return ScaffoldGradientBackground(
          gradient: ColorConstants.navigationGradient,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "ENDGAME",
                textAlign: TextAlign.center,
                style: GoogleFonts.majorMonoDisplay(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 75,
              ),
              const Icon(
                Icons.error,
                color: ColorConstants.primaryNavigationColor,
                size: 75,
              ),
              const SizedBox(
                height: 75,
              ),
              Text(
                "Error Loading Data",
                textAlign: TextAlign.center,
                style: GoogleFonts.majorMonoDisplay(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
