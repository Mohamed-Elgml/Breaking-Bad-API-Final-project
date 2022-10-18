import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Final_project_course/features/models/full_details.dart';
class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key key, this.characterId}) : super(key: key);
  final int characterId ;

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}


class _CharacterScreenState extends State<CharacterScreen> {
  bool isLoading = true;
  FullDetails fullDetails;
  @override
  void initState() {
   
    super.initState();
  }
  void getDetails()async{
    final response =await Dio().get('https://www.breakingbadapi.com/api/characters/${widget.characterId}');
    print(response.data);

    fullDetails=FullDetails(
      birthday: response.data[0]['birthday'],
      id: response.data[0]['char_id'],
      image: response.data[0]['img'],
      nickname: response.data[0]['nickname'],
      name: response.data[0]['name'],
      status: response.data[0]['status'],
    );
    isLoading=false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: isLoading?Center(
        child: CircularProgressIndicator(),
      ): ListView(
        children: [
          Image.network(fullDetails.image),
          Text(fullDetails.name),
          Text(fullDetails.nickname),
          Text(fullDetails.birthday),
          Text(fullDetails.status),
        ],
      ),
    );
  }
}
