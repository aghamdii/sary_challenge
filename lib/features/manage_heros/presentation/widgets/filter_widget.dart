import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';
import 'package:sary_challenge/core/style/style.dart';
import 'package:sary_challenge/core/utils/utils.dart';
import 'package:sary_challenge/features/manage_heros/data/models/models.dart';
import 'package:sary_challenge/features/manage_heros/data/repositories/repositories.dart';
import 'package:sary_challenge/features/manage_heros/presentation/providers/providers.dart';

// Widget used to filter heroes with names and power types

class FilterWidget extends StatefulWidget {
  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    final _heroesProvider = Provider.of<HeroesProvider>(context);
    final _typesProvider = Provider.of<TypesProvider>(context);

    return Card(
      child: ExpansionTile(
        maintainState: true,
        title: Text(
          'Filter',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.textMultiplier * 2,
          ),
        ),
        children: <Widget>[
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 4,
                ),
                child: TextField(
                  onChanged: (value) {
                    print(value);
                    _heroesProvider.filterHeroByName(
                        value, _typesProvider.selectedTypesIds);
                  },
                  keyboardType: TextInputType.text,
                  cursorColor: AppColors.secondaryColor,
                  decoration: InputDecoration(
                    hintText: "Name",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              FutureBuilder<List<TypeModel>>(
                future: TypesRepositoryImplementation().fetchTypes(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: SizeConfig.heightMultiplier * 8,
                      child: GroupButton(
                        isRadio: false,
                        spacing: 20,
                        selectedColor: AppColors.primaryColor,
                        onSelected: (index, isSelected) {
                          if (isSelected) {
                            // Add index to selectedTypeIds array
                            _typesProvider.addTypeId(index + 1);
                            _heroesProvider.filterHeroByTypes(
                                _typesProvider.selectedTypesIds);
                          } else {
                            // Remove index from selectedTypeIds array
                            _typesProvider.removeTypeId(index + 1);
                            _heroesProvider.filterHeroByTypes(
                                _typesProvider.selectedTypesIds);
                          }
                        },
                        buttons:
                            snapshot.data.map((type) => type.title).toList(),
                      ),
                    );
                  } else {
                    return Text("No data!");
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
