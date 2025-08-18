import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:flutter/material.dart';

class OnboardingsView extends StatefulWidget {
  const OnboardingsView({super.key});

  @override
  State<OnboardingsView> createState() => _OnboardingsViewState();
}

class _OnboardingsViewState extends State<OnboardingsView> {
  AdaptyOnboarding? onboarding;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    await Adapty().activate(
        configuration: AdaptyConfiguration(
            apiKey: API_KEY));
    print("activated get");
    onboarding = await Adapty().getOnboarding(
      placementId: "main",
      locale: "en",
    );
    print("onboarding: $onboarding");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: onboarding == null
          ? const Center(child: CircularProgressIndicator())
          : AdaptyUIOnboardingPlatformView(
              onboarding: onboarding!,
            ),
    );
  }
}
