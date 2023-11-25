String traducirNombre(String nombre) {
  final sustituciones = {
    '_L1': '\nMetro - Línea 1',
    '_L2': '\nMetro - Línea 2',
    '_L3': '\nMetro - Línea 3',
    '_L4': '\nMetro - Línea 4',
    '_L5': '\nMetro - Línea 5',
    '_L6': '\nMetro - Línea 6',
    '_L7': '\nMetro - Línea 7',
    '_L8': '\nMetro - Línea 8',
    '_L9': '\nMetro - Línea 9',
    '_LA': '\nMetro - Línea A',
    '_LB': '\nMetro - Línea B',
    '_L12': '\nMetro - Línea 12',
    '_MBL1': '\nMetroBús - Línea 1',
    '_MBL2': '\nMetroBús - Línea 2',
    '_MBL3': '\nMetroBús - Línea 3',
    '_MBL4': '\nMetroBús - Línea 4',
    '_MBL5': '\nMetroBús - Línea 5',
    '_MBL6': '\nMetroBús - Línea 6',
    '_MBL7': '\nMetroBús - Línea 7',
    '_CBL1': '\nCableBús - Línea 1',
    '_CBL2': '\nCableBús - Línea 2',
    '_TL': '\nTren Ligero',
  };

  final keysToReplace =
      sustituciones.keys.where((clave) => nombre.endsWith(clave)).toList();

  for (final clave in keysToReplace) {
    nombre = nombre.replaceAll(clave, sustituciones[clave]!);
  }

  List<String> partes = nombre.split('_');
  partes = partes
      .map((parte) => parte[0].toUpperCase() + parte.substring(1))
      .toList();
  return partes.join(' ');
}

String traducirNombreTransborde(String nombre) {
  final sustituciones = {
    'L1': ' Línea 1 del Metro',
    'L2': ' Línea 2 del Metro',
    'L3': ' Línea 3 del Metro',
    'L4': ' Línea 4 del Metro',
    'L5': ' Línea 5 del Metro',
    'L6': ' Línea 6 del Metro',
    'L7': ' Línea 7 del Metro',
    'L8': ' Línea 8 del Metro',
    'L9': ' Línea 9 del Metro',
    'LA': ' Línea A del Metro',
    'LB': ' Línea B del Metro',
    'L12': ' Línea 12 del Metro',
    'MBL1': ' Línea 1 del MetroBús',
    'MBL2': ' Línea 2 del MetroBús',
    'MBL3': ' Línea 3 del MetroBús',
    'MBL4': ' Línea 4 del MetroBús',
    'MBL5': ' Línea 5 del MetroBús',
    'MBL6': ' Línea 6 del MetroBús',
    'MBL7': ' Línea 7 del MetroBús',
    'CBL1': ' Línea 1 del CableBús',
    'CBL2': ' Línea 2 del CableBús',
    'TL': ' Tren Ligero',
  };

  final keysToReplace = sustituciones.keys.where((clave) {
    final regex = RegExp(r'\b' + clave + r'\b');
    return regex.hasMatch(nombre);
  }).toList();

  for (final clave in keysToReplace) {
    nombre = nombre.replaceAll(clave, sustituciones[clave]!);
  }

  List<String> partes = nombre.split('_');
  partes = partes
      .map((parte) => parte[0].toUpperCase() + parte.substring(1))
      .toList();
  return partes.join(' ');
}
