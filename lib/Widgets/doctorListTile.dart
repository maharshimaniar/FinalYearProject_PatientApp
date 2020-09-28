import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorListTile extends StatelessWidget {
  final String name;
  final String specialization;
  final String imageUrl;
  final String contactNumber;

  DoctorListTile(
      {@required this.contactNumber,
      @required this.imageUrl,
      @required this.name,
      @required this.specialization});

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch('tel:+91$url')) {
      await launch('tel:+91$url');
    } else {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 40,
        child: Icon(
          Icons.supervised_user_circle,
          size: 40,
        ),
      ),
      title: Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
      subtitle: Text(specialization,style: TextStyle(fontSize: 18),),
      contentPadding: EdgeInsets.all(10),
      onTap: () {
        Scaffold.of(context).hideCurrentSnackBar();
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("$name pressed."),
        ));
      },
      trailing: IconButton(
        icon: Icon(
          Icons.add_call,
        ),
        onPressed: () {
          _makePhoneCall(contactNumber);
        },
      ),
    );
  }
}
