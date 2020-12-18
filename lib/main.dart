import 'package:demo_languges/blocs/language/language_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App name here',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => LanguageBloc(InitialLanguageState()),
        child: BlocListener<LanguageBloc, LanguageState>(
          listener: (context, state) {
            // if (state is InitialLanguageState) {
            //   BlocProvider.of<LanguageBloc>(context)
            //       .add(LoadLanguageEvent(Locale('en', 'EN')));
            // }
          },
          child: BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) => MyHomePage(),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.appTitle),
        actions: [
          IconButton(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      title: Text(S.current.languages),
                      content: SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                                AppLocalizationDelegate()
                                    .supportedLocales
                                    .length, (index) {
                              final item = AppLocalizationDelegate()
                                  .supportedLocales[index];
                              return Card(
                                child: ListTile(
                                  onTap: () {
                                    BlocProvider.of<LanguageBloc>(context)
                                        .add(LoadLanguageEvent(item));
                                    Navigator.of(context).pop();
                                  },
                                  title: Text(item?.languageCode ?? ''),
                                  subtitle: Text(
                                      item?.countryCode ?? 'No Country Code'),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(S.current.close),
                          onPressed: () {
                            Navigator.of(dialogContext)
                                .pop(); // Dismiss alert dialog
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.language))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S.current.haiDuaTre, textAlign: TextAlign.justify,),
            ),
            SizedBox(height: 30),
            Text(
              '${S.current.pushManyTimes}:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: S.current.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
