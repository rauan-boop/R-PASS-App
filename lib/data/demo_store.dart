import 'package:flutter/material.dart';

import '../config/app_colors.dart';

enum Severity {
  high('Высокая', AppColors.error),
  medium('Средняя', AppColors.warning),
  low('Низкая', AppColors.success);

  const Severity(this.label, this.color);
  final String label;
  final Color color;
}

enum Category {
  theft('Угон'),
  fraud('Мошенничество'),
  accident('ДТП'),
  lateReturn('Просрочка возврата'),
  dirty('Грязный салон'),
  debt('Долг'),
  other('Другое');

  const Category(this.label);
  final String label;
}

class Incident {
  Incident({
    required this.clientId,
    required this.category,
    required this.severity,
    required this.company,
    required this.date,
    required this.description,
    this.photos = 0,
    this.pending = false,
  });

  final String clientId;
  final Category category;
  final Severity severity;
  final String company;
  final DateTime date;
  final String description;
  final int photos;
  final bool pending;
}

class Client {
  Client({
    required this.id,
    required this.fullName,
    required this.iin,
    required this.phone,
  });

  final String id;
  final String fullName; // "Фамилия Имя Отчество"
  final String iin;
  final String phone; // digits only, e.g. 77771234567

  String get maskedName {
    final parts = fullName.split(' ');
    if (parts.length < 2) return fullName;
    return '${parts[1]} ${parts[0][0]}.';
  }

  String get maskedIin => '${iin.substring(0, 4)}******${iin.substring(10)}';

  String get maskedPhone =>
      '+7 ${phone.substring(1, 4)} *** ${phone.substring(7, 9)} ${phone.substring(9)}';

  String get initials {
    final parts = fullName.split(' ');
    if (parts.length < 2) return parts.first[0];
    return '${parts[0][0]}${parts[1][0]}';
  }
}

enum RiskLevel { clean, attention, blocked }

class Me {
  const Me({
    required this.fullName,
    required this.role,
    required this.company,
    required this.phone,
  });

  final String fullName;
  final String role;
  final String company;
  final String phone;

  bool get isAdmin => role == 'Admin';
}

String formatDate(DateTime d) =>
    '${d.day.toString().padLeft(2, '0')}.${d.month.toString().padLeft(2, '0')}.${d.year}';

/// In-memory demo store. Nothing leaves the browser.
class DemoStore extends ChangeNotifier {
  DemoStore._();
  static final DemoStore instance = DemoStore._();

  static const me = Me(
    fullName: 'Иванов Иван Иванович',
    role: 'Admin',
    company: 'АвтоПрокат Алматы',
    phone: '+7 777 *** 45 67',
  );

  final List<Client> clients = [
    Client(id: 'c1', fullName: 'Смирнов Иван Петрович', iin: '900312300123', phone: '77011234512'),
    Client(id: 'c2', fullName: 'Ахметов Данияр Серикович', iin: '880505301456', phone: '77025554433'),
    Client(id: 'c3', fullName: 'Петров Пётр Петрович', iin: '950820400987', phone: '77771234567'),
    Client(id: 'c4', fullName: 'Касымова Айгуль Нурлановна', iin: '010101600321', phone: '77056667788'),
    Client(id: 'c5', fullName: 'Орлов Сергей Андреевич', iin: '850214300765', phone: '77470001122'),
    Client(id: 'c6', fullName: 'Жумабаев Ержан Маратович', iin: '921130301890', phone: '77781112233'),
  ];

  final List<Incident> incidents = [
    Incident(
      clientId: 'c1',
      category: Category.theft,
      severity: Severity.high,
      company: 'АвтоПрокат Алматы',
      date: DateTime(2026, 9, 28),
      description:
          'Не вернул автомобиль в срок, телефон отключён. Машина найдена через 3 дня в другом городе.',
      photos: 3,
    ),
    Incident(
      clientId: 'c2',
      category: Category.debt,
      severity: Severity.medium,
      company: 'Аренда+',
      date: DateTime(2026, 10, 3),
      description: 'Не оплатил штрафы и 4 дня аренды. Обещания не выполнил.',
      photos: 1,
    ),
    Incident(
      clientId: 'c2',
      category: Category.lateReturn,
      severity: Severity.low,
      company: 'DriveGo',
      date: DateTime(2026, 7, 14),
      description: 'Вернул машину с опозданием на 6 часов.',
    ),
    Incident(
      clientId: 'c4',
      category: Category.accident,
      severity: Severity.high,
      company: 'RentCar KZ',
      date: DateTime(2026, 10, 9),
      description:
          'ДТП по вине клиента, подозрение на алкогольное опьянение. Составлен протокол.',
      photos: 5,
    ),
    Incident(
      clientId: 'c5',
      category: Category.dirty,
      severity: Severity.low,
      company: 'АвтоПрокат Алматы',
      date: DateTime(2026, 8, 21),
      description: 'Сильное загрязнение салона, потребовалась химчистка.',
      photos: 2,
    ),
    Incident(
      clientId: 'c6',
      category: Category.fraud,
      severity: Severity.high,
      company: 'Аренда+',
      date: DateTime(2026, 10, 12),
      description: 'Предъявил поддельное водительское удостоверение.',
      photos: 2,
      pending: true,
    ),
  ];

  Client clientById(String id) => clients.firstWhere((c) => c.id == id);

  List<Incident> incidentsOf(String clientId) =>
      incidents.where((i) => i.clientId == clientId).toList()
        ..sort((a, b) => b.date.compareTo(a.date));

  List<Incident> get latest =>
      [...incidents]..sort((a, b) => b.date.compareTo(a.date));

  RiskLevel riskOf(String clientId) {
    final list = incidentsOf(clientId).where((i) => !i.pending);
    if (list.isEmpty) return RiskLevel.clean;
    if (list.any((i) => i.severity == Severity.high)) return RiskLevel.blocked;
    return RiskLevel.attention;
  }

  void addIncident({
    required String fullName,
    required String iin,
    required Category category,
    required Severity severity,
    required String description,
    required int photos,
  }) {
    Client? client;
    for (final c in clients) {
      if (c.iin == iin) client = c;
    }
    if (client == null) {
      client = Client(
        id: 'c${clients.length + 1}',
        fullName: fullName,
        iin: iin,
        phone: '77000000000',
      );
      clients.add(client);
    }
    incidents.add(Incident(
      clientId: client.id,
      category: category,
      severity: severity,
      company: me.company,
      date: DateTime.now(),
      description: description,
      photos: photos,
      pending: true,
    ));
    notifyListeners();
  }
}
