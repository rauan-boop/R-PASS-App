/// Mock data used when AppConfig.demoMode is enabled. Nothing here is real.
class DemoData {
  DemoData._();

  static const userId = '00000000-0000-4000-8000-000000000001';
  static const userEmail = 'demo@r-pass.local';
  static const companyId = '10000000-0000-4000-8000-000000000001';
  static const cityId = '20000000-0000-4000-8000-000000000001';

  static dynamic apiBody(String callName) {
    switch (callName) {
      case 'earchBlacklist':
        return _blacklist.where((r) => r['in_arhive'] != true).toList();
      case 'getBlacklistCount':
        return _blacklist.length;
      case 'getRecentBlacklistCount':
      case 'getRecentCountByCompany':
        return 7;
      case 'getCompaniesCount':
        return _companies.length;
      case 'getMyIPAddress':
        return {'ip': '127.0.0.1'};
      case 'getSignedUrl':
        return {'signedUrl': '', 'url': ''};
      default:
        return {'success': true};
    }
  }

  static List<Map<String, dynamic>> rows(String table) {
    switch (table) {
      case 'profiles':
        return _profiles;
      case 'bl_company':
        return _companies;
      case 'bl_blacklist':
        return _blacklist;
      case 'bl_files':
        return _files;
      case 'bl_update':
        return _updates;
      case 'city':
        return _cities;
      case 'user_and_company_details':
        return _details;
      default:
        return [];
    }
  }

  static int _seq = 0;

  static Map<String, dynamic> inserted(Map<String, dynamic> data) => {
        'id':
            '90000000-0000-4000-8000-${(DateTime.now().millisecondsSinceEpoch * 100 + _seq++ % 100).toString().padLeft(12, '0')}',
        'created_at': DateTime.now().toIso8601String(),
        ...data,
      };

  static String _ago(int days) =>
      DateTime.now().subtract(Duration(days: days)).toIso8601String();

  static final _cities = [
    {'id': cityId, 'created_at': _ago(300), 'city': 'Алматы'},
    {'id': '20000000-0000-4000-8000-000000000002', 'created_at': _ago(300), 'city': 'Астана'},
    {'id': '20000000-0000-4000-8000-000000000003', 'created_at': _ago(300), 'city': 'Шымкент'},
    {'id': '20000000-0000-4000-8000-000000000004', 'created_at': _ago(300), 'city': 'Караганда'},
  ];

  static final _companies = [
    {
      'id': companyId,
      'created_at': _ago(200),
      'company': 'Demo Realty',
      'id_admin': userId,
      'active': true,
      'city_id': cityId,
      'city': 'Алматы',
      'expiry_date': DateTime.now().add(const Duration(days: 45)).toIso8601String(),
    },
    {
      'id': '10000000-0000-4000-8000-000000000002',
      'created_at': _ago(150),
      'company': 'Астана Недвижимость',
      'id_admin': null,
      'active': true,
      'city_id': '20000000-0000-4000-8000-000000000002',
      'city': 'Астана',
      'expiry_date': DateTime.now().add(const Duration(days: 12)).toIso8601String(),
    },
    {
      'id': '10000000-0000-4000-8000-000000000003',
      'created_at': _ago(90),
      'company': 'Шымкент Дом',
      'id_admin': null,
      'active': false,
      'city_id': '20000000-0000-4000-8000-000000000003',
      'city': 'Шымкент',
      'expiry_date': DateTime.now().subtract(const Duration(days: 5)).toIso8601String(),
    },
  ];

  static Map<String, dynamic> _profile(String id, String username,
          String role, String surname, String name, String otch, String phone,
          String iin) =>
      {
        'id': id,
        'created_at': _ago(120),
        'username': username,
        'surname': surname,
        'name': name,
        'otchestvo': otch,
        'company_name': 'Demo Realty',
        'city_name': 'Алматы',
        'phone': phone,
        'role': role,
        'email': '$username@r-pass.local',
        'IIN': iin,
        'soglashenie': true,
        'soglasie': true,
        'personal_data': true,
        'soglasie_doc': '',
        'id_avtor': userId,
        'company_id': companyId,
        'pfoto': null,
        'agreement_pdf_path': '',
        'soglashenie_doc': '',
        'city_id': cityId,
        'active': true,
      };

