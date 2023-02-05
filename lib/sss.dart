import 'dart:convert';
 
import 'package:firebase/sacad.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
 

class api extends StatefulWidget {
   static const String id = 'sacad';
  @override
  State<api> createState() => _apiState();
}
class _apiState extends State<api> {
  //const api({Key? key}) : super(key: key);
  List mydata = [];

  getAll() async {
    try {
      var response =
          await http.get(Uri.parse('https://worldtimeapi.org/api/timezone'));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      return jsonDecode(response.body.toString());
//  return jsonDecode(response.body.toString())['data'];
    } catch (ee) {
      //  print()
      print("THE RROR IS $ee");
      print(ee);
      return ee;
    }

//  return await jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan ,
      appBar: AppBar(
        title: Text("Flutter World Clock"),
        centerTitle: true,
      ),
//     body: ElevatedButton(child: Center(child: Text("click")),onPressed: (){
// getAll();
// print("4444444444444444444444444444444444444444444444444555555555555");

//     },),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: FutureBuilder<dynamic>(
          initialData: [],
          builder: (ctx, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.data);
              return Text("Error Ocured");
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var datas = snapshot.data;
                    return 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    // shape: Sh,
                    child: ListTile(title: Text(datas[index]=="Africa/Nairobi"?"Africa/Somalia":datas[index]),tileColor: Colors.black, onTap: () async {
                  
                       var response = await http.get(
                            Uri.parse('https://worldtimeapi.org/api/timezone/${datas[index]}'));
                            
                        Map data = jsonDecode(response.body);
                        String dateTime = data['datetime'];
                        String offset = data['utc_offset'].substring(1, 3);
                        DateTime time = DateTime.parse(dateTime);
                        time = time.add(Duration(hours: int.parse(offset)));
                        String formattedTime = DateFormat.jm().format(time);
                        formattedTime=formattedTime.replaceAll(":","");
                        formattedTime=formattedTime.replaceAll(" ","");
                         //5:08 PM
                         print("sssssssssssssss2222222222 newwwwwwwww");
                         print(formattedTime);
                         print(formattedTime.substring(2,4));
                  
                         int hour= formattedTime.length==6?int.parse( formattedTime.substring(0,2)):int.parse( formattedTime[0]);
                         int mnite= formattedTime.length==6?int.parse( formattedTime.substring(2,4)):int.parse( formattedTime.substring(1,3));
                         String am_pm=formattedTime.length==6?formattedTime.substring(4):formattedTime.substring(3);
                         print('hour is ${hour} and miniutes are : ${mnite}');
                  Navigator.push(context, MaterialPageRoute(builder: (Context)=>saacd(wadan: datas[index]=="Africa/Nairobi"?"Africa/Somalia":datas[index],hour: hour,miniutes: mnite,am_0r_pm: am_pm,)));
                  
                    },),
                  ),
                );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },

          // Future that needs to be resolved
          // inorder to display something on the Canvas
          future: getAll(),
        ),
      ),
    );
  }
}