import 'package:flutter/material.dart';
import 'package:gestec/core/constants/colors.dart'; // Asegúrese de tener definido `CustomColor.primaryColor`

class MainDashboard extends StatefulWidget {
  final double headerHeight;

  const MainDashboard({super.key, required this.headerHeight});

  @override
  MainDashboardState createState() => MainDashboardState();
}

class MainDashboardState extends State<MainDashboard> {
  final actividades = [
    {'usuario': 'Alicia', 'accion': 'Inició Sesión', 'tiempo': 'hace 2m'},
    {
      'usuario': 'Roberto',
      'accion': "Actualizó 'Página de Precios'",
      'tiempo': 'hace 1h'
    },
    {
      'usuario': 'Sistema',
      'accion': "Nuevo Rol 'Agente de Soporte' creado",
      'tiempo': 'hace 3h'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          // Encabezado
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: widget.headerHeight,
                child: const Center(
                  child: Text(
                    'Panel de control',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Crear Usuario'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.primaryColor,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),

          // Tarjetas resumen
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _SummaryCard(
                title: 'Usuarios Activos',
                value: '125',
                icon: Icons.group,
                color: Colors.blue,
              ),
              _SummaryCard(
                title: 'Actividades Recientes',
                value: '58',
                icon: Icons.history,
                color: Colors.green,
              ),
              _SummaryCard(
                title: 'Roles Definidos',
                value: '4',
                icon: Icons.security,
                color: Colors.orange,
              ),
              _SummaryCard(
                title: 'Salud del Sistema',
                value: 'Óptima',
                icon: Icons.monitor_heart,
                color: Colors.grey,
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Fuente de Actividad Reciente',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                  'Un vistazo rápido a las últimas acciones dentro del sistema.'),
                              const SizedBox(height: 12),
                              // Expanded(
                              //   child: ListView.builder(
                              //     itemCount: actividades.length,
                              //     itemBuilder: (context, index) {
                              //       final actividad = actividades[index];
                              //       return ListTile(
                              //         leading: CircleAvatar(
                              //           child: Text(
                              //             actividad['usuario']![0],
                              //           ),
                              //         ),
                              //         title: Text(
                              //             '${actividad['usuario']} ${actividad['accion']}'),
                              //         subtitle: Text(actividad['tiempo']!),
                              //       );
                              //     },
                              //   ),
                              // ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                  onPressed: () {},
                                  child:
                                      const Text('Ver todas las actividades'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Enlaces Rápidos',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                  'Navega a áreas clave de la aplicación.'),
                              const SizedBox(height: 12),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  // Calcula el ancho para dos botones por fila, restando el espacio entre ellos
                                  double buttonWidth =
                                      (constraints.maxWidth - 10) / 2;
                                  return Wrap(
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: [
                                      _QuickLink(
                                        icon: Icons.people,
                                        label: 'Gestionar Usuarios',
                                        width: buttonWidth,
                                      ),
                                      _QuickLink(
                                        icon: Icons.lock,
                                        label: 'Gestionar Permisos',
                                        width: buttonWidth,
                                      ),
                                      _QuickLink(
                                        icon: Icons.settings,
                                        label: 'Configuración del Sistema',
                                        width: buttonWidth,
                                      ),
                                      _QuickLink(
                                        icon: Icons.receipt_long,
                                        label: 'Ver Registros Completos',
                                        width: buttonWidth,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// Componente reutilizable de tarjeta resumen
class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? color;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Icon(icon, color: color),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final double? width;

  const _QuickLink({
    required this.icon,
    required this.label,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade200,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: const BorderSide(
              color: Color.fromARGB(255, 208, 208, 208),
              width: 1,
            ),
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
