import 'package:flutter/material.dart';
import 'package:rent_house/Conrtoller/Filter/updateApis.dart';
import 'package:rent_house/View/Navigation/navBar.dart';
import 'package:rent_house/View/Setting/widgets/textWidget.dart';
import 'package:rent_house/widgets/rowButton.dart';
import 'package:rent_house/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Config/color.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});
  @override
  State<Setting> createState() => _SettingState();
}

bool isloading = false;
TextEditingController name = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController contact = TextEditingController();

String userName = "";
String userAddress = "";
String userContact = "";
var userRole = "";

class _SettingState extends State<Setting> {
  @override
  void dispose() {
    name.dispose();
    contact.dispose();
    address.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      userName = pref.getString(
        "_name",
      )!;
      userAddress = pref.getString(
        "_address",
      )!;
      userContact = pref.getString(
        "_contact",
      )!;
    });
  }

  bool validData() {
    if (name.text.toString().isEmpty &&
        address.text.toString().isEmpty &&
        contact.text.toString().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: blue,
        content: Text("Enter Value to to update"),
        duration: Duration(milliseconds: 1000),
      ));
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 214, 210, 210),
                              offset: Offset(1.0, 1.0),
                              blurRadius: 9.0,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 25,
                              color: blue,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Navbar()),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  isloading == true
                      ? const Center(child: CircularProgressIndicator())
                      : SizedBox(height: size.height * 0.042),
                  text(
                      title: "Personal Information",
                      fontsize: 18.0,
                      fontweight: FontWeight.bold),
                  SizedBox(height: size.height * 0.042),
                  text(
                      title: "General",
                      fontsize: 18.0,
                      fontweight: FontWeight.normal),

                  //personal Information
                  SizedBox(height: size.height * 0.032),

                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text('Update Your ' + "Name"),
                            content: ListView(
                              shrinkWrap: true,
                              children: [
                                // widget.text1 == 'Gender'
                                //     ? GenderPopUP()
                                TextFormField(
                                  controller: name,
                                  decoration:
                                      const InputDecoration(hintText: "Name"),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Send them to your email maybe?
                                  Navigator.pop(context);
                                },
                                child: Text('Save'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: textWidget(
                      text1: "Name",
                      text2: userName,
                    ),
                  ),
                  SizedBox(height: size.height * 0.032),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text('Update Your ' + "Address"),
                            content: ListView(
                              shrinkWrap: true,
                              children: [
                                // widget.text1 == 'Gender'
                                //     ? GenderPopUP()
                                TextFormField(
                                  controller: address,
                                  decoration:
                                      InputDecoration(hintText: "Address"),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Send them to your email maybe?
                                  Navigator.pop(context);
                                },
                                child: Text('Save'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: textWidget(
                      text1: "Address",
                      text2: userAddress,
                    ),
                  ),

                  SizedBox(height: size.height * 0.032),

                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text('Update Your ' + "Contact"),
                            content: ListView(
                              shrinkWrap: true,
                              children: [
                                // widget.text1 == 'Gender'
                                //     ? GenderPopUP()
                                TextFormField(
                                  controller: contact,
                                  decoration: const InputDecoration(
                                      hintText: "Contact"),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Send them to your email maybe?

                                  var message = contact.text;
                                  Navigator.pop(context);
                                },
                                child: Text('Save'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: textWidget(
                      text1: "Contact",
                      text2: userContact,
                    ),
                  ),
                  SizedBox(height: size.height * 0.032),

                  Center(
                    child: rowButtonFun(
                        backgroundcolor: blue,
                        title1: "Update",
                        height: size.height * 0.04,
                        width: size.width * 0.43,
                        textColor: Color.fromARGB(255, 255, 255, 255),
                        ontap: () {
                          setState(() {
                            isloading = true;
                            ScaffoldMessenger.of(context).clearSnackBars();
                          });
                          if (validData() == true) {
                            print({name.text, contact.text, address.text});
                            updateData(
                                    name: name.text,
                                    address: address.text,
                                    contact: contact.text,
                                    context: context)
                                .then((value) => {
                                      setState(() {
                                        isloading = false;
                                        dispose();
                                      }),
                                    });
                          } else {
                            setState(() {
                              isloading = false;

                              // Get.to(LoginScreen());
                            });
                          }
                        }),
                  )
                ]),
          ),
        ),
      )),
    );
  }
}




///Upload FIle 
// var uri = Uri.parse("http://pub.dartlang.org/packages/create");
// var request = new http.MultipartRequest("POST", url);
// request.fields['user'] = 'john@doe.com';
// request.files.add(new http.MultipartFile.fromFile(
//     'package',
//     new File('build/package.tar.gz'),
//     contentType: new ContentType('application', 'x-tar'));
// request.send().then((response) {
//   if (response.statusCode == 200) print("Uploaded!");
// });