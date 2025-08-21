import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaywallView extends StatefulWidget {
  const PaywallView({super.key});

  @override
  State<PaywallView> createState() => _PaywallViewState();
}

class _PaywallViewState extends State<PaywallView> {
  AdaptyPaywall? paywall;

  @override
  void initState() {
    super.initState();
    FontChecker.hasComfortaaBold().then((value) {
      print("hasComfortaaBold : $value");
    });
    init();
  }

  Future init() async {
    await Adapty().activate(
      configuration: AdaptyConfiguration(
        apiKey: "public_live_i6bLVH4H.2Hy1dsU5ajCAkaRyYgf2",
      ),
    );
    print("activated get");
    paywall = await Adapty().getPaywall(placementId: "sounds", locale: "en");
    print("paywall: $paywall");
    final paywallView = await AdaptyUI().createPaywallView(paywall: paywall!);
    paywallView.present();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const Center(child: CircularProgressIndicator()));
  }
}

class FontChecker {
  static const _channel = MethodChannel("font_check");

  static Future<bool> hasComfortaaBold() async {
    try {
      final result = await _channel.invokeMethod<bool>("hasComfortaaBold");
      return result ?? false;
    } catch (e) {
      print("Font check error: $e");
      return false;
    }
  }
}
