import 'package:flutter/material.dart';
import 'package:graduationinterface/MySkills.dart';
import 'package:graduationinterface/Optional.dart';
import 'package:graduationinterface/drawer.dart';
import 'package:graduationinterface/footer.dart';

class SkillsPage extends StatefulWidget {
  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  final TextEditingController _textFieldController = TextEditingController();
  List<String> typedSkills = [];

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
                image: AssetImage('images/assets/signn.png'),
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
                            fillColor: Colors.grey[200],
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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Changes saved',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: Container(
                              width: 150,
                              height: 150,
                              child: Image.asset(
                                'images/assets/222.png', // Adjust the image path as needed
                                fit: BoxFit.contain,
                              ),
                            ),
                            actions: [
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    gradient: LinearGradient(
                                      colors: [Colors.blueAccent, Color.fromARGB(255, 201, 112, 217)],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => MySkillsPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Adjust padding here
                                      child: Text(
                                        'Go to skills page',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary:Color(0xFF3B52BB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0), // Adjust vertical padding here
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white), // Adjust font size here
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

class SkillOval extends StatelessWidget {
  final String skillName;
  final VoidCallback onDelete;

  SkillOval({required this.skillName, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Color.fromARGB(255, 201, 112, 217)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Text(skillName, style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
          IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}

class SuggestedSkillOval extends StatelessWidget {
  final String skillName;
  final VoidCallback onAdd;

  SuggestedSkillOval({required this.skillName, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Color.fromARGB(255, 201, 112, 217)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Text(skillName, style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: onAdd,
          ),
        ],
      ),
    );
  }
}
