import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Widgets/drawer.dart';
import 'package:graduationinterface/presentationTier/Widgets/footer.dart';
import 'package:graduationinterface/presentationTier/Widgets/skillOval.dart';
import 'package:graduationinterface/presentationTier/Widgets/suggskillOval.dart';
import 'package:graduationinterface/presentationTier/utils/dialogtemp.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_firestore.dart';

class SkillsPage extends StatefulWidget {
  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  final TextEditingController _textFieldController = TextEditingController();
  List<String> typedSkills = [];
  FirestoreMethods _firestoreMethods = FirestoreMethods();

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/assets/NiceJob.png',
              height: 140,
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      endDrawer: AppDrawer(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/assets/ew3a.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Your Skills',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Typed Skills',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    children: typedSkills
                        .map(
                          (skill) => SkillOval(
                            skillName: skill,
                            onDelete: () {
                              setState(() {
                                typedSkills.remove(skill);
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textFieldController,
                          decoration: InputDecoration(
                            hintText: 'Enter your skill',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            typedSkills.add(_textFieldController.text);
                            _textFieldController.clear();
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Colors.blueAccent, Color.fromARGB(255, 201, 112, 217)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Icon(Icons.check, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Suggestions',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: SuggestedSkillOval(
                                skillName: 'Wordpress',
                                onAdd: () {
                                  setState(() {
                                    typedSkills.add('Wordpress');
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: SuggestedSkillOval(
                                skillName: 'Microsoft',
                                onAdd: () {
                                  setState(() {
                                    typedSkills.add('Microsoft');
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      showChangesSavedDialog(context);
                      _firestoreMethods.saveSkillToFirestore(typedSkills);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3B52BB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}