import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googleandfacebook/MATRIMONY%20ALL%20PAGES/BEST%20MATCHES%20PAGE/best_matches.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:select_form_field/select_form_field.dart';

import 'MATRIMONY SUPPORT PAGES/custom_text_form_field_button.dart';
import 'MATRIMONY SUPPORT PAGES/custom_two_empty_text_form_field.dart';

class MatrimonySearchYourPartner extends StatefulWidget {
  @override
  _MatrimonySearchYourPartnerState createState() =>
      _MatrimonySearchYourPartnerState();
}

class _MatrimonySearchYourPartnerState
    extends State<MatrimonySearchYourPartner> {
  @override
  void initState() {
    super.initState();
    setState(() {
      startingAgeController.text = '21';
      endingAgeController.text = '50';
    });
  }

  var startingAgeController = TextEditingController();
  var endingAgeController = TextEditingController();
  var onTapStart;
  var onTapEnd;
  var controller;
  var text;
  var icon, icon1;
  bool isClicked = false, isClickedSecond = false;
  var hintText;
  var hintText1;
  List<Map<String, dynamic>> items = [
    {
      'value': "123",
      'label': '454',
    },
    {
      'value': "127",
      'label': '658',
    },
    {
      'value': "124",
      'label': '89',
    },
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var status = MediaQuery.of(context).padding.top;
    var appBar = AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                HexColor('#0A4E51'),
                HexColor('#149BA1'),
              ],
            ),
          ),
        ),
        // backgroundColor: Colors.teal.shade700,
        title: Text(
          'Search your Partner',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        actions: [
          TextButton(
            onPressed: null,
            child: Text(
              'Back',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: (height - appBar),
        width: width,
        padding: EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customTwoHeading(height, appBar, width),
              SizedBox(
                height: ((height - appBar) * 0.004),
              ),
              customTwoEmptyTextFormField(
                height,
                appBar,
                width,
                icon = null,
                icon1 = null,
                hintText = null,
                hintText1 = null,
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customOneHeading(
                height,
                appBar,
                width,
                text = "Height (cm)",
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customTwoEmptyTextFormField(
                height,
                appBar,
                width,
                icon = null,
                icon1 = null,
                hintText = null,
                hintText1 = null,
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customOneHeading(
                height,
                appBar,
                width,
                text = "Age between(yrs)",
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              Container(
                height: (height - appBar) * 0.05,
                width: (width),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customTextFormFieldPlusButton(
                      height,
                      appBar,
                      width,
                      controller = startingAgeController,
                      onTapStart = null,
                      onTapEnd = null,
                    ),
                    customTextFormFieldPlusButton(
                      height,
                      appBar,
                      width,
                      controller = endingAgeController,
                      onTapEnd = null,
                      onTapStart = null,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customOneHeading(
                height,
                appBar,
                width,
                text = "Religion",
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customSelectFormField(height, appBar, width, hintText = null),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customOneHeading(
                height,
                appBar,
                width,
                text = "Caste",
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customSelectFormField(height, appBar, width, hintText = null),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customOneHeading(
                height,
                appBar,
                width,
                text = "Education Catergory",
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customSelectFormField(height, appBar, width, hintText = null),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customOneHeading(
                height,
                appBar,
                width,
                text = "Occupation Category",
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customSelectFormField(height, appBar, width, hintText = null),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customOneHeading(
                height,
                appBar,
                width,
                text = "Location",
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customTwoEmptyTextFormField(
                height,
                appBar,
                width,
                icon = Icons.arrow_drop_down,
                icon1 = Icons.arrow_drop_down,
                hintText = 'Country',
                hintText1 = 'State',
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customSelectFormField(
                  height, appBar, width, hintText = "District"),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              Container(
                height: (height - appBar) * 0.05,
                width: width,
                child: doubleRowButton(height, appBar, width),
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
            ],
          ),
        ),
      ),
    );
  }

  startIncrementDecrement() {}
  Container customSelectFormField(
      double height, double appBar, double width, hintText) {
    return Container(
      height: (height - appBar) * 0.05,
      width: (width),
      child: SelectFormField(
        // icon: Icon(Icons.people, color: Colors.black),
        // labelText: 'Gender',
        changeIcon: true,
        dialogTitle: 'Pick a item',
        dialogCancelBtn: 'CANCEL',
        enableSearch: true,
        dialogSearchHint: 'Search item',
        items: items,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
          filled: true,
          suffixIcon: Icon(
            Icons.arrow_drop_down,
          ),
          fillColor: Colors.white,

          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.teal, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.teal, width: 1),
          ),
          // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.teal, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.teal),
          ),
        ),
      ),
    );
  }

  Widget doubleRowButton(double height, double appBar, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isClicked = !isClicked;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.teal.shade700),
              color: isClicked == true ? Colors.teal : Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            height: (height - appBar) * 0.05,
            width: (width - 40) * 0.45,
            child: Center(
                child: Text(
              'Save',
              style: TextStyle(
                fontSize: 20,
                color: isClicked == true ? Colors.white : Colors.black,
              ),
            )),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isClickedSecond = !isClickedSecond;
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BestMatches()));
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.teal.shade700),
              color: isClickedSecond == true ? Colors.teal : Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            height: (height - appBar) * 0.05,
            width: (width - 40) * 0.45,
            child: Center(
                child: Text(
              'Search',
              style: TextStyle(
                fontSize: 20,
                color: isClickedSecond == true ? Colors.white : Colors.black,
              ),
            )),
          ),
        ),
      ],
    );
  }

  Container customOneHeading(double height, double appBar, double width, text) {
    return Container(
      height: (height - appBar) * 0.03,
      width: width,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget customTwoHeading(double height, double appBar, double width) {
    return Container(
      height: ((height - appBar)) * 0.05,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              'I am looking for a',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: width * 0.04,
          ),
          Container(
            padding: EdgeInsets.only(
              right: 40,
            ),
            child: Text(
              'Martial Status',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
