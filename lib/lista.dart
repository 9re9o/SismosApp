import 'package:flutter/material.dart';

class Place {
  final String name;
  final String description;

  Place({required this.name, required this.description});
}

class ListaHome extends StatelessWidget {
  final List<Place> places = [
    Place(
      name: 'Monteverde',
      description:
          'Una zona de conservación y reserva natural en el centro de Costa Rica.',
    ),
    Place(
      name: 'Tortuguero',
      description:
          'Un importante destino turístico para observar las tortugas marinas.',
    ),
    Place(
      name: 'Manuel Antonio',
      description:
          'Famoso por su hermoso parque nacional y sus playas tropicales.',
    ),
    Place(
      name: 'Volcán Arenal',
      description:
          'Un volcán activo y un destino popular para actividades al aire libre.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lugares de Costa Rica'),
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(places[index].name),
            subtitle: Text(places[index].description),
            leading: CircleAvatar(
              child: Text((index + 1).toString()),
            ),
            onTap: () {
              // Action to perform when the tile is tapped
            },
          );
        },
      ),
    );
  }
}
