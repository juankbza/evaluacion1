import 'package:flutter/material.dart';


class CustomCardHome extends StatelessWidget {

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Image image;
  final String route;

  


  const CustomCardHome({

    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.image,
    required this.route,

    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
    
      color: color,
    
      child: Column(
    
        children: [
    
          ListTile(
    
            title: Text(title),
            textColor: Colors.white,
            subtitle: Text(subtitle),
            trailing: Icon(icon,color: Colors.white,),
            onTap: () => Navigator.pushNamed(context, route),
            
          ),

          Padding(

            padding: const EdgeInsets.all(8.0),
            child: image,
            
          )
        ],
      )
    );
  }
}