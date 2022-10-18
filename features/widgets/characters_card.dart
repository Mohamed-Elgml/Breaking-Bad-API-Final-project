import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Final_project_course/features/models/character.dart';

import '../characters/character_screen.dart';

class CharactersCard extends StatelessWidget {
  const CharactersCard({
    Key key,
    this.character,
  }) : super(key: key);
  final Character character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CharacterScreen(
              characterId: character.id,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(character.image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                character.name,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(12),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
            )
          ],
        ),
      ),
    );
  }
}
