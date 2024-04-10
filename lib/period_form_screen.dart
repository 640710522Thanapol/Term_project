import 'package:flutter/material.dart';
import 'calendar_screen.dart';

class PeriodFormScreen extends StatefulWidget {
  @override
  _PeriodFormScreenState createState() => _PeriodFormScreenState();
}

class _PeriodFormScreenState extends State<PeriodFormScreen> {
  late DateTime _firstDay;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _firstDay = DateTime.now();
  }

  void validateInput(String value) {
    RegExp regExp = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!regExp.hasMatch(value)) {
      setState(() {
        _errorText = 'Please enter the date in the format YYYY-MM-DD';
      });
    } else {
      setState(() {
        _errorText = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menstrual Cycle Predictor'),
        backgroundColor: Color.fromARGB(255, 198, 152, 211),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'First day of period (YYYY-MM-DD)',
                errorText: _errorText,
              ),
              enabled: true,
              initialValue: _firstDay.toString().split(' ')[0],
              onChanged: (value) {
                validateInput(value);
                if (_errorText == null && value.isNotEmpty) {
                  setState(() {
                    _firstDay = DateTime.tryParse(value) ?? DateTime.now();
                  });
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the first day of your period';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_errorText == null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalendarScreen(firstDay: _firstDay),
                    ),
                  );
                }
              },
              child: Text('Save and Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
