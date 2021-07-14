import 'package:flutter/material.dart';

class Tree1 extends StatefulWidget {
  const Tree1({Key? key}) : super(key: key);

  @override
  _Tree1State createState() => _Tree1State();
}

class _Tree1State extends State<Tree1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        child: Column(
     
            children: [
              Expanded(
                              child: Container(
                  color: Colors.teal[700],
                  child: Padding(
                    padding: const EdgeInsets.only(top:20,bottom:20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 50.0,
                          color: Colors.white,
                        ),
                        Text("FamilyTree",style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize:25)),
                        Text("Back",style:TextStyle(color:Colors.white,fontSize: 10)),
                      ],
                    ),
                  ),
                ),
              ),
              
              Expanded(
                flex: 8,
                              child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
            
                      children: [
                        Icon(Icons.person_add),
                        Text("Add You in Tree")
                      ],
                    ),

                  ),
              )
            ],
          ),
      ),
    
      
    );
  }
}
