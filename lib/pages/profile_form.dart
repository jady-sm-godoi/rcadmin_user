import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rcadmin_user/data/dummy_profile.dart';
import 'package:rcadmin_user/model/user_profile.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:image_picker/image_picker.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

final List<Map<String, dynamic>> _items = [
  {
    'value': 'single',
    'label': 'Solteiro(a)',
  },
  {
    'value': 'married',
    'label': 'Casado(a)',
  },
  {
    'value': 'divorced',
    'label': 'Divorciado(a)',
  },
  {
    'value': 'widower',
    'label': 'Viúvo(a)',
  },
];

class _ProfileFormState extends State<ProfileForm> {
  File? _storedImage;

  _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    XFile imageFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    ) as XFile;

    setState(() {
      _storedImage = File(imageFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editando meus dados'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'nome social:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'e-mail:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'telefone celular:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'telefone:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'SOS contato:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'SOS telefone:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Rua:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'número:',
                          labelStyle: TextStyle(color: Colors.blueGrey)),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'complemento:',
                          labelStyle: TextStyle(color: Colors.blueGrey)),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Bairro:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Cidade:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      maxLength: 2,
                      decoration: const InputDecoration(
                          counterText: '',
                          labelText: 'UF:',
                          labelStyle: TextStyle(color: Colors.blueGrey)),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: '01234-000',
                          labelText: 'CEP:',
                          labelStyle: TextStyle(color: Colors.blueGrey)),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Profissão:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: '01/01/2000',
                          labelText: 'Data Nascimento:',
                          labelStyle: TextStyle(color: Colors.blueGrey)),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  Expanded(
                      child: SelectFormField(
                    type: SelectFormFieldType.dropdown,
                    decoration: const InputDecoration(
                        labelText: 'Estado civil:',
                        labelStyle: TextStyle(color: Colors.blueGrey)),
                    items: _items,
                    onChanged: (val) {},
                    onSaved: (val) {},
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 180,
                      height: 240,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: _storedImage != null
                          ? Image.file(
                              _storedImage!,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : const Text(
                              'Nenhuma imagem',
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: const Icon(
                          Icons.camera,
                          size: 50,
                          color: Colors.blueGrey,
                        ),
                        onPressed: _takePicture,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
