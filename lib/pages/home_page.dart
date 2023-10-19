import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:thesurvey/authentication/data/repositories/users_repo.dart';
import 'package:thesurvey/authentication/presentation/pages/login.dart';
import 'package:thesurvey/authentication/presentation/pages/signup.dart';
import 'package:thesurvey/constants/colors.dart';
import 'package:thesurvey/entites/survey_model.dart';
import 'package:thesurvey/pages/profile_page.dart';
import '../../../constants/values.dart';
import '../utils/fonts.dart';
import '../utils/methods.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int total = 0;
  int ongoing = 0;
  int upcomming = 0;
  int completed = 0;

  List<Survey> allSurvey = [];

  initilizeValues() async {
    total = await getSurveyCount('total');
    ongoing = await getSurveyCount('ongoing');
    upcomming = await getSurveyCount('upcomming');
    completed = await getSurveyCount('completed');
    allSurvey = await getAllSurvey();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    initilizeValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Container(
          margin: EdgeInsets.only(top: 26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: <Widget>[
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    padding: EdgeInsets.only(top: 28, left: 20, right: 20),
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                          radius: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hello'),
                            Text(
                              'John Doe',
                              style: MainFonts.lableText(),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 1,
                    color: Color(0xFFE6E8E7),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 12, bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.dashboard_outlined,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text('Dashboard',
                                      style: MainFonts.settingLabel()),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 12, bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star_border_outlined,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text('Ongoing Survey',
                                      style: MainFonts.settingLabel()),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 12, bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star_border_outlined,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text('Completed Survey',
                                      style: MainFonts.settingLabel()),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 12, bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.settings_outlined,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text('Setting',
                                      style: MainFonts.settingLabel()),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ProfileInfo())));
                    },
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 12, bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text('Profile',
                                      style: MainFonts.settingLabel()),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          contentPadding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          title: const Text('Want to Logout?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                updateLoginStatus(false);
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 12, bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.logout_outlined,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text('Logout',
                                      style: MainFonts.settingLabel()),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: primaryColor,
        title: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset(
              logoPath,
              height: 80,
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: Icon(Icons.menu))
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                children: [
                  Container(
                      height: 40,
                      color: Colors.red,
                      child: Center(
                          child: Text(
                        'Notice Line ALL PAGES',
                        style: MainFonts.lableText(color: Colors.white),
                      )),
                    ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Marceter!',
                          style: MainFonts.dashText(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFB620CE),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/svg#Layer_1.png',
                                        height: 60,
                                        width: 60,
                                      ),
                                      Text(
                                        'Total Survey',
                                        style:
                                            TextStyle(fontSize: 16, color: Colors.white),
                                      ),
                                      Text(total.toString(),
                                          style: MainFonts.dashNoText()),
                                    ]),
                              ),
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/svg#Layer_1.png',
                                        height: 60,
                                        width: 60,
                                      ),
                                      Text(
                                        'Ongoing Survey',
                                        style:
                                            TextStyle(fontSize: 16, color: Colors.white),
                                      ),
                                      Text(ongoing.toString(),
                                          style: MainFonts.dashNoText()),
                                    ]),
                              ),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: thirdColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/svg#Layer_1.png',
                                        height: 60,
                                        width: 60,
                                      ),
                                      Text(
                                        'Upcoming Survey\'s',
                                        style:
                                            TextStyle(fontSize: 16, color: Colors.white),
                                      ),
                                      Text(upcomming.toString(),
                                          style: MainFonts.dashNoText()),
                                    ]),
                              ),
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: fourthColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/svg#Layer_1.png',
                                        height: 60,
                                        width: 60,
                                      ),
                                      Text(
                                        'Completed Survey\'s',
                                        style:
                                            TextStyle(fontSize: 16, color: Colors.white),
                                      ),
                                      Text(completed.toString(),
                                          style: MainFonts.dashNoText()),
                                    ]),
                              ),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]))
          ];
        },
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Last Activites',
                style: MainFonts.dashText(),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: allSurvey.length,
                  itemBuilder: (context, index) {
                    Survey survey = allSurvey[index];
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: listColors[index % listColors.length],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(children: [
                            Image.asset(
                              'assets/images/school.png',
                              height: 100,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    survey.surveyName,
                                    style: MainFonts.pageTitleText(
                                        color: Colors.white),
                                  ),
                                  Text(
                                    survey.description ?? '',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Start Date: ${survey.createdAt}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                  Text(
                                    'End Date: ${survey.date}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
