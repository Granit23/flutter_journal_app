import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';


class JournalEntry extends StatefulWidget {
  static const routeName = 'journalEntry';

  @override
  _JournalEntryState createState() => _JournalEntryState();
}

class _JournalEntryState extends State<JournalEntry> {
  final formKey = GlobalKey<FormState>();
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("New Entry"),
      ),
      body: SingleChildScrollView(child:formWidget(context)),
    );
  }

  Widget formWidget(context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child:Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textFormField("Title"),
          textFormField("Body"),
          textFormField("Rating"),
          SizedBox(height: 10),
          rowButtons(context)
        ]
      ),
    ));
  }

  Row rowButtons(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
          padding: EdgeInsets.fromLTRB(0,0,60,0),
          child:RaisedButton(
          onPressed: () {Navigator.of(context).pop();},
          child: Text('Cancel')
        )),
          RaisedButton(
          onPressed: () {
            if (formKey.currentState.validate()) {
              formKey.currentState.save();
              Navigator.of(context).pop();
            }
            
          },
          child: Text('Save Entry'))
        ]);
  }

  Padding textFormField(String label) {
    if (label == 'Rating') {
      return Padding(
          padding: EdgeInsets.all(7),
          child:TextFormField(
          autofocus: true,
          keyboardType: TextInputType.number,
          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            labelText: label, border: OutlineInputBorder(),
          ),
          onSaved: (value) {
            print(value);
            // store value in some object
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter a value';
            } else {
              return null;
            };
          },
        )
    );
    }
    return Padding(
          padding: EdgeInsets.all(7),
          child:TextFormField(
          autofocus: true,
          decoration: InputDecoration(
            labelText: label, border: OutlineInputBorder(),
          ),
          onSaved: (value) {
            print(value);
            // store value in some object
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter a value';
            } else {
              return null;
            };
          },
        )
    );
  }
}