import 'dart:io';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';

class AddElectPage extends StatefulWidget {
  final Function(String) addCandidate;

  const AddElectPage(this.addCandidate, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddElectPageState createState() => _AddElectPageState();
}

class _AddElectPageState extends State<AddElectPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _party = '';
  late File _image = File('');

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Candidate'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Candidate image
                GestureDetector(
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                  },
                  child: CircleAvatar(
                    radius: 50,
                    // ignore: unnecessary_null_comparison
                    backgroundImage: _image != null ? FileImage(_image) : null,
                    // ignore: unnecessary_null_comparison
                    child: _image == null ? const Icon(Icons.camera_alt) : null,
                  ),
                ),
                // Name
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                // Bio
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Bio'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a bio';
                    }
                    return null;
                  },
                  onSaved: (value) {},
                ),
                // Party
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Party'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a party';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _party = value!;
                  },
                ),
                // Add button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      widget.addCandidate('$_name - $_party');
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}