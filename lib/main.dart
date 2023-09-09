import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main()=>runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PersonalDetails(),
    );
  }
}

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('My Personal Details',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0,
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/my.jpg'),
            radius: 80,
            ),           
          ),
          const Text('Olaitan Damilare', 
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          // ignore: prefer_const_constructors
          SizedBox(height: 5.0),
          ElevatedButton(onPressed: (){
            Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GitHubView(),
      ),
    );
          }, 
          child: const Text('Open GitHub',)
          )
        ],
      ),
    );
  }
}

class GitHubView extends StatefulWidget {
  const GitHubView({super.key});

  @override
  State<GitHubView> createState() => _GitHubViewState();
}

class _GitHubViewState extends State<GitHubView> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://github.com/Peculiars'),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('My GitHub Profile',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0,
      ),
      body: WebViewWidget(
        controller: controller,
        ),
    );
  }
}