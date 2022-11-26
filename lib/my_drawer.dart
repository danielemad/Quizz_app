import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView( 
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 56), // 56 pixel according to default value of appbar height
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(width: 4),
              image:const DecorationImage(
                image: AssetImage("assets/images/user_image.jpeg"),
                fit: BoxFit.contain
              ),
              shape: BoxShape.circle
            ),
          ),
          const SizedBox(height:30),
          const Text(
            "User Name",
            style:TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height:30),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              "Settings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text(
              "Contact Us",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text(
              "About us",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
