import 'package:bloc_template/bloc/movies/movies_bloc.dart';
import 'package:bloc_template/config/components/internat_exception_widget.dart';
import 'package:bloc_template/config/routes/routes_name.dart';
import 'package:bloc_template/localization/languages.dart';
import 'package:bloc_template/localization/locale_key.dart';
import 'package:bloc_template/main.dart';
import 'package:bloc_template/services/session_manager/session_controller.dart';
import 'package:bloc_template/services/storage/local_storage.dart';
import 'package:bloc_template/utils/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ScrollController _scrollController = ScrollController();
  late MoviesBloc moviesBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moviesBloc = MoviesBloc(moviesRepository: getIt());
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        moviesBloc.add(MoviesFetched(page: moviesBloc.state.lastPage+1));
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    moviesBloc.close();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKey.helloWorld.getString(context)),
        actions: [
          Switch(value: themeMode.value == ThemeMode.dark, onChanged: (value) async{
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool("darkTheme", value);
            themeMode.value = value ? ThemeMode.dark : ThemeMode.light;
          },),
          Switch(
            value: localization.currentLocale == const Locale(Languages.hindi), onChanged: (value) {
            localization.translate(localization.currentLocale == const Locale(Languages.english) ? Languages.hindi : Languages.english);
          },),
          IconButton(onPressed: () async{
            await LocalStorage().clearValue('isLogin');
            await LocalStorage().clearValue('token');
            await SessionController().getUserFromPreference();
            Navigator.pushNamed(context, RoutesName.loginScreen);
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: BlocProvider(
        create: (context) => moviesBloc..add(MoviesFetched(page: 1)),
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            switch(state.moviesList.status){
              case Status.loading :
                return const Center(child: CircularProgressIndicator());
              case Status.error :
                // if(state.moviesList.message != ''){
                //   return InternetExceptionWidget(
                //     onTap: () {
                //       moviesBloc.add(MoviesFetched(page: state.lastPage));
                //     },
                //   );
                // }
                return Center(child: Text(state.moviesList.message!));
              case Status.completed :
                if(state.tvShows.isEmpty){
                  return const Center(child: Text("No data found"));
                }
                final moviesList = state;
                return ListView.builder(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: moviesList.tvShows.length + 1,
                  itemBuilder: (context, index) {
                    if(index == moviesList.tvShows.length){
                      return const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    final tvShow = moviesList.tvShows[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: ClipOval(
                            child: Image.network(
                                tvShow.imageThumbnailPath,
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.image);
                              },
                            ),
                          ),
                        ),
                        title: Text(tvShow.name),
                        subtitle: Text(tvShow.network),
                        trailing: Text(tvShow.status),
                      ),
                    );
                  },
                );
              default :
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