  // The demo user must stay first: pages read the first row as "me".
  static final _profiles = [
    _profile(userId, 'demo_admin', 'admin', 'Демонстров', 'Демо', 'Админович',
        '+77010000001', '900101300001'),
    _profile('00000000-0000-4000-8000-000000000002', 'manager1', 'manager',
        'Иванова', 'Анна', 'Сергеевна', '+77010000002', '920202400002'),
    _profile('00000000-0000-4000-8000-000000000003', 'manager2', 'manager',
        'Сериков', 'Данияр', 'Маратович', '+77010000003', '880303500003'),
    _profile('00000000-0000-4000-8000-000000000004', 'manager3', 'manager',
        'Ким', 'Елена', 'Викторовна', '+77010000004', '950404600004'),
  ];

  static final _details = [
    for (final (i, p) in _profiles.indexed)
      {
        'id': p['id'],
        'username': p['username'],
        'role': p['role'],
        'surname': p['surname'],
        'name': p['name'],
        'phone': p['phone'],
        'IIN': p['IIN'],
        'id_avtor': userId,
        'company_id': companyId,
        'company_name': 'Demo Realty',
        'city': 'Алматы',
        'days_left': 45,
        'records_count': 12 - i * 3,
      },
  ];

  static Map<String, dynamic> _record(int n, String surname, String name,
          String otch, String iin, String phone, String desc, String sum,
          {bool archived = false, bool zapis = false}) =>
      {
        'id': '30000000-0000-4000-8000-${n.toString().padLeft(12, '0')}',
        'created_at': _ago(n * 3),
        'surname': surname,
        'name': name,
        'otchestvo': otch,
        'iin': iin,
        'pfone': phone,
        'opisanie': desc,
        'summa': sum,
        'company': companyId,
        'company_name': 'Demo Realty',
        'company_surname': 'Демонстров Д.А.',
        'pasport': 'N${12345670 + n}',
        'datevidachi': _ago(900 + n * 10),
        'contry': 'Казахстан',
        'grazhdanin_rk': true,
        'zapis': zapis,
        'photo': <String>[],
        'in_arhive': archived,
        'id_company': companyId,
        'id_avtor': userId,
        'search_field': '$surname $name $otch $iin $phone'.toLowerCase(),
      };

  static final _blacklist = [
    _record(1, 'Петров', 'Игорь', 'Александрович', '850101300111', '+77011111111',
        'Оставил квартиру в неудовлетворительном состоянии, не оплатил коммунальные услуги.', '150000'),
    _record(2, 'Смирнова', 'Ольга', 'Павловна', '900202400222', '+77022222222',
        'Задержка оплаты аренды на 3 месяца, съехала без предупреждения.', '420000'),
    _record(3, 'Ахметов', 'Ержан', 'Бауыржанович', '880303500333', '+77033333333',
        'Повреждение мебели и техники.', '95000', zapis: true),
    _record(4, 'Ли', 'Виктор', 'Сергеевич', '920404600444', '+77044444444',
        'Сдавал жильё в субаренду без согласия владельца.', '0'),
    _record(5, 'Нурланова', 'Айгерим', 'Талгатовна', '950505700555', '+77055555555',
        'Систематические нарушения правил проживания, жалобы соседей.', '60000', zapis: true),
    _record(6, 'Козлов', 'Дмитрий', 'Иванович', '830606800666', '+77066666666',
        'Не вернул залог после расторжения договора.', '200000'),
    _record(7, 'Тулеубаев', 'Асхат', 'Мейрамович', '910707900777', '+77077777777',
        'Просрочка платежей, угрозы в адрес агента.', '310000'),
    _record(8, 'Орлова', 'Мария', 'Андреевна', '870808100888', '+77088888888',
        'Архивная запись: долг погашен.', '120000', archived: true),
    _record(9, 'Бекетов', 'Нурсултан', 'Асетович', '940909200999', '+77099999999',
        'Архивная запись: спор урегулирован.', '45000', archived: true),
  ];

  static final _files = [
    {
      'id': '40000000-0000-4000-8000-000000000001',
      'created_at': _ago(10),
      'file_type': 'pdf',
      'file_url': '',
      'user_id': userId,
      'klient_id': '30000000-0000-4000-8000-000000000001',
      'user_surname': 'Демонстров',
      'user_name': 'Демо',
      'company_id': companyId,
    },
  ];

  static final _updates = [
    {
      'id': '50000000-0000-4000-8000-000000000001',
      'created_at': _ago(1),
      'url': '',
      'acteve': false,
    },
  ];
}
