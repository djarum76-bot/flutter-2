import 'package:flutter/material.dart';
import 'package:proyek/sql_helper.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String,dynamic>> _journals = [];

  bool _isLoading = true;

  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshJournals();
  }

  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  DateTime? _selectedDate;

  void _showForm(int? id) async {
    if(id != null){
      final existingJournal = _journals.firstWhere((element) => element['id'] == id);
      _titleController.text = existingJournal['title'];
      _descriptionController.text = existingJournal['descriptiion'];
      _selectedDate = existingJournal['date'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        builder: (_) => Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          height: MediaQuery.of(context).size.height/1.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(hintText: 'Title'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(hintText: 'Description'),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: (){
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100))
                            .then((pickedDate) {
                          if(pickedDate == null){
                            return;
                          }
                          setState(() {
                            _selectedDate = pickedDate;
                          });
                        });
                      },
                      child: Text("Tanggal")
                  ),
                  SizedBox(width: 10,),
                  Container(
                    child: Text(_selectedDate != null ? _selectedDate.toString() : 'No Date Selected'),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // Save new journal
                      if (id == null) {
                        await _addItem();
                      }

                      if (id != null) {
                        await _updateItem(id);
                      }

                      // Clear the text fields
                      _titleController.text = '';
                      _descriptionController.text = '';

                      // Close the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Create New' : 'Update'),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Future<void> _addItem() async {
    await SQLHelper.createItem(_titleController.text, _descriptionController.text, _selectedDate!);
    _refreshJournals();
  }

  Future<void> _updateItem(int id) async{
    await SQLHelper.updateItem(id, _titleController.text, _descriptionController.text, _selectedDate!);
    _refreshJournals();
  }

  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Berhasil dihapus')
    ));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pencatatan"),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _journals.length,
              itemBuilder: (context, index) => Card(
                margin: EdgeInsets.all(15),
                child: ListTile(
                  title: Text(_journals[index]['title']),
                  subtitle: Text(_journals[index]['date'].toString()),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: (){
                              _showForm(_journals[index]['id']);
                            },
                            icon: Icon(Icons.edit)
                        ),
                        IconButton(
                            onPressed: (){
                              _deleteItem(_journals[index]['id']);
                            },
                            icon: Icon(Icons.delete)
                        )
                      ],
                    ),
                  ),
                ),
              )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _showForm(null)
      ),
    );
  }
}