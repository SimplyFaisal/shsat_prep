import 'package:flutter/material.dart';

class ResourcesTab extends StatefulWidget {
  @override
  _ResourcesTabState createState() => _ResourcesTabState();
}

class _ResourcesTabState extends State<ResourcesTab> {
  @override
  Widget build(BuildContext context) {
    return Container(child: ResourceList());
  }
}

// stores ExpansionPanel state information
class ResourceItem {
  String title;
  String date;
  String subtitle;
  String text;
  bool isExpanded;

  ResourceItem({
    this.title,
    this.date,
    this.subtitle,
    this.text,
    this.isExpanded = false,
  });
}

class ResourceList extends StatefulWidget {
  ResourceList({Key key}) : super(key: key);

  @override
  _ResourceListState createState() => _ResourceListState();
}

class _ResourceListState extends State<ResourceList> {
  List<ResourceItem> _data = [
    ResourceItem(
      title: 'Collect HS Handbook',
      date: 'September 15, 2020',
      subtitle: 'Subtitle',
      text: 'Lorem ipsum.....',
    ),
    ResourceItem(
      title: 'Stuyvesant Highschool Tour',
      date: 'September 25, 2020',
      subtitle: 'Subtitle',
      text: 'Lorem ipsum.....',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((ResourceItem item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
                title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(item.title),
                Text(item.date),
              ],
            ));
          },
          body: ListTile(
            title: Text(item.subtitle),
            subtitle: Text(item.text),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
