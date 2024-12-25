import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:macromasterai/Constants/utils/dimensions.dart';
import 'package:macromasterai/Screens/UserProfileDetails.dart';

class ChatBotService {
  static const String apiUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent";
  static const String apiKey = "AIzaSyCSzGCwCX8s1hMpQZrLZSRq3zidCYu-RzM";

  static Future<String> sendMessage(String message) async {
    try {
      final headers = {"Content-Type": "application/json"};
      final body = jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": message}
            ]
          }
        ]
      });

      final response = await http.post(
        Uri.parse('$apiUrl?key=$apiKey'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data.containsKey('candidates') &&
            data['candidates'] != null &&
            data['candidates'][0]['content'] != null &&
            data['candidates'][0]['content']['parts'] != null) {
          return data['candidates'][0]['content']['parts'][0]['text'] ??
              "No response from AI";
        } else {
          return "No valid content in the response";
        }
      } else {
        return "Error: ${response.statusCode}, ${response.body}";
      }
    } catch (e) {
      return "Error: Unable to send message. $e";
    }
  }
}

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final TextEditingController aiChatInputController = TextEditingController();
  final List<Map<String, String>> messages = [];

  void sendMessage() async {
    final userInput = aiChatInputController.text.trim();
    if (userInput.isEmpty) return;

    setState(() {
      messages.add({'role': 'user', 'text': userInput});
      aiChatInputController.clear();
    });

    final aiResponse = await ChatBotService.sendMessage(userInput);

    setState(() {
      messages.add({'role': 'bot', 'text': aiResponse});
    });
  }

  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);

    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "MacroMaster AI",
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UserInfoDetails()),
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              backgroundImage: AssetImage('images/avatar-removebg-preview.png'),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.question_mark_rounded,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ChatBot()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUser = message['role'] == 'user';
                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      message['text']!,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: aiChatInputController,
                    decoration: InputDecoration(
                      hintText: 'Ask me anything...',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.black, size: 28),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}