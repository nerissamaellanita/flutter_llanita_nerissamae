import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Student Profile Form', home: StudentForm());
  }
}

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String outputMessage = '';

  void submitForm() {
    if (nameController.text.isEmpty ||
        ageController.text.isEmpty ||
        genderController.text.isEmpty ||
        addressController.text.isEmpty ||
        contactController.text.isEmpty ||
        emailController.text.isEmpty) {
      setState(() {
        outputMessage = 'Please fill in all fields before submitting.';
      });
      return;
    }

    setState(() {
      outputMessage =
          'Full Name: ${nameController.text}\n'
          'Age: ${ageController.text}\n'
          'Gender: ${genderController.text}\n'
          'Address: ${addressController.text}\n'
          'Contact Number: ${contactController.text}\n'
          'Email: ${emailController.text}';
    });
  }

  void clearForm() {
    nameController.clear();
    ageController.clear();
    genderController.clear();
    addressController.clear();
    contactController.clear();
    emailController.clear();

    setState(() {
      outputMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Profile Form')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            SizedBox(height: 10),

            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),

            TextField(
              controller: genderController,
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            SizedBox(height: 10),

            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 10),

            TextField(
              controller: contactController,
              decoration: InputDecoration(labelText: 'Contact Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),

            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: submitForm,
                    child: Text('Submit'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: clearForm,
                    child: Text('Clear / Reset'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Text(outputMessage, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
