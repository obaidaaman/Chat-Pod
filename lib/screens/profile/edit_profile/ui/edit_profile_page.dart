import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_pod/screens/profile/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:space_pod/screens/profile/view_profile/bloc/profile_detail_bloc.dart';
import 'package:space_pod/screens/profile/view_profile/ui/profil_page.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController password = TextEditingController();
    return BlocProvider(
      create: (context) => EditProfileBloc()..add(ProfileFetchEvent()),
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
          title: const Text(
            ' Edit Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: BlocConsumer<EditProfileBloc, EditProfileState>(
          listener: (context, state) {
            if (state is EditProfileLoadedState) {
              name.text = state.name;
              email.text = state.email;
              password.text = state.password;
            } else if (state is EditProfileSavedState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            }
          },
          builder: (context, state) {
            if(state is EditProfileSavedLoadingState){
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.grey.shade900,
                ),
              );
            }
            if (state is EditProfileLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.grey.shade900,
                ),
              );
            } else if (state is EditProfileLoadedState) {

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: const Image(
                              image: AssetImage('assets/gemini.png'),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 5,
                            child: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.grey.shade600,
                                size: 40,
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue.shade800)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11)),
                            label: const Text(
                              'Full Name',
                              style: TextStyle(color: Colors.white54),
                            ),
                            prefixIcon: const Icon(Icons.person)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue.shade800)),
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11)),
                            label: const Text(
                              'Email',
                              style: TextStyle(color: Colors.white54),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue.shade800)),
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11)),
                            label: const Text(
                              'Password',
                              style: TextStyle(color: Colors.white54),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                          decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue.shade800)),
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)),
                        label: const Text(
                          'Phone No',
                          style: TextStyle(color: Colors.white54),
                        ),
                      )),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<EditProfileBloc>(context).add(
                              SaveButtonClickedEvent(
                                  name.text, email.text, password.text, ''));
                          //   Navigator.push(context,
                          //       MaterialPageRoute(builder: (context) => const ProfilePage()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade900),
                        child: const Text(
                          'Save Data',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
