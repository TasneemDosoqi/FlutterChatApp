import 'package:chatflutterapp/Services/database.dart';
import 'package:chatflutterapp/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  bool isLoading = false;
  bool haveUserSearched = false;

  TextEditingController searchText = new TextEditingController();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  QuerySnapshot querySnapshot;

  InitiateSearch() async {
    if (searchText.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      await databaseMethods.getUserByUsername(searchText.text).then((snapshot) {
        querySnapshot = snapshot;
        print("$querySnapshot");

        setState(() {
          isLoading = false;
          haveUserSearched = true;
        });
      });
    }
  }


  Widget UserList() {
    return haveUserSearched ? ListView.builder(
        shrinkWrap: true,
        itemCount: querySnapshot.documentChanges.length,
        itemBuilder: (context, index) {
          return SearchTile(Username:querySnapshot.documents[index].data["Name"],
            Email: querySnapshot.documents[index].data["Email"],);
        }) : Container();
  }


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ) : Container(
        alignment: Alignment.center,

        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              width: 400,
              decoration: BoxDecoration(
                  color: Color(0xff464B53),
                  borderRadius: BorderRadius.circular(40)
              ),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchText,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: "Search username...",
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        border: InputBorder.none,

                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        InitiateSearch();
                        },
                      child: Image.asset(
                        "assets/images/search_icon.png", height: 25,)
                  ),
                ],
              ),
            ),
            UserList(),
          ],
        ),
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  final String Username;
  final String Email;

   SearchTile({this.Username, this.Email}) ;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Username, style: medimText(),),
              Text(Email, style: medimText(),),
            ],
          ),
          Spacer(),

          GestureDetector(
            onTap: () {
              //sendMessage(userName);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: Color(0xffB9789F),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text("Message", style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),),
            ),
          ),
        ],
      ),
    );
  }
}

