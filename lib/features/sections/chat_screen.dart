// Экран "Главная"
import 'package:flutter/material.dart';
import 'package:forecast_x/features/webview/webview_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebViewScreen(
      initialUrl: 'https://streamtime.net',
    );
  }
}
