import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() {
  runApp(LabelPartsDebugApp());
  SemanticsBinding.instance.ensureSemantics();
}

class LabelPartsDebugApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LabelParts Debug Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LabelPartsDebugPage(),
    );
  }
}

class LabelPartsDebugPage extends StatefulWidget {
  @override
  _LabelPartsDebugPageState createState() => _LabelPartsDebugPageState();
}

class _LabelPartsDebugPageState extends State<LabelPartsDebugPage> {
  int _testCounter = 0;

  void _triggerDebugOutput() {
    setState(() {
      _testCounter++;
    });
    print('🎯 DEBUG: User triggered test #$_testCounter - This should generate debug output for labelParts!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LabelParts Debug Test'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'LabelParts Debug Console Test',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8),
            Text(
              'Check the browser console for comprehensive debug output showing the complete aria-labelledby pipeline.',
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: _triggerDebugOutput,
              child: Text('Trigger Debug Output (Test #$_testCounter)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
            SizedBox(height: 30),

            Text(
              'Test 1: Customer Name + Required Field',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Semantics(
              labelParts: ['Customer Name', 'Required Field'],
              child: TextField(
                key: ValueKey('test1-$_testCounter'),
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  hintText: 'Enter your name',
                ),
              ),
            ),
            SizedBox(height: 20),

            Text(
              'Test 2: Email + Format Instructions + Required',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Semantics(
              labelParts: ['Email Address', 'Format: user@domain.com', 'Required'],
              child: TextField(
                key: ValueKey('test2-$_testCounter'),
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                ),
              ),
            ),
            SizedBox(height: 20),

            Text(
              'Test 3: Submit Button + Keyboard Shortcut',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Semantics(
              labelParts: ['Submit Form', 'Ctrl+Enter shortcut available'],
              child: ElevatedButton(
                key: ValueKey('test3-$_testCounter'),
                onPressed: () {
                  print('🔘 DEBUG: Submit button pressed (Test #$_testCounter)');
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),

            Text(
              'Test 4: Complex Instructions (4 parts)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Semantics(
              labelParts: [
                'Password Field',
                'Minimum 8 characters',
                'Must include uppercase, lowercase, and numbers',
                'Required for account security'
              ],
              child: TextField(
                key: ValueKey('test4-$_testCounter'),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  hintText: 'Create a secure password',
                ),
              ),
            ),
            SizedBox(height: 20),

            Text(
              'Test 5: Comparison - Regular Single Label',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Semantics(
              label: 'Regular single label field (should use aria-label)',
              child: TextField(
                key: ValueKey('test5-$_testCounter'),
                decoration: InputDecoration(
                  labelText: 'Regular Field',
                  border: OutlineInputBorder(),
                  hintText: 'Normal field with single label',
                ),
              ),
            ),
            SizedBox(height: 30),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[50],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expected Debug Output Pipeline:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '🏗️ SemanticsConfiguration.labelParts setter\n'
                    '🔗 Concatenation for mobile platforms\n'
                    '✅ SemanticsNode.updateWith() setting labelParts\n'
                    '🔍 SemanticsNode.labelParts getter calls\n'
                    '📊 SemanticsData creation with labelParts\n'
                    '🚀 SemanticsNode._addToUpdate() calling builder\n'
                    '🌐 Web SemanticsUpdateBuilder receiving labelParts\n'
                    '⚡ Native _updateNode call with labelParts\n'
                    '🔄 SemanticsObject.updateSelf with labelParts\n'
                    '🎯 AriaLabelRepresentation using aria-labelledby\n'
                    '🏗️ Creating hidden span elements with unique IDs\n'
                    '📝 Setting aria-labelledby attribute',
                    style: TextStyle(fontFamily: 'monospace', fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue[50],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expected DOM Output (Inspect Element):',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Look for elements like:\n'
                    '<flt-semantics aria-labelledby="label-10-0 label-10-1">\n'
                    '  <span id="label-10-0" aria-hidden="true" style="display: none;">Customer Name</span>\n'
                    '  <span id="label-10-1" aria-hidden="true" style="display: none;">Required Field</span>\n'
                    '  <!-- actual form element -->\n'
                    '</flt-semantics>',
                    style: TextStyle(fontFamily: 'monospace', fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}