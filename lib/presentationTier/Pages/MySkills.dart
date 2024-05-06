import 'package:flutter/material.dart';
import 'package:graduationinterface/applicationTier/models/skill.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_firestore.dart';
import 'package:graduationinterface/presentationTier/pages/Skills_page.dart';
import 'package:graduationinterface/presentationTier/widgets/drawer.dart';
import 'package:graduationinterface/presentationTier/widgets/footer.dart';

class MySkillsPage extends StatefulWidget {
  const MySkillsPage({super.key});

  @override
  _MySkillsPageState createState() => _MySkillsPageState();
}

class _MySkillsPageState extends State<MySkillsPage> {
  List<Skill> skills = [];
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  
  @override
  void initState() {
    super.initState();
    fetchAndSetSkills();
  }

  Future<void> fetchAndSetSkills() async {
    List<Skill> fetchedSkills = await _firestoreMethods.fetchSkillsFromFirestore();
    setState(() {
      skills = fetchedSkills;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('My Skills'),
      ),
      endDrawer: const AppDrawer(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/assets/ew3a.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'My Skills',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SkillsPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 119, 136, 235),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Icon(Icons.add, size: 24, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: skills.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: const LinearGradient(
                            colors: [Colors.blueAccent, Color.fromARGB(255, 201, 112, 217)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            skills[index].name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () async{
                              Skill removedSkill = skills.removeAt(index);
                          setState(() {});
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Removed Skill: ${removedSkill.name}'),
                                    duration: const Duration(seconds: 10),
                                    action: SnackBarAction(
                                      label: 'Undo',
                                      
                                      onPressed: () async{

                                        setState(() {
                                          skills.insert(index, removedSkill);
                                        });
                                        await _firestoreMethods.saveSkillToFirestore([removedSkill.name]);
                                      },
                                    ),
                                  ),
                                );
                                await _firestoreMethods.removeSkillFromFirestore(removedSkill.name);
                              
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
   
        ],  
      ), 
      bottomNavigationBar: const Footer(),
    );
  }
}
