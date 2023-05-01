import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _atividades = [
    'Atividade 1',
    'Atividade 2',
    'Atividade 3'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Lista de Atividades'),
      ),
      body: ListView.separated(
        itemCount: _atividades.length,
        padding: const EdgeInsets.all(8),
        separatorBuilder: (context, index) => const Divider(  
          indent: Checkbox.width * 1,
          thickness: 1, 
          height: 1,
          color: Color.fromARGB(255, 15, 62, 60),
          endIndent: Checkbox.width * 1,
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_atividades[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  // Adicionar o evento de editar na atividade
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Editar Atividade'),
                          content: TextField(
                            controller: _controller,
                            autofocus: true,
                            decoration: const InputDecoration(
                              hintText: 'Digite a nova atividade',
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, _controller.text);
                              },
                              child: const Text('Editar'),
                            ),
                          ],
                        );
                      },
                    ).then((value) {
                      if (value != null && value.isNotEmpty) {
                        setState(() {
                          _atividades[index] = value;
                        });
                      }
                      _controller.clear();
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  // Adicionar o evento de delete na atividade
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Excluir atividade?'),
                          content: const Text(
                              'Tem certeza que deseja excluir essa atividade?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _atividades.removeAt(index);
                                });
                                Navigator.of(context).pop();
                              },
                              child: const Text('Excluir'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        //abrir janela para adicionar nova atividade
        backgroundColor: Colors.greenAccent[700],
        onPressed: () async {
          final String? novaAtividade = await showDialog<String>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Adicionar Atividade'),
                content: TextField(
                  controller: _controller,
                  autofocus: true,
                  decoration: const InputDecoration(
                      hintText: 'Digite a nova atividade'),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, _controller.text);
                    },
                    child: const Text('Adicionar'),
                  ),
                ],
              );
            },
          );
          if (novaAtividade != null && novaAtividade.isNotEmpty) {
            setState(() {
              _atividades.add(novaAtividade);
            });
          }
          _controller.clear();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
