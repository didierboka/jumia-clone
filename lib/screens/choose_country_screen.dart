import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/country_flag_model.dart';

class ChooseCountryScreen extends StatefulWidget {
  const ChooseCountryScreen({super.key});

  @override
  State<ChooseCountryScreen> createState() => _ChooseCountryScreenState();
}

class _ChooseCountryScreenState extends State<ChooseCountryScreen> {


  var countryList = [
    'Cote d\'ivoire',
    'Senegal',
    'Algerie',
    'Egypte',
    'Ghana',
    'Kenya',
    'Maroc',
    'Nigeria',
    'Tunisie',
    'Ouganda',
    'Zimbabwe',
    'Burkina Faso',
    'Gambia',
    'Guinea',
    'Liberia',
    'Mali',
    'Mauritania',
    'Mozambique',
    'Rwanda',
    'Sao Tome et Principe',
    'Seychelles',
    'Togo',
    'Zambie',
    'Botswana',
    'Lesotho',
    'Namibia',
    'Sudan'
  ];
  var countryFlagList = [
    '🇨🇮',
    '🇸🇳',
    '🇩🇿',
    '🇪🇬',
    '🇬🇭',
    '🇰🇪',
    '🇲🇦',
    '🇳🇬',
    '🇹🇳',
    '🇺🇬',
    '🇿🇼',
    '🇧🇫',
    '🇬🇲',
    '🇬🇼',
    '🇱🇷',
    '🇲🇱',
    '🇲🇷',
    '🇲🇼',
    '🇷🇼',
    '🇺🇬',
    '🇰🇪',
    '🇸🇳',
  ];
  List<CountryFlagModel> countries = [];
  CountryFlagModel? _flagModel;


  @override
  void initState() {
    for (int i = 0; i < countryList.length && i < countryFlagList.length; i++) {
      countries.add(CountryFlagModel(name: countryList[i], flag: countryFlagList[i], color: Colors.white));
      log("${countries[i].name} => ${countries[i].flag} => ${countries[i].color}");
    }

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Card(
              elevation: 5.0,
              child: Container(
                color: Colors.white,
                height: 70.0,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        //  Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: Text(
                        'Choisissez le pays',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: countries
                    .map((country) => Card(
                          color: country.name == _flagModel?.name ? Colors.black.withAlpha(200) : country.color,
                          child: GestureDetector(
                            onTap: () {
                              _flagModel = country;
                              setState(() {});
                            },
                            child: ListTile(
                              title: Text(
                                country.name,
                                style: TextStyle(color: country.name == _flagModel?.name ? Colors.white : Colors.black),
                              ),
                              trailing: Text(
                                country.flag,
                                style: const TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            if (_flagModel != null)
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(_flagModel!.name, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black),),
                                content: Text(_flagModel!.flag, textAlign: TextAlign.center, style: TextStyle(fontSize: 40.0),),
                                actions: [
                                  TextButton(
                                    child: const Text('Fermer'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('Continer avec ce pays'),
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
