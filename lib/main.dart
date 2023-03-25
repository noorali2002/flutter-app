import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Account',
      home: NewAccountPage(),
    );
  }
}

class NewAccountPage extends StatefulWidget {
  @override
  _NewAccountPageState createState() => _NewAccountPageState();
}

class _NewAccountPageState extends State<NewAccountPage> {
  String email = '';
  String password = '';
  String confirmPassword = '';
  String fullName = '';
  bool isSubscribed = false;
  bool isAgreedToTerms = false;
  List<String> interests = [];

  final List<String> allInterests = [
    'Art',
    'Books',
    'Cooking',
    'Fashion',
    'Music',
    'Sports',
    'Travel'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Account'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Email'),
              TextField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text('Password'),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text('Confirm Password'),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    confirmPassword = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text('Full Name'),
              TextField(
                onChanged: (value) {
                  setState(() {
                    fullName = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text('Interests'),
              Wrap(
                spacing: 8.0,
                children: allInterests.map((interest) {
                  return FilterChip(
                    label: Text(interest),
                    selected: interests.contains(interest),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          interests.add(interest);
                        } else {
                          interests.remove(interest);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: isSubscribed,
                    onChanged: (value) {
                      setState(() {
                        isSubscribed = value!;
                      });
                    },
                  ),
                  Text('Subscribe to newsletter'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: isAgreedToTerms,
                    onChanged: (value) {
                      setState(() {
                        isAgreedToTerms = value!;
                      });
                    },
                  ),
                  Text('I agree to the terms and conditions'),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Handle create account button press
                },
                child: Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
