import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sary_challenge/core/utils/utils.dart';
import 'package:sary_challenge/core/widgets/widgets.dart';
import 'package:sary_challenge/features/manage_heros/data/models/models.dart';
import 'package:sary_challenge/features/manage_heros/data/repositories/repositories.dart';
import 'package:sary_challenge/features/manage_heros/presentation/providers/providers.dart';
import 'package:sary_challenge/features/manage_heros/presentation/widgets/widgets.dart';

// This screen is used to show and filter heroes

class AllHeroesScreen extends StatefulWidget {
  static const String route = "/all_heroes_screen";

  const AllHeroesScreen({Key key}) : super(key: key);

  @override
  _AllHeroesScreenState createState() => _AllHeroesScreenState();
}

class _AllHeroesScreenState extends State<AllHeroesScreen> {
  Future<List<HeroModel>> getHeroesFuture;
  bool loading = true;

  // Fetch heroes from repository initialy when the screen is created
  @override
  void initState() {
    initializeHeroesProvider();
    super.initState();
  }

  // Perform the repository fetch call, and change the loading variable value
  initializeHeroesProvider() async {
    List<HeroModel> heroesList =
        await HeroesRepositoryImplementation().fetchHeros();
    final _heroesProvider = Provider.of<HeroesProvider>(context, listen: false);
    _heroesProvider.setHeroesList(heroesList);
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    final _heroesProvider = Provider.of<HeroesProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 0,
            child: Container(
              margin: EdgeInsets.only(
                left: SizeConfig.heightMultiplier * 1.2,
                top: SizeConfig.heightMultiplier * 6,
              ),
              alignment: Alignment.bottomLeft,
              child: TitleTextWidget(
                text: "Heroes base.",
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 1),
              child: Column(
                children: [
                  Expanded(
                    flex: 0,
                    child: FilterWidget(),
                  ),
                  Expanded(
                    child: loading == true
                        ? LoadingWidget()
                        : _heroesProvider.filteredList.length == 0
                            ? Center(
                                child: SecondaryTextWidget(
                                    text: "No available heros"),
                              )
                            : ListView(
                                children: _heroesProvider.filteredList
                                    .map((hero) => HeroCardWidget(hero: hero))
                                    .toList(),
                              ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
