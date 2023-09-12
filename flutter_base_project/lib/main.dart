import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentations/home/home_page.dart';
import 'package:flutter_base_project/presentations/info/info_page.dart';
import 'package:flutter_base_project/utils/common/alice_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_base_project/utils/common/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VI')],
    path: 'assets/translations', // <-- change the path of the translation files
    fallbackLocale: const Locale('vi', 'VI'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(
            create: (BuildContext context) => AppCubit(AppInitState()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _index = 0;

  void _seupAlice() {
    if (mounted) {
      Future.delayed(const Duration(seconds: 2))
          .then((value) => OverlayAlive.insertOverlay(context));
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _seupAlice();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: _index,
            children: [HomePage(), InfoPage()],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            items: [
              BottomNavigationBarItem(
                  label: 'home'.tr(), icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: 'info'.tr(), icon: Icon(Icons.info)),
            ],
            onTap: (index) {
              setState(() {
                _index = index;
              });
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
