import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => _changeLanguage(context, 'en'),
          child: const Text('English'),
        ),
        const Text('|'),
        TextButton(
          onPressed: () => _changeLanguage(context, 'uz'),
          child: const Text("O'zbekcha"),
        ),
        const Text('|'),
        TextButton(
          onPressed: () => _changeLanguage(context, 'ru'),
          child: const Text('Русский'),
        ),
      ],
    );
  }
  
  Future<void> _changeLanguage(BuildContext context, String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', languageCode);
    
    // Show a temporary message
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Language changed to ${_getLanguageName(languageCode)}'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
  
  String _getLanguageName(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'uz':
        return "O'zbekcha";
      case 'ru':
        return 'Русский';
      default:
        return 'English';
    }
  }
} 