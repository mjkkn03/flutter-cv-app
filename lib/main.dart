import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color surfaceColor = Color(0x0dffffff);
    return MaterialApp(
      title: 'brice seraphin CV',
      theme: ThemeData(
        dividerTheme: DividerThemeData(color: Colors.white.withValues(alpha: 0.3), thickness: 0.3),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pinkAccent.shade700,
          brightness: Brightness.dark,
        ),
        dividerColor: surfaceColor,
        scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        textTheme: GoogleFonts.latoTextTheme(
          TextTheme(
            bodyMedium: TextStyle(fontSize: 15),
            bodyLarge: TextStyle(fontSize: 13, color: Color.fromARGB(80, 255, 255, 255)),
            headlineSmall: TextStyle(fontWeight: FontWeight.bold),
            titleLarge: TextStyle(fontSize:16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

enum _SkillType{
  photoshop, xd, illustrator, afterEffect, lightRoom
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _SkillType? _skill;
  void updateSelectedSkill(_SkillType skillType) {
    setState((){
      _skill = skillType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(16),
          child: Text('curriculum vitae'),
        ),
        actions: [
          Icon(CupertinoIcons.chat_bubble),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: Icon(CupertinoIcons.ellipsis_vertical),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/profile_image.png',
                    width: 60,
                    height: 60,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('brice Seraphin', style: Theme.of(context).textTheme.titleLarge),
                      SizedBox(height: 2),
                      Text('Product & Print Designer'),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.location, 
                            size: 14,
                            color: Theme.of(context).textTheme.bodyLarge!.color),
                          SizedBox(width: 3),
                          Text(
                            'Paris, France',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(CupertinoIcons.heart,color: Theme.of(context).colorScheme.primary),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
            child: Text(
              'Enthuslastic young computer geek freelance designer, in love with independence, I have a lot of experience with graphical projects, and always give the best of myself to bring you success', style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
            child: Row(
              children: [
                Text('Skills', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w900)),
                SizedBox(width: 2),
                Icon(CupertinoIcons.chevron_down, size: 12),
              ],
            ),
          ),
          SizedBox(
            height: 12
            ),
          Center(
            child: Wrap(
            spacing: 8,
            runSpacing: 8,
            direction: Axis.horizontal, 
            children: [
              Skill(
                type: _SkillType.photoshop,
                title: 'Photoshop',
                imagePath: 'assets/images/app_icon_01.png', 
                shadowColor: Colors.blue,
                isActive: _skill == _SkillType.photoshop,
                onTap: () {
                  updateSelectedSkill(_SkillType.photoshop);
                }
              ),
              Skill(
                type: _SkillType.xd,
                title: 'Adobe XD',
                imagePath: 'assets/images/app_icon_05.png', 
                shadowColor: Colors.pink, 
                isActive: _skill == _SkillType.xd,
                onTap: () {
                  updateSelectedSkill(_SkillType.xd);
                }
              ),
              Skill(
                type: _SkillType.illustrator,
                title: 'Illustrator',
                imagePath: 'assets/images/app_icon_04.png', 
                shadowColor: Colors.orange.shade100, 
                isActive: _skill == _SkillType.illustrator,
                onTap: () {
                  updateSelectedSkill(_SkillType.illustrator);
                }
              ),
              Skill(
                type: _SkillType.afterEffect,
                title: 'After Effect',
                imagePath: 'assets/images/app_icon_03.png', 
                shadowColor: Colors.blue.shade800, 
                isActive: _skill == _SkillType.afterEffect,
                onTap: () {
                  updateSelectedSkill(_SkillType.afterEffect);
                }
              ),
              Skill(
                type: _SkillType.lightRoom,
                title: 'Lightroom',
                imagePath: 'assets/images/app_icon_02.png', 
                shadowColor: Colors.blue, 
                isActive: _skill == _SkillType.lightRoom,
                onTap: () {
                  updateSelectedSkill(_SkillType.lightRoom);
                }
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class Skill extends StatelessWidget {
  final _SkillType type;
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive; 
  final Function() onTap;
  const Skill({
    super.key, 
    required this.type,
    required this.title, 
    required this.imagePath, 
    required this.shadowColor, 
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius defaultBorderRadius = BorderRadius.circular(12);

    return InkWell(
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive?BoxDecoration(
          color: Theme.of(context).dividerColor, 
          borderRadius: defaultBorderRadius,
          ):null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            decoration: isActive? BoxDecoration(
              boxShadow: [
            BoxShadow(color: shadowColor.withValues(alpha: 0.5), blurRadius: 20),
            ]
            ):null,
            child: Image.asset(
              imagePath,
               width: 40,
                height: 40
            ),
          ),
          Text(title),
        ]
        )
      ),
    );
  }
}




