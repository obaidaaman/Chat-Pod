import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_pod/screens/profile/edit_profile/ui/edit_profile_page.dart';

import '../bloc/profile_detail_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileDetailBloc bloc = ProfileDetailBloc();

    return BlocProvider(
      create: (context) => ProfileDetailBloc(),
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          leading: const Icon(
            Icons.keyboard_backspace_rounded,
            color: Colors.white,
          ),
          centerTitle: true,
          title:const Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: BlocBuilder<ProfileDetailBloc, ProfileDetailState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is EditProfileClickedState) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EditProfilePage()));
            }
            if (state is ProfileDetailInitial) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.grey.shade600,
                ),
              );
            } else if (state is DetailsLoadedState) {
              return Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image(
                              image: AssetImage('assets/gemini.png'),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Positioned(
                              bottom: 0,
                              right: 5,
                              child: Icon(
                                Icons.add,
                                size: 40,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.fullName,
                      style: const TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Text(
                      state.email,
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          bloc.add(EditProfileButtonClickedEvent());
                        },
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade900),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    ProfileMenus(
                      title: 'Settings',
                      icon: Icons.settings,
                      onPress: () {},
                    ),
                    ProfileMenus(
                      title: 'Log Out',
                      icon: Icons.power_settings_new_outlined,
                      onPress: () {},
                      textColor: Colors.red,
                      endIcon: false,
                    ),
                    ProfileMenus(
                      title: 'Delete Account',
                      icon: Icons.delete,
                      onPress: () {},
                      textColor: Colors.red,
                      endIcon: false,
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

class ProfileMenus extends StatelessWidget {
  const ProfileMenus({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.blue.withOpacity(0.8)),
        child: Icon(icon),
      ),
      title: Text(
        title,
        style: TextStyle(color: textColor, fontSize: 18),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1)),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade800,
              ),
            )
          : null,
    );
  }
}
