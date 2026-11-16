import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'th'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? thText = '',
  }) =>
      [enText, thText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // auth_4_Welcome
  {
    '2us9kno7': {
      'en': 'Customer',
      'th': 'ลูกค้า',
    },
    'jq1lb0ey': {
      'en': 'Business',
      'th': 'ธุรกิจ',
    },
    '82suvibl': {
      'en': 'Phone Number',
      'th': 'เบอร์โทรศัพท์',
    },
    'i3o27m81': {
      'en': 'Continue with Phone',
      'th': 'ดำเนินการต่อด้วยโทรศัพท์',
    },
    'pujg9nsi': {
      'en': 'Continue with Google',
      'th': 'ดำเนินการต่อด้วย Google',
    },
    'hpyrwzlu': {
      'en': 'Continue with Apple',
      'th': 'ดำเนินการต่อด้วยแอปเปิ้ล',
    },
    'g4o06fpa': {
      'en': 'By proceeding, you agree to the ',
      'th': 'การดำเนินการต่อแสดงว่าคุณยอมรับ',
    },
    'wln3s535': {
      'en': 'Privacy Policy',
      'th': 'นโยบายความเป็นส่วนตัว',
    },
    'k9eyvbhq': {
      'en': ' and ',
      'th': 'และ',
    },
    's11poj94': {
      'en': 'Terms of Use.',
      'th': 'เงื่อนไขการใช้งาน',
    },
    'xm1vhpny': {
      'en': 'Home',
      'th': 'บ้าน',
    },
  },
  // auth_4_OnboardingPhoneVerify
  {
    'b4k5037u': {
      'en': 'Verify Code',
      'th': 'ยืนยันรหัส',
    },
    'uj5ui28n': {
      'en': 'Enter the 6 digit code we sent to the number below: ',
      'th': 'กรอกรหัส 6 หลักที่เราส่งไปยังหมายเลขด้านล่าง:',
    },
    'gpavdr1z': {
      'en': 'Verify Code',
      'th': 'ยืนยันรหัส',
    },
    'a55xlxer': {
      'en': 'Home',
      'th': '',
    },
  },
  // auth_4_Home
  {
    '6o4puu03': {
      'en': 'Vouchers',
      'th': 'แลกรับ',
    },
    '6r7sedzc': {
      'en': 'Redeems',
      'th': 'แลกรับ',
    },
    'h5pyi9cr': {
      'en': 'See All',
      'th': 'ดูทั้งหมด',
    },
    'qc0a7het': {
      'en': 'Orders',
      'th': 'การสั่งซื้อ',
    },
    '7p2hpf30': {
      'en': 'See All',
      'th': 'ดูทั้งหมด',
    },
    'gnwfd895': {
      'en': 'Cards',
      'th': 'การ์ด',
    },
    'dfjn1jmq': {
      'en': 'Summary Overview',
      'th': 'ภาพรวมสรุป',
    },
    'sctr0crd': {
      'en': 'Transactions',
      'th': 'การทำธุรกรรม',
    },
    '52xw1mrr': {
      'en': 'Member\'s latest redeems',
      'th': 'การแลกล่าสุดของสมาชิก',
    },
    'tecz3xq3': {
      'en': 'See All',
      'th': 'ดูทั้งหมด',
    },
    '9tgel66w': {
      'en': 'Redeem Pending',
      'th': 'รอการแลกคืน',
    },
    'bu5y9whg': {
      'en': 'Redeem Confirmed',
      'th': 'ยืนยันการแลกรับแล้ว',
    },
    'p6frx5i9': {
      'en': 'Points Added',
      'th': 'คะแนนที่เพิ่มขึ้น',
    },
    'i3a2rt0f': {
      'en': 'Pre-Order',
      'th': 'สั่งซื้อล่วงหน้า',
    },
    'rs19ug6y': {
      'en': 'Search Transaction ID',
      'th': 'ค้นหา ID ธุรกรรม',
    },
    '8xla0pbr': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'th': 'คำอธิบายงานที่นี่ค่อนข้างยาวและอาจยาวถึงสองบรรทัด',
    },
    'rs1rfg0q': {
      'en': 'Orders:',
      'th': 'คำสั่งซื้อ:',
    },
    'icxrqpzt': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'th': 'คำอธิบายงานที่นี่ค่อนข้างยาวและอาจยาวถึงสองบรรทัด',
    },
    'siivr462': {
      'en': 'x ',
      'th': 'เอ็กซ์',
    },
    'myap26k7': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'th': 'คำอธิบายงานที่นี่ค่อนข้างยาวและอาจยาวถึงสองบรรทัด',
    },
    'b8q335wb': {
      'en': '⭐️',
      'th': '',
    },
    'efyivn3g': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'th': 'คำอธิบายงานที่นี่ค่อนข้างยาวและอาจยาวถึงสองบรรทัด',
    },
    'wp536kee': {
      'en': 'Account Options',
      'th': 'ตัวเลือกบัญชี',
    },
    'tjlhrsdl': {
      'en': 'Light Mode',
      'th': 'โหมดแสง',
    },
    'w16w0d00': {
      'en': 'Dark Mode',
      'th': 'โหมดมืด',
    },
    'cr9t6cce': {
      'en': 'Update Profile',
      'th': 'อัปเดตโปรไฟล์',
    },
    'wd4zk1qb': {
      'en': 'Transaction History',
      'th': 'ประวัติการทำธุรกรรม',
    },
    '7vx6qiae': {
      'en': 'Push Notification Marketing',
      'th': 'การตลาดการแจ้งเตือนแบบพุช',
    },
    'ul2oyuef': {
      'en': 'Business Settings',
      'th': 'การตั้งค่าธุรกิจ',
    },
    'f3r3eqy4': {
      'en': 'Delete Account',
      'th': 'ลบบัญชี',
    },
    'an5mih8n': {
      'en': 'Please authenticate to proceed.',
      'th': 'กรุณาทำการตรวจสอบเพื่อดำเนินการต่อ',
    },
    '62qs7i16': {
      'en': 'Switch Account',
      'th': 'สลับบัญชี',
    },
    'ngf93du4': {
      'en': 'Tips & Guides',
      'th': 'เคล็ดลับและคำแนะนำ',
    },
    '2m7ia6vb': {
      'en': 'Feature Request',
      'th': 'คำขอคุณลักษณะ',
    },
    '6mnn4h1m': {
      'en': 'Log out',
      'th': 'ออกจากระบบ',
    },
    'y49bxvzn': {
      'en': 'Scan QR',
      'th': 'สแกน QR',
    },
    'gz6diow4': {
      'en': 'Cancel',
      'th': '',
    },
  },
  // auth_4_OnboardingUserDetails
  {
    '7l15b04n': {
      'en': 'What\'s your name?',
      'th': 'คุณชื่ออะไร?',
    },
    'bhmbv429': {
      'en':
          'Enter a name that people would recognize so your friends can find you.',
      'th': 'กรอกชื่อที่คนอื่นจะจำได้เพื่อให้เพื่อนๆ ค้นหาคุณได้',
    },
    '16dn5h7x': {
      'en': 'Your Name',
      'th': 'ชื่อของคุณ',
    },
    '56so17ye': {
      'en': 'Short description (Optional)',
      'th': 'คำอธิบายสั้นๆ (ไม่บังคับ)',
    },
    'jhxwuy3k': {
      'en': 'Birth Date',
      'th': 'วันเกิด',
    },
    'f8d91tne': {
      'en': 'Congrats! Your account is created!',
      'th': 'ยินดีด้วย! บัญชีของคุณถูกสร้างขึ้นแล้ว!',
    },
    '1xzsmpgg': {
      'en': 'Just a few more steps and we\'ll have you onboarded!',
      'th': 'อีกเพียงไม่กี่ขั้นตอน เราก็จะได้คุณเข้าร่วมแล้ว!',
    },
    'kkkrx5r6': {
      'en': 'Please enter your name to continue',
      'th': 'กรุณากรอกชื่อเพื่อดำเนินการต่อ',
    },
    'abmpfywt': {
      'en': 'Please choose an option from the dropdown',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    'g450bzzc': {
      'en': 'Field is required',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    'lao2008h': {
      'en': 'Please choose an option from the dropdown',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    'nd1urqsw': {
      'en': 'Field is required',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    'wdci83l9': {
      'en': 'Please choose an option from the dropdown',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    '86kx4mfg': {
      'en': 'Upload your profile photo',
      'th': 'อัพโหลดรูปโปรไฟล์ของคุณ',
    },
    '5yd73ra6': {
      'en': 'Upload Image',
      'th': 'อัพโหลดรูปภาพ',
    },
    'x5zvqks0': {
      'en': 'Your profile!',
      'th': 'โปรไฟล์ของคุณ!',
    },
    'f1lb62hq': {
      'en': 'Congrats, you made it! We can\'t wait for you to get started!',
      'th': 'ยินดีด้วย คุณทำได้แล้ว! เราแทบจะรอไม่ไหวที่จะให้คุณเริ่มต้น!',
    },
    'ryi6x6g8': {
      'en': 'Your name',
      'th': 'ชื่อของคุณ',
    },
    '738lyu1a': {
      'en': 'Your Bio',
      'th': 'ชีวประวัติของคุณ',
    },
    '2swznqd0': {
      'en': 'Back',
      'th': 'กลับ',
    },
    '79vliqme': {
      'en': 'Home',
      'th': '',
    },
  },
  // auth_4_OnboardingCompanyDetails
  {
    'aabmmsna': {
      'en': 'Cancel Account Creation',
      'th': 'ยกเลิกการสร้างบัญชี',
    },
    'wajtdj7g': {
      'en': 'Congrats! Your account is created!',
      'th': '',
    },
    'he7vjwh4': {
      'en': 'Just a few more steps and we\'ll have you onboarded!',
      'th': '',
    },
    'xw2eyyiy': {
      'en': 'What\'s your business details?',
      'th': '',
    },
    'h7etx7yv': {
      'en':
          'Enter a name that people would recognize so your loyal customers can find you.',
      'th': '',
    },
    '29j850d9': {
      'en': 'Company Name',
      'th': '',
    },
    'lmu37oy8': {
      'en': 'Initial Branch Name',
      'th': '',
    },
    'v3t4ga6j': {
      'en': 'Short description',
      'th': '',
    },
    'kdpqqvdn': {
      'en': 'Instagram Link',
      'th': '',
    },
    'mbo7lt2d': {
      'en': 'Facebook Link',
      'th': '',
    },
    'cv0eutbj': {
      'en': 'Website Link',
      'th': '',
    },
    'fg73biui': {
      'en': ' Store Location',
      'th': '',
    },
    'krqf67i1': {
      'en': 'Please enter your name to continue',
      'th': '',
    },
    '2sb1ypyr': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'lszf2wk3': {
      'en': 'Field is required',
      'th': '',
    },
    '2okvbjdf': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'yn2glcf6': {
      'en': 'Field is required',
      'th': '',
    },
    '6pnsnhbo': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'ft7sczct': {
      'en': 'Field is required',
      'th': '',
    },
    '7oc1i07v': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'lik39afa': {
      'en': 'Field is required',
      'th': '',
    },
    '5x7own7x': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'ah9reuzr': {
      'en': 'Field is required',
      'th': '',
    },
    'sq4tkj65': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'i4pgf4y9': {
      'en': 'Upload your logo',
      'th': '',
    },
    'sxcd3u95': {
      'en': 'Upload Image',
      'th': '',
    },
    'cc0wvfit': {
      'en': 'Add some pictures to showcase! ',
      'th': '',
    },
    'zemjypss': {
      'en': 'Upload Image',
      'th': '',
    },
    '184s6h35': {
      'en': 'Add your menu to showcase!',
      'th': '',
    },
    'onv1ojy5': {
      'en': 'Upload Image',
      'th': '',
    },
    'n3st3kde': {
      'en': 'Design your membership card',
      'th': '',
    },
    'kuoobd66': {
      'en':
          'Customize your membership card with your desired text color and card background image.',
      'th': '',
    },
    'epjjcc0t': {
      'en': 'Pick Text Color',
      'th': '',
    },
    'mo7kzl97': {
      'en': 'Upload Image',
      'th': '',
    },
    'iwbxym4p': {
      'en': 'Unsplash Search',
      'th': '',
    },
    'ov20g5jq': {
      'en': 'Personalized your card background image',
      'th': '',
    },
    'grk7pqx9': {
      'en': 'Marketing Materials',
      'th': '',
    },
    'fzbde3lv': {
      'en': 'Your profile!',
      'th': '',
    },
    '5ygpmr6b': {
      'en':
          'Your store is live! Start rewarding customers—invite them to join your loyalty program now!',
      'th': '',
    },
    '93oz3zsn': {
      'en': 'Company name',
      'th': '',
    },
    'xcvflsjl': {
      'en': 'Your Bio',
      'th': '',
    },
    'yjvu19nn': {
      'en': 'Back',
      'th': '',
    },
    '608upojs': {
      'en': 'Home',
      'th': 'บ้าน',
    },
  },
  // StoreDiscovery
  {
    'm03wvrjt': {
      'en': 'Discovery',
      'th': '',
    },
    'brjbgma8': {
      'en': 'Search Stores',
      'th': '',
    },
  },
  // StoreDetails
  {
    'x36a4n8j': {
      'en': 'Gallery',
      'th': '',
    },
    'wsm4qtht': {
      'en': 'Redeem',
      'th': '',
    },
    'k1a5v0f7': {
      'en': 'Join The Club!\nUnlock Perks!',
      'th': '',
    },
    'p5ostdl0': {
      'en': 'Menu',
      'th': '',
    },
    'cwn3nijm': {
      'en': 'Select Branch',
      'th': '',
    },
    '7nfe18ur': {
      'en': 'Search',
      'th': '',
    },
    'f3tdok4j': {
      'en': 'Option 1',
      'th': '',
    },
    'uj1icjzj': {
      'en': 'Option 2',
      'th': '',
    },
    'o2doh42x': {
      'en': 'Option 3',
      'th': '',
    },
    'zcad582d': {
      'en': 'Option 1',
      'th': '',
    },
    'zoy22z0o': {
      'en': 'Option 2',
      'th': '',
    },
    'p7g9lumq': {
      'en': 'Option 3',
      'th': '',
    },
    '43kqsdog': {
      'en': 'Earn ⭐️',
      'th': '',
    },
    'kr89o99g': {
      'en': 'Price: ',
      'th': '',
    },
    'dn2c0z4e': {
      'en': 'Variations: ',
      'th': '',
    },
    'epgomax2': {
      'en': 'Earn ⭐️',
      'th': '',
    },
    'njhgvyie': {
      'en': 'Price: ',
      'th': '',
    },
    'src8kvab': {
      'en': 'Variations: ',
      'th': '',
    },
    'pakb65vy': {
      'en': 'Earn ⭐️',
      'th': '',
    },
    '2le7blsc': {
      'en': 'Price: ',
      'th': '',
    },
    '259riz09': {
      'en': 'Variations: ',
      'th': '',
    },
    '8syedpbr': {
      'en': 'Leaderboard',
      'th': '',
    },
    'su9wfq9a': {
      'en': 'Vouchers',
      'th': '',
    },
    '3l6fkyp0': {
      'en': 'Join The Club!\nUnlock Perks!',
      'th': '',
    },
    'anwr6r5t': {
      'en': 'Cart ·',
      'th': '',
    },
    'x3gzep5a': {
      'en': ' Members',
      'th': '',
    },
    'z15bysev': {
      'en':
          'Non so se la bellezza salverà il mondo ma sicuramente aiuta. Sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'th': '',
    },
    'dfbwedgn': {
      'en': 'Google Review',
      'th': '',
    },
    'asaifoxj': {
      'en': 'Home',
      'th': 'บ้าน',
    },
  },
  // MemberListPage
  {
    'omwnt45j': {
      'en': 'Member Search',
      'th': '',
    },
    'hsjywgkp': {
      'en': 'Cancel',
      'th': 'ยกเลิก',
    },
    '70y29a13': {
      'en': 'Members',
      'th': '',
    },
    '2i5auuao': {
      'en': 'Home',
      'th': '',
    },
  },
  // FeatureSuggestion
  {
    'uyi5t2h9': {
      'en': 'Feature Description',
      'th': '',
    },
    'bncb26s0': {
      'en': 'Describe the feature you\'d like to suggest',
      'th': '',
    },
    'arc8vy4r': {
      'en': 'Submit Suggestion',
      'th': '',
    },
    '5vi4a59o': {
      'en': 'By submitting this form, you agree to our privacy policy.',
      'th': '',
    },
    'fdaec1m5': {
      'en': 'Feature Suggestion Form',
      'th': '',
    },
  },
  // AddRedeemablePage
  {
    'jo8ot8kk': {
      'en': 'Add Redeemables',
      'th': '',
    },
    'cvo6kyts': {
      'en': 'Home',
      'th': '',
    },
  },
  // RedeemablePage
  {
    '262rxlrb': {
      'en': '⭐️',
      'th': '',
    },
    'xvkufjac': {
      'en': 'Redeemables',
      'th': '',
    },
    'jsh76rdd': {
      'en': 'Home',
      'th': '',
    },
  },
  // EditRedeemablePage
  {
    'ax1ztnf5': {
      'en': 'Edit Redeemable',
      'th': '',
    },
    '33szum6m': {
      'en': 'Redeemable Name',
      'th': '',
    },
    'muei46ar': {
      'en': 'Points Cost ⭐️',
      'th': '',
    },
    'e6f71wl4': {
      'en': 'Redeemable Description',
      'th': '',
    },
    'y9cu50f1': {
      'en': 'Field is required',
      'th': '',
    },
    'ykezbt9z': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'rejtdop8': {
      'en': 'Field is required',
      'th': '',
    },
    '85vwxzbe': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'ziq0mz1f': {
      'en': 'Field is required',
      'th': '',
    },
    'xnrdvymv': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '88rgvo80': {
      'en': 'Save',
      'th': '',
    },
    '2b2rqx0b': {
      'en': 'Home',
      'th': '',
    },
  },
  // UpdateCompanyDetails
  {
    'nvfmfs7r': {
      'en': 'What\'s your business name?',
      'th': '',
    },
    'e50krel2': {
      'en':
          'Enter a name that people would recognize so your loyal customers can find you.',
      'th': '',
    },
    '17yqmd9v': {
      'en': 'Company Name',
      'th': '',
    },
    'rjh04as3': {
      'en': 'Short description',
      'th': '',
    },
    'y5k5mcv5': {
      'en': 'Instagram Link',
      'th': '',
    },
    '28t1wru4': {
      'en': 'Facebook Link',
      'th': '',
    },
    'xve7cld8': {
      'en': 'Website Link',
      'th': '',
    },
    't3yokh7a': {
      'en': 'Edit Store Location',
      'th': '',
    },
    'h7axtky0': {
      'en': 'Please enter your name to continue',
      'th': '',
    },
    't8c17g6c': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'j8r2nrw4': {
      'en': 'Upload your logo',
      'th': '',
    },
    'abz4ywq8': {
      'en': 'Upload Image',
      'th': '',
    },
    'qmddrd3i': {
      'en': 'Your profile!',
      'th': '',
    },
    'nee1yuv2': {
      'en': 'Company name',
      'th': '',
    },
    '6fof7pnh': {
      'en': 'Your Bio',
      'th': '',
    },
    'sc7jfn3h': {
      'en': 'Add some pictures to showcase! ',
      'th': '',
    },
    'uca34y3x': {
      'en': 'Upload Image',
      'th': '',
    },
    '3hgr1vbf': {
      'en': 'Add your menu to showcase! ',
      'th': '',
    },
    'v7jv5oco': {
      'en': 'Upload Image',
      'th': '',
    },
    'h938jici': {
      'en': 'Back',
      'th': '',
    },
    '6hlqrdh4': {
      'en': 'Home',
      'th': '',
    },
  },
  // UpdateUserDetails
  {
    'ebqd2suc': {
      'en': 'What\'s your name?',
      'th': '',
    },
    'mdh9zu2g': {
      'en':
          'Enter a name that people would recognize so your friends can find you.',
      'th': '',
    },
    'wx8cjngg': {
      'en': 'Your Name',
      'th': '',
    },
    '7p34o9be': {
      'en': 'Short description...',
      'th': '',
    },
    'bzqayy5n': {
      'en': 'Birth Date',
      'th': '',
    },
    'uambaql8': {
      'en': 'Please enter your name to continue',
      'th': '',
    },
    'q23b1m0o': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'dyzowfm3': {
      'en': 'Field is required',
      'th': '',
    },
    'kltp3x6n': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'sw1qed5n': {
      'en': 'Field is required',
      'th': '',
    },
    '296kpkjs': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'w0fbp50s': {
      'en': 'Upload your face',
      'th': '',
    },
    '0nvsds8q': {
      'en':
          'Enter a name that people would recognize so your friends can find you.',
      'th': '',
    },
    'rlom35ww': {
      'en': 'Upload Image',
      'th': '',
    },
    'pkloy2p9': {
      'en': 'Your profile!',
      'th': '',
    },
    'ysl5sqwd': {
      'en': 'Your name',
      'th': '',
    },
    'kknmxbs8': {
      'en': 'Your Bio',
      'th': '',
    },
    '3a2xbq75': {
      'en': 'Back',
      'th': '',
    },
    'jptievb3': {
      'en': 'Home',
      'th': '',
    },
  },
  // TransactionDetailsPage
  {
    'f44hjvbt': {
      'en': 'Transaction Details',
      'th': '',
    },
    'jn1oxaq2': {
      'en': 'Home',
      'th': '',
    },
  },
  // TransactionListPage
  {
    'kyhmkk4o': {
      'en': 'Search Transaction ID',
      'th': '',
    },
    'mo4gsc42': {
      'en': 'Redeem Pending',
      'th': '',
    },
    'jz137ath': {
      'en': 'Redeem Confirmed',
      'th': '',
    },
    '00yxeamt': {
      'en': 'Points Added',
      'th': '',
    },
    '8cu5g5ai': {
      'en': 'Remove Points',
      'th': '',
    },
    'vqdh1tay': {
      'en': 'Orders',
      'th': '',
    },
    'fb51s7ot': {
      'en': 'See All',
      'th': '',
    },
    'wsk7ibhx': {
      'en': 'See All',
      'th': '',
    },
    '73t7u9gg': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'th': '',
    },
    'f4z2x1f4': {
      'en': 'Orders:',
      'th': '',
    },
    '2eqywhl8': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'th': '',
    },
    'xojqd63g': {
      'en': 'x ',
      'th': '',
    },
    '4l8bbvug': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'th': '',
    },
    'z5f543fy': {
      'en': '⭐️',
      'th': '',
    },
    'e61yem1n': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'th': '',
    },
    '3r44c02c': {
      'en': 'Transactions',
      'th': '',
    },
    'mh0j0ltf': {
      'en': 'Home',
      'th': '',
    },
  },
  // UnsplashSearch
  {
    'f8vz22dx': {
      'en': 'Unsplash',
      'th': '',
    },
    'id07bfg6': {
      'en': 'Home',
      'th': '',
    },
  },
  // paywall
  {
    'bw32cxb3': {
      'en': 'Home',
      'th': '',
    },
  },
  // UserTransactionHistory
  {
    'jtdsr3uf': {
      'en': 'Below are your most recent transactions',
      'th': '',
    },
    'binnobcl': {
      'en': '⭐️',
      'th': '',
    },
    'ndjusfm7': {
      'en': '\$1.50',
      'th': '',
    },
    'r3sqbugp': {
      'en': 'Transaction History',
      'th': '',
    },
    'hzzm17ci': {
      'en': 'Home',
      'th': '',
    },
  },
  // ManageSubscription
  {
    'czc885x9': {
      'en': 'You are currently subscribed to Hi Perks Business ✅',
      'th': '',
    },
    'eyi84vzy': {
      'en': '⭐️',
      'th': '',
    },
    'qxy0zdpr': {
      'en': 'Loyalty Program Management',
      'th': '',
    },
    'murkhrwx': {
      'en':
          '\nEasily create and customise redeemable tailored to your business\'s needs.',
      'th': '',
    },
    'spfwhoe5': {
      'en': '💳',
      'th': '',
    },
    'pbnycuuz': {
      'en': 'Custom Loyalty Cards',
      'th': '',
    },
    'vy7317m7': {
      'en':
          '\nElevate your loyalty program by personalizing cards with colors and images',
      'th': '',
    },
    '1xa3naky': {
      'en': '🌟',
      'th': '',
    },
    'q2gma2kj': {
      'en': 'Unlimited Points!',
      'th': '',
    },
    'of9pv3pg': {
      'en': '\nReward your customers infinitely!',
      'th': '',
    },
    'ypxogtyg': {
      'en': '🎁',
      'th': '',
    },
    'pkhysenx': {
      'en': 'Unlimited Redeemables!',
      'th': '',
    },
    'jct2txw0': {
      'en': '\nMake redeemables for your customer!',
      'th': '',
    },
    'gvh4w3te': {
      'en': '🏞️',
      'th': '',
    },
    'v2s5uazc': {
      'en': 'Store Discovery',
      'th': '',
    },
    'nvikp3n6': {
      'en':
          '\nLet people discover your store and be featured in our store discovery page!',
      'th': '',
    },
    'u63fbw27': {
      'en': '🏬',
      'th': '',
    },
    'eefoogl8': {
      'en': 'Add Branches',
      'th': '',
    },
    '6vnk9q2n': {
      'en': '\nExpand your reach by adding branches to your account.',
      'th': '',
    },
    'hdrh4ozd': {
      'en': 'Subscriptions',
      'th': '',
    },
    'fsht0w2r': {
      'en': 'Home',
      'th': '',
    },
  },
  // CustomizedCard
  {
    '6p1vga7p': {
      'en': 'Design your membership card',
      'th': '',
    },
    '7qfddguq': {
      'en':
          'Customize your membership card with your desired text color and card background image.',
      'th': '',
    },
    '97mh8gm5': {
      'en': 'Pick Text Color',
      'th': '',
    },
    'gmrlrwmr': {
      'en': 'Upload Image',
      'th': '',
    },
    '4h0tciva': {
      'en': 'Unsplash Search',
      'th': '',
    },
    '2z4ass7x': {
      'en': 'Personalized your card background image',
      'th': '',
    },
    'ot92nlk9': {
      'en': 'Save Card Design',
      'th': '',
    },
    '7b8dapht': {
      'en': 'Customized Card',
      'th': '',
    },
    'sdmywf1r': {
      'en': 'Home',
      'th': '',
    },
  },
  // AddMemberPage
  {
    'm4nto0cc': {
      'en': 'Customer Name',
      'th': '',
    },
    'k06n7s3n': {
      'en': 'Customer Email',
      'th': '',
    },
    '6574tuih': {
      'en': 'Customer Phone Number',
      'th': '',
    },
    'f5t565a1': {
      'en': 'Welcome Points ⭐️',
      'th': '',
    },
    'ybgzy3q9': {
      'en': 'Field is required',
      'th': '',
    },
    'n5kvo7nu': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '5lzxooow': {
      'en': 'Field is required',
      'th': '',
    },
    'bcl9qn8x': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '1xgzz1pz': {
      'en': 'Field is required',
      'th': '',
    },
    'm0hrwdlr': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'se8nhotv': {
      'en': 'Field is required',
      'th': '',
    },
    'bvha03ej': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'lnjsqjt3': {
      'en': 'Add Member',
      'th': '',
    },
    'nlv64a3i': {
      'en': 'Add Member',
      'th': '',
    },
    'jxb41p6j': {
      'en': 'Home',
      'th': '',
    },
  },
  // MemberDetails
  {
    'ax0oxgsg': {
      'en': 'All-Time Points: ',
      'th': '',
    },
    'f5474k39': {
      'en': 'Latest Transactions',
      'th': '',
    },
    'fwfs7h0t': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'th': '',
    },
    'bsm4i489': {
      'en': 'Orders:',
      'th': '',
    },
    '3snevk61': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'th': '',
    },
    'wt61l3jq': {
      'en': 'x ',
      'th': '',
    },
    '13mnhlqb': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'th': '',
    },
    'n799xddw': {
      'en': '⭐️',
      'th': '',
    },
    'd9yuzv1w': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'th': '',
    },
    'bqz5kuea': {
      'en': 'Member Details',
      'th': '',
    },
    'br0n69eh': {
      'en': 'Home',
      'th': '',
    },
  },
  // MemberDetailsManuallyAdded
  {
    'qjbnk5wp': {
      'en': 'All Time Points: ',
      'th': '',
    },
    '3jmcehyw': {
      'en': 'Latest Transactions',
      'th': '',
    },
    'hb5xykdh': {
      'en': 'Member Details',
      'th': '',
    },
    'p5j3stwi': {
      'en': 'Home',
      'th': '',
    },
  },
  // StoreSettings
  {
    'bznq4ci5': {
      'en': 'Store Settings',
      'th': '',
    },
    '23i8jcle': {
      'en': 'Store Catalog',
      'th': '',
    },
    'cnjey33x': {
      'en': 'Edit Store Catalog',
      'th': '',
    },
    'xnos3r1q': {
      'en': 'Points Settings',
      'th': '',
    },
    'gje6v5t2': {
      'en': 'Please select expiry',
      'th': '',
    },
    'eptuc1t1': {
      'en': 'Search for an item...',
      'th': '',
    },
    '0pj850b8': {
      'en': '1  Month',
      'th': '',
    },
    'orkjh08d': {
      'en': '3 Months',
      'th': '',
    },
    '5liomvzj': {
      'en': '6 Months',
      'th': '',
    },
    'a7t0wsuy': {
      'en': '1 Year',
      'th': '',
    },
    'vt8pkq74': {
      'en': '2 Years',
      'th': '',
    },
    'gv4u38f1': {
      'en': '3 Years',
      'th': '',
    },
    '1f4a9nps': {
      'en': 'No Expiry',
      'th': '',
    },
    'xo87qya2': {
      'en': 'Please authenticate to continue',
      'th': '',
    },
    'epkx33z9': {
      'en': 'Branch Settings',
      'th': '',
    },
    'zg4vhuyb': {
      'en': 'Select Branch',
      'th': '',
    },
    'us0pt4ku': {
      'en': 'Search for an item...',
      'th': '',
    },
    '6j99zwav': {
      'en': 'Option 1',
      'th': '',
    },
    'p1npy1n7': {
      'en':
          'Adding branches helps you organize transactions and track sales flow for each location.',
      'th': '',
    },
    'zwi59e6a': {
      'en': 'Add Branch',
      'th': '',
    },
    'nnvy5rrh': {
      'en': 'See All Branch Transaction',
      'th': '',
    },
    'fsktmffs': {
      'en': 'Setup Team Members',
      'th': '',
    },
    'z1d9qmp5': {
      'en': 'Team Members',
      'th': '',
    },
    'ozhr2l1t': {
      'en': 'Home',
      'th': '',
    },
  },
  // RedeemDetailPage
  {
    'yissgynk': {
      'en': 'Redeem Details',
      'th': '',
    },
    'e1kotec0': {
      'en': 'Home',
      'th': '',
    },
  },
  // CustomerRedeemListPage
  {
    '80efoa2v': {
      'en': 'Redeems',
      'th': '',
    },
    'e80fww8p': {
      'en': 'Pending Redeems',
      'th': '',
    },
    'k29su3sa': {
      'en': 'Completed Redeems',
      'th': '',
    },
    'gzuava86': {
      'en': 'Home',
      'th': '',
    },
  },
  // PushNotificationForm
  {
    '1htms3s8': {
      'en': 'Push Notification Marketing',
      'th': '',
    },
    'jjgl7llg': {
      'en': 'Define your notification',
      'th': '',
    },
    'b9g8amd7': {
      'en':
          'Here you can let your customers what is new from your store! Either new promos, freebies and more!',
      'th': '',
    },
    '4d21uy2r': {
      'en': 'Notification Preview:',
      'th': '',
    },
    'ne4m5roh': {
      'en': 'Now',
      'th': '',
    },
    '159grqqn': {
      'en': 'Notification Title',
      'th': '',
    },
    '5tizsyd1': {
      'en': 'Notification Description',
      'th': '',
    },
    'jco0ct9l': {
      'en':
          'Only your members will receive this notification.\nYou can only send one notification a day and 4 times per week.',
      'th': '',
    },
    'ciupc6gf': {
      'en': 'Home',
      'th': '',
    },
  },
  // SplashScreen
  {
    'k8o9q2ky': {
      'en': 'Home',
      'th': '',
    },
  },
  // TeamMemberSelection
  {
    'lfobsqzd': {
      'en': 'Who is using?',
      'th': '',
    },
    'n676hzhe': {
      'en': 'Home',
      'th': '',
    },
  },
  // StoreCatalogPage
  {
    'c2d6jdz6': {
      'en': 'Store Catalog',
      'th': '',
    },
    'djmj474l': {
      'en': 'Menu Image',
      'th': '',
    },
    'g5izs9r2': {
      'en': 'Catalog Items',
      'th': '',
    },
    'h8cy1sy4': {
      'en': 'Category: ',
      'th': '',
    },
    '29e5a3ry': {
      'en': 'Variations: ',
      'th': '',
    },
    'aahsmpbx': {
      'en': 'Earn: ⭐️',
      'th': '',
    },
    'g1c5zsnv': {
      'en': 'Price: ',
      'th': '',
    },
    'fxb9602h': {
      'en': 'Home',
      'th': '',
    },
  },
  // MainSettings
  {
    'htwqnwbe': {
      'en': 'Update \nProfile',
      'th': '',
    },
    '7debpix5': {
      'en': 'Design \nStore Card',
      'th': '',
    },
    '929k04yr': {
      'en': 'Store \nCatalog',
      'th': '',
    },
    'aq5skfuk': {
      'en': 'Redeemables',
      'th': '',
    },
    '32zhpypj': {
      'en': 'Branch \nSettings',
      'th': '',
    },
    'vhqy0o8z': {
      'en': 'Points \nSettings',
      'th': '',
    },
    'ypupwquy': {
      'en': 'Team \nMembers',
      'th': '',
    },
    'bfwlxyt4': {
      'en': 'Manage \nSubscription',
      'th': '',
    },
    'm88uhu2x': {
      'en': 'Feature\nRequest',
      'th': '',
    },
    '7dk362ec': {
      'en': 'Delete\nAccount',
      'th': '',
    },
    'cqq7f45c': {
      'en': 'Please authenticate to proceed.',
      'th': '',
    },
    '00cwmwvc': {
      'en': 'Settings',
      'th': '',
    },
    '1o6fj3p9': {
      'en': 'Home',
      'th': '',
    },
  },
  // BranchSettings
  {
    'ukoh0gyq': {
      'en': 'Branch Settings',
      'th': '',
    },
    'kw1re9t3': {
      'en': 'Branch Settings',
      'th': '',
    },
    'b2suhne4': {
      'en': 'Select Branch',
      'th': '',
    },
    'llhfiayx': {
      'en': 'Search for an item...',
      'th': '',
    },
    'neyxrk2i': {
      'en': 'Option 1',
      'th': '',
    },
    'rmsu3crv': {
      'en': 'Please authenticate to proceed deletion of branch',
      'th': '',
    },
    'jf2cp2ai': {
      'en':
          'Adding branches helps you organize transactions and track sales flow for each location.',
      'th': '',
    },
    'mwqiig73': {
      'en': 'Add Branch',
      'th': '',
    },
    'uxw96kwz': {
      'en': 'See All Branch Transaction',
      'th': '',
    },
    '0mgti0v3': {
      'en': 'Home',
      'th': '',
    },
  },
  // TeamMemberSettings
  {
    'ome6ogts': {
      'en': 'Team Member Settings',
      'th': '',
    },
    'twf645xq': {
      'en': 'Setup Team Members',
      'th': '',
    },
    'kzpaordz': {
      'en': 'Team Members',
      'th': '',
    },
    'n98jkggd': {
      'en': 'Home',
      'th': '',
    },
  },
  // ProductSelectionPage
  {
    '562rf2xp': {
      'en': 'Price: ',
      'th': '',
    },
    'lxkhdkr6': {
      'en': 'Points to earn: ',
      'th': '',
    },
    'vdhn7tj6': {
      'en': '⭐️',
      'th': '',
    },
    'nihk8fcc': {
      'en': 'Option 1',
      'th': '',
    },
    'n1uefr9v': {
      'en': 'Home',
      'th': '',
    },
  },
  // CheckoutOrder
  {
    'wfng12az': {
      'en': 'Back',
      'th': '',
    },
    'ykss6bsa': {
      'en': 'Cart',
      'th': '',
    },
    '05wvmhx2': {
      'en': 'Price: ',
      'th': '',
    },
    't2ttj10j': {
      'en': '\$125.50',
      'th': '',
    },
    'ctatnrsn': {
      'en': 'Points Earned: ',
      'th': '',
    },
    'gbdks35k': {
      'en': '\$125.50',
      'th': '',
    },
    'nfswxuq2': {
      'en': 'Quanity: ',
      'th': '',
    },
    't1f0m5d7': {
      'en': 'Quanity: 1',
      'th': '',
    },
    'of7erhje': {
      'en': 'Controller Basic',
      'th': '',
    },
    '83zoe1mu': {
      'en': '\$125.50',
      'th': '',
    },
    'p28qsbb1': {
      'en': 'Quanity: 1',
      'th': '',
    },
    'l10olq88': {
      'en': 'Price Breakdown',
      'th': '',
    },
    'vgxjy92h': {
      'en': 'Total',
      'th': '',
    },
    'vmonjvum': {
      'en': 'Points Earned',
      'th': '',
    },
    'mf00lshh': {
      'en': '⭐️',
      'th': '',
    },
    'i5e8507o': {
      'en': '\$125.50',
      'th': '',
    },
    '71eazson': {
      'en': 'Note to store',
      'th': '',
    },
    'i3uv53tk': {
      'en': 'Submit Order',
      'th': '',
    },
    '90xvprbv': {
      'en': 'Pre Order (\$137.75)',
      'th': '',
    },
    'coe8spmj': {
      'en': 'Home',
      'th': '',
    },
  },
  // CustomerOrdersListPage
  {
    'x3l63g5k': {
      'en': 'Orders',
      'th': '',
    },
    'co6svx77': {
      'en': 'Pending Orders',
      'th': '',
    },
    '910xuthc': {
      'en': 'Order #',
      'th': '',
    },
    '2x4ga5ek': {
      'en': 'Hello World',
      'th': '',
    },
    'o1enomm0': {
      'en': 'Completed Orders',
      'th': '',
    },
    'kgposcsk': {
      'en': 'Order #',
      'th': '',
    },
    'y3y5379j': {
      'en': 'Hello World',
      'th': '',
    },
    'fx6l3jc0': {
      'en': 'Home',
      'th': '',
    },
  },
  // NotificationsPage
  {
    '6umubwz6': {
      'en': 'Notifications',
      'th': '',
    },
    '9lcb7h32': {
      'en': 'Home',
      'th': '',
    },
  },
  // PointsSettings
  {
    'chnkv3f4': {
      'en': 'Points Settings',
      'th': '',
    },
    'f5x8siyl': {
      'en': 'Points Settings',
      'th': '',
    },
    'icfkvnhb': {
      'en': 'Please select expiry',
      'th': '',
    },
    'd806g3j9': {
      'en': 'Search for an item...',
      'th': '',
    },
    'gbv0zrq0': {
      'en': '1  Month',
      'th': '',
    },
    'dox6kei4': {
      'en': '3 Months',
      'th': '',
    },
    'i96vgjv6': {
      'en': '6 Months',
      'th': '',
    },
    'hluvcfib': {
      'en': '1 Year',
      'th': '',
    },
    'p6elefjp': {
      'en': '2 Years',
      'th': '',
    },
    'w7b4sul7': {
      'en': '3 Years',
      'th': '',
    },
    'c9srlmbx': {
      'en': 'No Expiry',
      'th': '',
    },
    'y7qnl2k0': {
      'en': 'Please authenticate to continue',
      'th': '',
    },
    't552ne99': {
      'en': 'Home',
      'th': '',
    },
  },
  // PrivacyPolicy
  {
    'b7f0odqa': {
      'en': 'Last Updated: October 5, 2024',
      'th': '',
    },
    'd72gnmnu': {
      'en': 'Your Privacy Matters',
      'th': '',
    },
    'qad6xt5e': {
      'en':
          'At Hi Perks, we value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, disclose, and safeguard your data when you use our app and services. By accessing Hi Perks, you agree to this Privacy Policy.',
      'th': '',
    },
    '56aqcjw7': {
      'en': 'Information We Collect',
      'th': '',
    },
    'upefw66x': {
      'en':
          '• Personal Information: Name, email address, and profile picture when you create an account.',
      'th': '',
    },
    '1hp5m193': {
      'en':
          '• Usage Data: Information on how you interact with our app, including features used and time spent.',
      'th': '',
    },
    'oz4eagw5': {
      'en':
          '• Device Information: Type of device, operating system, and unique device identifiers.',
      'th': '',
    },
    'ocsb5z2f': {
      'en': 'How We Use Your Information',
      'th': '',
    },
    'uuzs4wqb': {
      'en': '• To provide and maintain our services',
      'th': '',
    },
    'algvazlz': {
      'en': '• To improve and personalize your experience',
      'th': '',
    },
    'jgosciy4': {
      'en': '• To communicate with you about updates and offers',
      'th': '',
    },
    'h74dtqgl': {
      'en': '• To ensure the security and integrity of our platform',
      'th': '',
    },
    'a3zhlj2s': {
      'en': 'Data Security',
      'th': '',
    },
    'mad0anxs': {
      'en':
          'We implement industry-standard security measures to protect your personal information from unauthorized access, disclosure, alteration, and destruction. However, no method of transmission over the internet or electronic storage is completely secure, and we cannot guarantee absolute security.',
      'th': '',
    },
    'zqip57jl': {
      'en': 'Your Rights',
      'th': '',
    },
    'mk0xy6j1': {
      'en':
          'You have the right to access, correct, or delete your personal information. You may also opt out of certain data collection practices.',
      'th': '',
    },
    '1tfxh8xx': {
      'en': 'Changes to This Policy',
      'th': '',
    },
    'wgijr7mw': {
      'en':
          'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.',
      'th': '',
    },
    '3xrxgt1k': {
      'en':
          'By using our application, you agree to the terms outlined in this Privacy Policy. If you have any questions or concerns, please contact us at hiperks.contact@gmail.com',
      'th': '',
    },
    'rcqymfpq': {
      'en': 'Contact Us',
      'th': '',
    },
    'luea2qms': {
      'en': 'Privacy Policy',
      'th': '',
    },
  },
  // TermsOfUsePage
  {
    'h7e67dcy': {
      'en': 'Last Updated: October 5, 2024',
      'th': '',
    },
    'ja0wdbzh': {
      'en':
          'Welcome to our app. By using this application, you agree to these terms. Please read them carefully.',
      'th': '',
    },
    '63fhqno7': {
      'en': '1. Acceptance of Terms',
      'th': '',
    },
    'lwtgmd2w': {
      'en':
          'By accessing or using our app, you agree to be bound by these Terms of Use and all applicable laws and regulations. If you do not agree with any part of these terms, you may not use our app.',
      'th': '',
    },
    '8qx1h1fh': {
      'en': '2. Use License',
      'th': '',
    },
    'p56hpw8u': {
      'en':
          'Permission is granted to temporarily download one copy of the app for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title.',
      'th': '',
    },
    'z6xddlze': {
      'en': '3. Disclaimer',
      'th': '',
    },
    'd57gzoef': {
      'en':
          'The materials on our app are provided on an \'as is\' basis. We make no warranties, expressed or implied, and hereby disclaim and negate all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.',
      'th': '',
    },
    'by587oy4': {
      'en': '4. Limitations',
      'th': '',
    },
    '6qg378j0': {
      'en':
          'In no event shall we or our suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the materials on our app.',
      'th': '',
    },
    'flh725ij': {
      'en': '5. Revisions and Errata',
      'th': '',
    },
    'on2h2czl': {
      'en':
          'The materials appearing on our app could include technical, typographical, or photographic errors. We do not warrant that any of the materials on our app are accurate, complete or current.',
      'th': '',
    },
    'ayigvjit': {
      'en': '6. Links',
      'th': '',
    },
    'nsd29fqo': {
      'en':
          'We have not reviewed all of the sites linked to our app and are not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by us of the site. Use of any such linked website is at the user\'s own risk.',
      'th': '',
    },
    'bj5a6w8u': {
      'en': '7. Modifications',
      'th': '',
    },
    'vsivlpk3': {
      'en':
          'We may revise these terms of use for our app at any time without notice. By using this app you are agreeing to be bound by the then current version of these Terms of Use.',
      'th': '',
    },
    '82gvmr30': {
      'en': 'Terms of Use',
      'th': '',
    },
  },
  // WIkiPage
  {
    '0pkfntsx': {
      'en': 'How-To Instructions',
      'th': '',
    },
    '9hthwqvm': {
      'en': 'Adding Points With Loyalty Card',
      'th': '',
    },
    'xs0a3arl': {
      'en': 'Adding Redeemables',
      'th': '',
    },
    'ri1wvqdn': {
      'en': 'Managing Store Catalog',
      'th': '',
    },
    'vp6jdsqt': {
      'en': 'Sending Push Notification To Your Customers',
      'th': '',
    },
    '6cccvuq7': {
      'en': 'Adding Team Members',
      'th': '',
    },
    'xf3nmq0k': {
      'en': 'Updating Your Profile',
      'th': '',
    },
    '18qq4csb': {
      'en': 'Troubleshooting',
      'th': '',
    },
    'u5eeewgt': {
      'en': 'Contact Support',
      'th': '',
    },
    'zzrdgi86': {
      'en': 'Tips & Guides',
      'th': '',
    },
  },
  // PushNotificationInstructionPage
  {
    'top65wkp': {
      'en': 'Push Notification Marketing',
      'th': '',
    },
    '9ob45jhu': {
      'en': 'Go to side menu',
      'th': '',
    },
    'qzlo93n2': {
      'en': 'Go to side menu and press the push notification marketing button.',
      'th': '',
    },
    'e89nvhvf': {
      'en': 'Define Your Notification',
      'th': '',
    },
    '2jeedmvb': {
      'en':
          'Set your notification title and description. Share updates, promotions, freebies, or anything exciting you want your customers to know and send!',
      'th': '',
    },
    'n02oo5n0': {
      'en': 'Notification Received!',
      'th': '',
    },
    'utupsmap': {
      'en':
          'Once you send a notification, it is instantly delivered to your customers\' smartphones through the Hi Perks app. They will receive a push notification displaying the title and description you’ve set, alerting them to your latest update, promotion, or announcement. ',
      'th': '',
    },
  },
  // AddTeamMemberInstructionPage
  {
    'ulozs9j9': {
      'en': 'Adding Team Members',
      'th': '',
    },
    'dhs8ufco': {
      'en': 'Go to Store Settings',
      'th': '',
    },
    '9wjc0c0k': {
      'en':
          'Go to store settings that can be found on homepage or side menu and tap team members.',
      'th': '',
    },
    'apnxiogw': {
      'en': 'Tap \"+\" button to add team member',
      'th': '',
    },
    'r02ga8nk': {
      'en':
          'Here, you can view your current team members along with their names, pictures, and roles. To add a new member, simply tap the \"+\" button, and a pop-up will appear for entering their details.',
      'th': '',
    },
    'eliqfttu': {
      'en': 'Fill the details of your new team member',
      'th': '',
    },
    'ub4d6yj4': {
      'en':
          'Simply fill out the form with your team member\'s details, upload their picture, and select their designated role, assigned branch and their access password and tap add. That’s it—you’re all set!',
      'th': '',
    },
  },
  // EditProfileInstructionPage
  {
    '8z2v4kj7': {
      'en': 'Updating Profile Details',
      'th': '',
    },
    'zs39sexq': {
      'en': 'Go to Store Settings',
      'th': '',
    },
    'lykwu990': {
      'en':
          'Go to store settings that can be found on homepage or side menu and tap update profile.',
      'th': '',
    },
    'todpcb7k': {
      'en': 'Edit your profile details',
      'th': '',
    },
    'rv5734nd': {
      'en':
          'Here, you can update your profile details, including store name, description, social media links, and location.',
      'th': '',
    },
    '3poztnb6': {
      'en': 'Update Your Logo',
      'th': '',
    },
    'kfevbnhr': {
      'en': 'Here you can update your company logo by uploading an image.',
      'th': '',
    },
    'p4g9bf4h': {
      'en': 'Update Showcase Pictures',
      'th': '',
    },
    'nt2jr9y1': {
      'en':
          'You can also update your showcase pictures to feature your products, store ambiance, staff, and more!',
      'th': '',
    },
    '2mo36l71': {
      'en': 'Keep Your Menu Updated!',
      'th': '',
    },
    'q05awei1': {
      'en':
          'Here, you can update your menu image to keep your offerings fresh and up-to-date.',
      'th': '',
    },
  },
  // ContactUsPage
  {
    'otrfqx8t': {
      'en': 'We\'re here to help!',
      'th': '',
    },
    't98v5uxu': {
      'en':
          'Choose your preferred method of contact below. We\'ll get back to you as soon as possible.',
      'th': '',
    },
    'enhakwpl': {
      'en': 'Support Options',
      'th': '',
    },
    'qp9p7mrz': {
      'en': 'hiperks.contact@gmail.com',
      'th': '',
    },
    'zq8y8o2z': {
      'en': '@hi.perks',
      'th': '',
    },
    'z7doi80a': {
      'en': 'Connect with Us',
      'th': '',
    },
    'yagkcl2x': {
      'en': 'Follow us on social media for updates, tips, and more!',
      'th': '',
    },
    'x1ddiqb8': {
      'en': 'Contact Us',
      'th': '',
    },
  },
  // AddingPointsInstructionPage
  {
    'xm7xkisa': {
      'en': 'Adding Points With Loyalty Card',
      'th': '',
    },
    'j5hl9xaj': {
      'en': 'Ask Loyalty Card QR and Scan',
      'th': '',
    },
    'hpzow5zl': {
      'en':
          'Ask the member to show their loyalty card and scan it to access their details. Alternatively, you can search for them in the member list using their name, email, or mobile number.',
      'th': '',
    },
    '0fzd5jp4': {
      'en': 'Add Points',
      'th': '',
    },
    'gw9m9fx0': {
      'en':
          'Once the customer is selected, input the transaction details, such as the total points earned or item selected. \n\nYou can also add some transaction notes when adding points.',
      'th': '',
    },
    'r1dt6veq': {
      'en': 'Tap Add Points and Confirm!',
      'th': '',
    },
    'fr8fmgbk': {
      'en':
          'Once points are added, they will be instantly reflected on the customer\'s loyalty card, and a transaction record will be updated.',
      'th': '',
    },
    '1svkik6r': {
      'en': 'Add Points Complete ⭐️',
      'th': '',
    },
  },
  // AddRedeemableInstructionPage
  {
    'f4vapf80': {
      'en': 'Adding Redeemables',
      'th': '',
    },
    'gxsfgdvz': {
      'en': 'Go to Store Settings',
      'th': '',
    },
    'u8rm06s5': {
      'en':
          'Go to store settings that can be found on homepage or side menu and tap redeemables',
      'th': '',
    },
    'heo08s1b': {
      'en': 'Tap Add Redeemables',
      'th': '',
    },
    'il7jh2be': {
      'en':
          'View and manage your existing redeemables here, with options to add, edit, or delete them. \n\nTo create a new redeemable, simply tap the \'Add Redeemable\'.',
      'th': '',
    },
    'n9usojsp': {
      'en': 'Create Your Redeemable',
      'th': '',
    },
    'd8foacms': {
      'en':
          'Here, you can customize your redeemable by setting its image, name, points cost, and description. \n\nOnce you\'re done, simply tap \'Add Item\' to complete the process!',
      'th': '',
    },
    'kx9vwv5p': {
      'en': 'Added Successfully!',
      'th': '',
    },
    '360xn5dm': {
      'en': 'Manage Redeemables',
      'th': '',
    },
    'zjqhmqdr': {
      'en': 'Here, you can easily update or delete your redeemable.',
      'th': '',
    },
  },
  // ManagingStoreCatalogInstructionPage
  {
    'gmbogfux': {
      'en': 'Managing Store Catalog',
      'th': '',
    },
    'j6h9qy7x': {
      'en': 'Go to Store Settings',
      'th': '',
    },
    'suvnzf59': {
      'en':
          'Go to store settings that can be found on homepage or side menu and tap store catalog.',
      'th': '',
    },
    'b9ffl9ry': {
      'en': 'Menu Image',
      'th': '',
    },
    'ynwt0m61': {
      'en':
          'Here, you have the option to upload an image of your menu to give customers a clear and visually appealing overview of your offerings. Whether it\'s showcasing your most popular dishes, drinks, or services, adding an image helps customers easily identify what’s available and makes their ordering experience more engaging.',
      'th': '',
    },
    '2kdowwb1': {
      'en': 'Add Catalog Items for pre-ordering',
      'th': '',
    },
    'c897ep7n': {
      'en':
          'Here, you can add each of your products and offerings to create a comprehensive catalog. This feature enables seamless pre-ordering, allowing customers to view product prices and see how many loyalty points they can earn. Once the order is confirmed, the points are automatically credited to the customer’s account, simplifying the process and enhancing customer satisfaction!\"',
      'th': '',
    },
  },
  // ReviewFeedbackPage
  {
    'lyjpjn0k': {
      'en': 'Feedbacks',
      'th': '',
    },
    '0ygrog14': {
      'en': 'Store Rating ',
      'th': '',
    },
    '2107wbzd': {
      'en': 'Feedbacks',
      'th': '',
    },
    '287sej42': {
      'en': 'Home',
      'th': '',
    },
  },
  // StoreQRPreview
  {
    '9k3dutkr': {
      'en': 'Home',
      'th': '',
    },
  },
  // StoreGoogleReviewPage
  {
    '7rsiaiem': {
      'en': 'Display Google Reviews on the Store Page',
      'th': '',
    },
    'otj9zyki': {
      'en': 'Search Your Store\n',
      'th': '',
    },
    '2tq04s5p': {
      'en': 'Remove',
      'th': '',
    },
    '515kuihz': {
      'en': 'Store Google Review',
      'th': '',
    },
    'qp6smzn3': {
      'en': 'Home',
      'th': '',
    },
  },
  // StorePageCustomisation
  {
    'rsingm3z': {
      'en': 'Store Page Customization',
      'th': '',
    },
    '09jq7q47': {
      'en': 'Color Settings',
      'th': '',
    },
    '27f8z8dd': {
      'en': 'Background Color',
      'th': '',
    },
    'c2de375z': {
      'en': 'Text Color',
      'th': '',
    },
    'b4cezpv3': {
      'en': 'Secondary Text Color',
      'th': '',
    },
    'x7f0l41e': {
      'en': 'Find some inspirations color palette here!',
      'th': '',
    },
    '53n2kgdy': {
      'en': 'coolors.co',
      'th': '',
    },
    'md9ithqw': {
      'en': 'color.adobe.com',
      'th': '',
    },
    'j08jtnvm': {
      'en': 'Update Store Logo',
      'th': '',
    },
    'p230fiy1': {
      'en': 'Uploading logo will immediately replace your current logo',
      'th': '',
    },
    'ags241q9': {
      'en': 'Upload Logo',
      'th': '',
    },
    'vokzyi4z': {
      'en': 'Store Preview',
      'th': '',
    },
    't4n13hcr': {
      'en': 'Hide Store Name',
      'th': '',
    },
    'dnibaxab': {
      'en':
          'This is perfect for displaying your logo. Perfect for no background logo.',
      'th': '',
    },
    'zc3wrfx3': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      'th': '',
    },
    'zroz0yu7': {
      'en': 'Philippines',
      'th': '',
    },
    'u37yypu8': {
      'en': '200',
      'th': '',
    },
    '4xxb5qp8': {
      'en': ' Members',
      'th': '',
    },
    'e2m2buf8': {
      'en':
          'Non so se la bellezza salverà il mondo ma sicuramente aiuta. Sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'th': '',
    },
    'udmoqrfj': {
      'en': '4.0',
      'th': '',
    },
    'uwehjh4e': {
      'en': 'Google Review',
      'th': '',
    },
    'ucuy8yf1': {
      'en': 'Apply Changes',
      'th': '',
    },
  },
  // leaderboardPage
  {
    's14nxdb6': {
      'en':
          'Your leaderboard is also visible on your store page for customers to see.',
      'th': '',
    },
    '71rnumee': {
      'en': 'Leaderboard',
      'th': '',
    },
    'gczx8mdz': {
      'en': 'Home',
      'th': '',
    },
  },
  // Chat
  {
    'kl7vrza0': {
      'en': 'Ask anything',
      'th': '',
    },
    'ef9veufk': {
      'en': 'Home',
      'th': '',
    },
  },
  // Messages
  {
    'h6dte130': {
      'en': 'Messages',
      'th': '',
    },
    'gwoohtfo': {
      'en': '__',
      'th': '',
    },
  },
  // MarketingMaterials
  {
    's83849bc': {
      'en': 'Marketing Materials',
      'th': '',
    },
    '4eykvogr': {
      'en': 'Home',
      'th': '',
    },
  },
  // CreateVoucherPage
  {
    'ndqjhoqz': {
      'en': 'Create Voucher',
      'th': '',
    },
    'sbv3fnkv': {
      'en': 'Voucher Details',
      'th': '',
    },
    'oo41zqs1': {
      'en': 'Title',
      'th': '',
    },
    'zvqvj474': {
      'en': 'Voucher Title',
      'th': '',
    },
    'mghwhe9i': {
      'en': 'Description',
      'th': '',
    },
    'au3zvqqg': {
      'en': 'Describe what this voucher offers',
      'th': '',
    },
    'tpq1sgxw': {
      'en': 'Discount Settings',
      'th': '',
    },
    '3a1otynl': {
      'en': 'Type',
      'th': '',
    },
    'jz1u3wzk': {
      'en': 'Percentage',
      'th': '',
    },
    '2iwfkbtg': {
      'en': 'Fixed Amount',
      'th': '',
    },
    '4ujsen9i': {
      'en': 'Discount Value',
      'th': '',
    },
    'sc1bjdbu': {
      'en': 'Enter amount',
      'th': '',
    },
    '5l5jjt0j': {
      'en': 'Usage Limits',
      'th': '',
    },
    'x9noojln': {
      'en': 'Total Voucher Stock',
      'th': '',
    },
    '8zognavz': {
      'en': 'Total Voucher Stock',
      'th': '',
    },
    'kcmkezas': {
      'en': 'Validity Period',
      'th': '',
    },
    'dsapc194': {
      'en': 'Secret Voucher',
      'th': '',
    },
    'emuxb0dv': {
      'en':
          'This voucher is not visible to customers by default. Only the store can assign it directly to selected users.',
      'th': '',
    },
    'piqsqahx': {
      'en': 'Title is required',
      'th': '',
    },
    'mkfa4osl': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'l1qo4y2b': {
      'en': 'Description is required',
      'th': '',
    },
    'jeziik3r': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'cwjoe0fq': {
      'en': 'Discount Value is required',
      'th': '',
    },
    'qv5ra9bq': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'edcc51da': {
      'en': 'Total Voucher Stock is required',
      'th': '',
    },
    'l3edjfdq': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'gad2vlaa': {
      'en': 'Create Voucher',
      'th': '',
    },
  },
  // StoreVoucherPage
  {
    'w49wf8d7': {
      'en': 'Search vouchers...',
      'th': '',
    },
    'k2tu5ak5': {
      'en': 'Vouchers',
      'th': '',
    },
  },
  // VoucherConfirmation
  {
    '7g1ur5b7': {
      'en': 'Voucher Confirmation',
      'th': '',
    },
    'tlte78co': {
      'en': 'Voucher Details',
      'th': '',
    },
    'l4kr8hzn': {
      'en': 'Voucher Code:',
      'th': '',
    },
    '1zurx24g': {
      'en': 'Customer Name:',
      'th': '',
    },
    'fdquhf1u': {
      'en': 'Voucher Type:',
      'th': '',
    },
    'u39e3got': {
      'en': 'Discount Amount:',
      'th': '',
    },
    '9i7cfbpt': {
      'en': 'Valid Until:',
      'th': '',
    },
    'uliopn75': {
      'en': 'Status:',
      'th': '',
    },
  },
  // StoreVoucherDetails
  {
    'gztkvr4j': {
      'en': 'Voucher Details',
      'th': '',
    },
    'txs3sljk': {
      'en': 'Active Vouchers',
      'th': '',
    },
    'u9te2c7c': {
      'en': 'Remaining',
      'th': '',
    },
    'xshj1c0z': {
      'en': 'Total Limit',
      'th': '',
    },
    'w5tb45gz': {
      'en': 'Current Vouchers',
      'th': '',
    },
    '20tijdwd': {
      'en': 'Michael Chen',
      'th': '',
    },
    '4xykwajy': {
      'en': 'm.chen@email.com',
      'th': '',
    },
    'z7x7geso': {
      'en': 'Redeemed 5 hours ago',
      'th': '',
    },
    'cuy72ok6': {
      'en': 'Saved \$18.50',
      'th': '',
    },
    'xpv3hmgs': {
      'en': 'Order #1246',
      'th': '',
    },
    '5r8yxtxs': {
      'en': 'Emma Rodriguez',
      'th': '',
    },
    'mfgechx5': {
      'en': 'emma.r@email.com',
      'th': '',
    },
    'cgdop3y1': {
      'en': 'Redeemed 1 day ago',
      'th': '',
    },
    'ihpvmthv': {
      'en': 'Saved \$31.20',
      'th': '',
    },
    'wjgwkii8': {
      'en': 'Order #1245',
      'th': '',
    },
    'ab0m7u5l': {
      'en': 'David Thompson',
      'th': '',
    },
    'fbvzzu6x': {
      'en': 'd.thompson@email.com',
      'th': '',
    },
    'pv9higeh': {
      'en': 'Redeemed 1 day ago',
      'th': '',
    },
    'a3dafpor': {
      'en': 'Saved \$15.75',
      'th': '',
    },
    '4sd01fnw': {
      'en': 'Order #1244',
      'th': '',
    },
    'gzadfeu5': {
      'en': 'Lisa Wang',
      'th': '',
    },
    '9gy4uy86': {
      'en': 'lisa.wang@email.com',
      'th': '',
    },
    'lerqd5hq': {
      'en': 'Redeemed 2 days ago',
      'th': '',
    },
    'kkdceixb': {
      'en': 'Saved \$42.30',
      'th': '',
    },
    'm95qaxt5': {
      'en': 'Order #1243',
      'th': '',
    },
  },
  // UpdateVoucherPage
  {
    'u7n0k3cq': {
      'en': 'Update Voucher',
      'th': '',
    },
    'kmn9yrx7': {
      'en': 'Voucher Details',
      'th': '',
    },
    '86l18dna': {
      'en': 'Title',
      'th': '',
    },
    'uj69fffl': {
      'en': 'Voucher Title',
      'th': '',
    },
    'q14nqsh7': {
      'en': 'Description',
      'th': '',
    },
    'oozmu9qa': {
      'en': 'Describe what this voucher offers',
      'th': '',
    },
    '9iencoh0': {
      'en': 'Discount Settings',
      'th': '',
    },
    '7r3et161': {
      'en': 'Type',
      'th': '',
    },
    '8gweuy1u': {
      'en': 'Percentage',
      'th': '',
    },
    '57fruob2': {
      'en': 'Fixed Amount',
      'th': '',
    },
    '34nm0jns': {
      'en': 'Discount Value',
      'th': '',
    },
    'ocvtxt9v': {
      'en': 'Enter amount',
      'th': '',
    },
    'gpji0saa': {
      'en': 'Usage Limits',
      'th': '',
    },
    'yw0kw7c4': {
      'en': 'Total Voucher Stock',
      'th': '',
    },
    'uk4r74m7': {
      'en': 'Total Voucher Stock',
      'th': '',
    },
    'ju8opb2r': {
      'en': 'Validity Period',
      'th': '',
    },
    'r0kbxrip': {
      'en': 'Title is required',
      'th': '',
    },
    'e66r8z79': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'xk6eyofs': {
      'en': 'Description is required',
      'th': '',
    },
    'evpzbgk6': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'wod5tomp': {
      'en': 'Discount Value is required',
      'th': '',
    },
    '1iieyx95': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'znfny90f': {
      'en': 'Total Voucher Stock is required',
      'th': '',
    },
    'st7vz5k9': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'z3lsdgq9': {
      'en': 'Update Voucher',
      'th': '',
    },
  },
  // AddMemberToVoucherPage
  {
    'qvlkcmew': {
      'en': 'Add Members to Voucher',
      'th': '',
    },
    'pf4vlzxi': {
      'en': 'Search members...',
      'th': '',
    },
    'spxtiq43': {
      'en': 'Cancel',
      'th': '',
    },
    'b9awf2ap': {
      'en': 'Store Members',
      'th': '',
    },
    '79ea1422': {
      'en': 'Add Selected Members',
      'th': '',
    },
  },
  // BusinessMetricsPage
  {
    'ci4gnm3l': {
      'en': 'Business Metrics',
      'th': '',
    },
    '3iz8k9et': {
      'en': 'New Members Today',
      'th': '',
    },
    'dwvjambx': {
      'en': 'Total Points Given Today',
      'th': '',
    },
    'lftg6qyl': {
      'en': 'Lifetime Total Points Given',
      'th': '',
    },
    'gxej1m33': {
      'en': 'Daily Signups',
      'th': '',
    },
    'rrcoa8fq': {
      'en': 'Last 7 days',
      'th': '',
    },
  },
  // QrScanner
  {
    '03vh4cnd': {
      'en': 'Scan the card QR Code.',
      'th': '',
    },
  },
  // CardDetailAndAddPoints
  {
    'xgmonin9': {
      'en': 'Select Customer Order',
      'th': '',
    },
    'xdepblet': {
      'en': 'Quick Points',
      'th': '',
    },
    '2qtw26uf': {
      'en': 'Total Points',
      'th': '',
    },
    'vwdo1exg': {
      'en': 'Add Points',
      'th': '',
    },
    '7d9zdc2c': {
      'en': 'Transaction Notes',
      'th': '',
    },
  },
  // AddRedeemableWidget
  {
    'dxyxl6y1': {
      'en': 'Redeemable Name',
      'th': '',
    },
    '464i5hga': {
      'en': 'Points Cost ⭐️',
      'th': '',
    },
    'jqz7r8mc': {
      'en': 'Redeemable Description',
      'th': '',
    },
    'jdlbu2g2': {
      'en': 'Field is required',
      'th': '',
    },
    'nuz18zh5': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'xfola2jm': {
      'en': 'Field is required',
      'th': '',
    },
    'n9oymb5k': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '785z6dqr': {
      'en': 'Field is required',
      'th': '',
    },
    'aizc7icj': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'd408eb94': {
      'en': 'Add Item',
      'th': '',
    },
  },
  // RedeemSuccess
  {
    '210xoji0': {
      'en': 'Redeem Success!',
      'th': '',
    },
    'pmgj3yhh': {
      'en': '-',
      'th': '',
    },
    '93rfax15': {
      'en': '⭐️',
      'th': '',
    },
  },
  // BusinessRedeemableDetails
  {
    '7ae066xv': {
      'en': '⭐️',
      'th': '',
    },
    '3s0bqh4b': {
      'en': 'Edit',
      'th': '',
    },
  },
  // RedeemFail
  {
    'smwg6rwy': {
      'en': 'Redeem Failed!',
      'th': '',
    },
    'potmrdu5': {
      'en': 'Not Enough Points.',
      'th': '',
    },
  },
  // TransactionDetails
  {
    '8ivnfvhg': {
      'en': 'Transaction ID: ',
      'th': '',
    },
    'wgtv5q7n': {
      'en': 'Redeemed: ',
      'th': '',
    },
    'fw8k5d3s': {
      'en': 'Team Member: ',
      'th': '',
    },
    '3zlr2ayh': {
      'en': 'Role: ',
      'th': '',
    },
    'gmhwi5xv': {
      'en': 'Branch: ',
      'th': '',
    },
    'codhj6kx': {
      'en': 'Date: ',
      'th': '',
    },
    '65d823b9': {
      'en': 'Confirmation Date: ',
      'th': '',
    },
    '86mcpnx4': {
      'en': 'Orders: ',
      'th': '',
    },
    'haa0ax39': {
      'en': 'x ',
      'th': '',
    },
    'uljqxv1j': {
      'en': ' (',
      'th': '',
    },
    'giz4ez1x': {
      'en': ')',
      'th': '',
    },
    'q77ypbe7': {
      'en': 'Notes: ',
      'th': '',
    },
  },
  // emptyHomeComponent
  {
    'ohqdqnaz': {
      'en': 'No Membership',
      'th': '',
    },
    'wm12isp0': {
      'en': 'It seems that you don\'t have any membership yet.',
      'th': '',
    },
    'p27brk9z': {
      'en': 'Discover Stores',
      'th': '',
    },
  },
  // emptyStoreDiscoveryComponent
  {
    'h4c4td20': {
      'en': 'No Stores Yet',
      'th': '',
    },
  },
  // CustomLoyaltyCard
  {
    'muqoerjs': {
      'en': '⭐️',
      'th': '',
    },
    'alh19uxw': {
      'en': 'Member Since:',
      'th': '',
    },
    'x4ijnzz7': {
      'en': 'Points Expiry:',
      'th': '',
    },
    'awa5474x': {
      'en': 'Redeem',
      'th': '',
    },
  },
  // CustomLoyaltyCardEditableTemplate
  {
    '2vz70xeh': {
      'en': 'Current Points',
      'th': '',
    },
    'gv7xqr1a': {
      'en': '⭐️',
      'th': '',
    },
    'j4a7m981': {
      'en': '123',
      'th': '',
    },
    '0yfxfws1': {
      'en': '1234-1234-1234-1234',
      'th': '',
    },
    'myyzq50w': {
      'en': 'Redeem',
      'th': '',
    },
    '25qfilum': {
      'en': '1234-1234-1234-1234',
      'th': '',
    },
  },
  // UnsplashOrUploadImage
  {
    'h2082xe5': {
      'en': 'Pick From Unsplash',
      'th': '',
    },
    'vxqdpl65': {
      'en': 'Upload Image',
      'th': '',
    },
    'rmdj385l': {
      'en': 'Cancel',
      'th': '',
    },
  },
  // UnsplashSearchComponent
  {
    'uml94kj7': {
      'en': 'Search Image',
      'th': '',
    },
  },
  // emptyTransactionComponent
  {
    'u35eqqo6': {
      'en': 'No Transaction Yet',
      'th': '',
    },
  },
  // CustomLoyaltyCardPreview
  {
    'lm8sulyu': {
      'en': '⭐️',
      'th': '',
    },
  },
  // emptyStoreMembersComponent
  {
    'befpqb2f': {
      'en': 'No Members Yet',
      'th': '',
    },
  },
  // emptyStoreRedeemablesComponent
  {
    'hginmyrm': {
      'en': 'No Redeemables Yet',
      'th': '',
    },
  },
  // emptyStoreGallerysComponent
  {
    '5alnc0mp': {
      'en': 'No Images Yet',
      'th': '',
    },
  },
  // transactionItem
  {
    'f77zyxoc': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'th': '',
    },
    'x1nrf8by': {
      'en': '⭐️',
      'th': '',
    },
    'm7fnoxd6': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'th': '',
    },
  },
  // RedeemConfirmation
  {
    'f18hhtd0': {
      'en': 'Cancel',
      'th': '',
    },
    '5vmhfli0': {
      'en': 'Redeem',
      'th': '',
    },
  },
  // CardDetailAndAddPointsCopy
  {
    'ckdde7g8': {
      'en': 'Select Customer Order',
      'th': '',
    },
    '3zwoxs8q': {
      'en': 'Quick Points',
      'th': '',
    },
    'vlhznim7': {
      'en': 'Points',
      'th': '',
    },
    '1olqhapg': {
      'en': 'Add Points',
      'th': '',
    },
    'k4ue5tp6': {
      'en': 'Transaction Notes',
      'th': '',
    },
  },
  // CustomLoyaltyCardPreviewCopy
  {
    'ncwflhts': {
      'en': '⭐️',
      'th': '',
    },
  },
  // paywallComponent
  {
    'mg7gemon': {
      'en': 'Business+',
      'th': '',
    },
    's5ffplq3': {
      'en': 'Hi Perks Business+',
      'th': '',
    },
    'dtz23kwe': {
      'en': '⭐️',
      'th': '',
    },
    'g91k8eau': {
      'en': 'Loyalty Program Management',
      'th': '',
    },
    '3m5j5hvf': {
      'en':
          '\nEasily create and customise redeemable tailored to your business\'s needs.',
      'th': '',
    },
    'klyzawtd': {
      'en': '💳',
      'th': '',
    },
    'wmplf173': {
      'en': 'Custom Loyalty Cards',
      'th': '',
    },
    '1d041wy2': {
      'en':
          '\nElevate your loyalty program by personalizing cards with colors and images',
      'th': '',
    },
    's3sbpivr': {
      'en': '🌟',
      'th': '',
    },
    'ecq8riew': {
      'en': 'Unlimited Points!',
      'th': '',
    },
    'c34onrxd': {
      'en': '\nReward your customers infinitely!',
      'th': '',
    },
    'myifl9kz': {
      'en': '🎁',
      'th': '',
    },
    'h9q8gsol': {
      'en': 'Unlimited Redeemables!',
      'th': '',
    },
    'gxyb20yt': {
      'en': '\nMake redeemables for your customer!',
      'th': '',
    },
    'vztbfbea': {
      'en': '🏞️',
      'th': '',
    },
    'vynm1o4f': {
      'en': 'Store Discovery',
      'th': '',
    },
    'i8mnfau8': {
      'en':
          '\nLet people discover your store and be featured in our store discovery page!',
      'th': '',
    },
    'eby2ohw8': {
      'en': '🏬',
      'th': '',
    },
    'uq4leb56': {
      'en': 'Add Up to 1 Branches',
      'th': '',
    },
    'pdj7w49g': {
      'en': '\nExpand your reach by adding up to 1 branches to your account.',
      'th': '',
    },
    's7fjful8': {
      'en': 'Elite',
      'th': '',
    },
    '3jco4h3s': {
      'en': 'Hi Perks Business Elite',
      'th': '',
    },
    'rryw3x4c': {
      'en': '⭐️',
      'th': '',
    },
    'fxli42aj': {
      'en': 'Loyalty Program Management',
      'th': '',
    },
    'gvys31dv': {
      'en':
          '\nEasily create and customise redeemable tailored to your business\'s needs.',
      'th': '',
    },
    'arqpxcm1': {
      'en': '💳',
      'th': '',
    },
    'j3begd3o': {
      'en': 'Custom Loyalty Cards',
      'th': '',
    },
    'ofwgdogm': {
      'en':
          '\nElevate your loyalty program by personalizing cards with colors and images',
      'th': '',
    },
    'bjezcnfp': {
      'en': '🌟',
      'th': '',
    },
    '3tdc80fu': {
      'en': 'Unlimited Points!',
      'th': '',
    },
    't8jt7xat': {
      'en': '\nReward your customers infinitely!',
      'th': '',
    },
    'wtbxtk4d': {
      'en': '🎁',
      'th': '',
    },
    'tsbmqppy': {
      'en': 'Unlimited Redeemables!',
      'th': '',
    },
    'zbvimvu4': {
      'en': '\nMake redeemables for your customer!',
      'th': '',
    },
    'gf895nq2': {
      'en': '💯',
      'th': '',
    },
    'a9t604tl': {
      'en': 'Unlimited Vouchers!',
      'th': '',
    },
    'i8ko341f': {
      'en': '\nMake vouchers for your customer!',
      'th': '',
    },
    'h27b4o5o': {
      'en': '🏞️',
      'th': '',
    },
    'xj5omjp6': {
      'en': 'Store Discovery',
      'th': '',
    },
    'oq0ecf5a': {
      'en':
          '\nLet people discover your store and be featured in our store discovery page!',
      'th': '',
    },
    'pnrvr91r': {
      'en': '🏬',
      'th': '',
    },
    'ljibchlw': {
      'en': 'Add Up to 5 Branches',
      'th': '',
    },
    'sbisevvl': {
      'en': '\nExpand your reach by adding up to 5 branches to your account.',
      'th': '',
    },
    '9w9j10hu': {
      'en': '👥',
      'th': '',
    },
    'o79bxg7w': {
      'en': 'Add Team Members',
      'th': '',
    },
    '3o3kej5k': {
      'en':
          '\nManage your team effectively by adding members and controlling access based on roles. Streamline operations and enhance security with role-specific permissions.',
      'th': '',
    },
    'uloqetra': {
      'en': '📒',
      'th': '',
    },
    'aoioe8n9': {
      'en': 'Pre-Order + Earn Points Feature!',
      'th': '',
    },
    'ueywyzs2': {
      'en':
          '\nShowcase your offerings and auto-compute points with our new catalog feature.',
      'th': '',
    },
    'vfxh76li': {
      'en': '⏳',
      'th': '',
    },
    'ni91nz7x': {
      'en': 'Points Expiration',
      'th': '',
    },
    'gnjgezkv': {
      'en':
          '\nSet custom expiration dates for points to encourage timely redemptions and keep your customers coming back.',
      'th': '',
    },
    '3snm3bg7': {
      'en': '1 month free, Then ',
      'th': '',
    },
    'hz2d9v2n': {
      'en': '/Month',
      'th': '',
    },
    'dok5dhny': {
      'en': 'Hello World',
      'th': '',
    },
    'oo51p55m': {
      'en': 'Start Free Trial',
      'th': '',
    },
    '3vdghei8': {
      'en': 'Restore Purchase',
      'th': '',
    },
    '0o9c0leu': {
      'en': 'Privacy Policy',
      'th': '',
    },
    'u18ekzxo': {
      'en': '·',
      'th': '',
    },
    'mkd8qmk2': {
      'en': 'Terms of Use',
      'th': '',
    },
  },
  // emptyBranch
  {
    'deaaw0hf': {
      'en': 'No Branches Added Yet',
      'th': '',
    },
  },
  // AddBranchComponent
  {
    '3a6aends': {
      'en': 'Add Branch',
      'th': '',
    },
    'xuqiueas': {
      'en': 'Branch Name',
      'th': '',
    },
    'g8xdx8em': {
      'en': 'Branch Address',
      'th': '',
    },
    'c26hg8cb': {
      'en': 'Select Location',
      'th': '',
    },
    '60wx2apl': {
      'en': 'Field is required',
      'th': '',
    },
    'mfxl6nfe': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'uregoeod': {
      'en': 'Field is required',
      'th': '',
    },
    'lo9xb6vu': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '37beslut': {
      'en': 'Add Branch',
      'th': '',
    },
  },
  // RedeemDetails
  {
    'w0odfk1s': {
      'en': 'Scan the QR code at the front desk or kiosk.',
      'th': '',
    },
    'mn5c0l05': {
      'en': 'Redeemed an ',
      'th': '',
    },
    '6iwh1zwl': {
      'en': '! ',
      'th': '',
    },
    'svz0zeac': {
      'en': '\n',
      'th': '',
    },
    'qbgg8tjw': {
      'en': '⭐️',
      'th': '',
    },
    'h6hjx6gw': {
      'en': '\n',
      'th': '',
    },
    '5ibyxeko': {
      'en': 'Hello World',
      'th': '',
    },
    'b3982f1v': {
      'en': 'Branch: ',
      'th': '',
    },
    '55pttkrx': {
      'en': 'Confirm Date: ',
      'th': '',
    },
    'dz9juzpj': {
      'en': 'Rate Your Experience',
      'th': '',
    },
    'g9np0xrz': {
      'en': 'How satisfied were you with our service?',
      'th': '',
    },
    'atbm4fb1': {
      'en': 'Additional Feedback',
      'th': '',
    },
    'pjn89bay': {
      'en': 'Tell us about your experience...',
      'th': '',
    },
    '61to7903': {
      'en': 'Submit Feedback',
      'th': '',
    },
    'r58x25nf': {
      'en': 'Thank you for your feedback!',
      'th': '',
    },
    '9w9zm39j': {
      'en': 'How satisfied were you with our service?',
      'th': '',
    },
    'jg60msfq': {
      'en': 'Additional Feedback',
      'th': '',
    },
    'mwwlunac': {
      'en': 'Tell us about your experience...',
      'th': '',
    },
  },
  // AddPointConfirmComponent
  {
    '8mqrg4po': {
      'en': '⭐️ ',
      'th': '',
    },
    'yubzn38c': {
      'en': 'Cancel',
      'th': '',
    },
    'cd2r7wpt': {
      'en': 'Confirm',
      'th': '',
    },
  },
  // AddQuickPointsPrompt
  {
    '1d6lzjpr': {
      'en': 'How much quick points you want to add?',
      'th': '',
    },
    '4m0jblfi': {
      'en': 'Points',
      'th': '',
    },
    'ko31q2s1': {
      'en': 'Quick Points',
      'th': '',
    },
    'xxeqzh5d': {
      'en': 'Field is required',
      'th': '',
    },
    'pwsrmye7': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'w2vfll2a': {
      'en': 'Cancel',
      'th': '',
    },
    '2ypryjwh': {
      'en': 'Confirm',
      'th': '',
    },
  },
  // AddTeamMemberComponent
  {
    'wpkmo2n2': {
      'en': 'Add Team Member',
      'th': '',
    },
    'uw40ndsz': {
      'en': 'Upload Member Photo',
      'th': '',
    },
    '8cy0trnw': {
      'en': 'Team Role:',
      'th': '',
    },
    'i7aec22o': {
      'en': 'Option 1',
      'th': '',
    },
    'dgwarhsi': {
      'en': 'Assigned Branch:',
      'th': '',
    },
    'umaw74ut': {
      'en': 'Option 1',
      'th': '',
    },
    'c8wd5682': {
      'en': 'Name',
      'th': '',
    },
    'i1qsuzoy': {
      'en': 'Mobile Number',
      'th': '',
    },
    'frq7o8gk': {
      'en': 'Access Password',
      'th': '',
    },
    'twnkhdd1': {
      'en': 'Confirm Access Password',
      'th': '',
    },
    'djyhxpxa': {
      'en': 'Field is required',
      'th': '',
    },
    'h4flrwiv': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '7impn8sv': {
      'en': 'Field is required',
      'th': '',
    },
    'ox3swptk': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'uutbhidq': {
      'en': 'Field is required',
      'th': '',
    },
    'zoiofpfs': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '6qbtj2oz': {
      'en': 'Field is required',
      'th': '',
    },
    'a24kt10a': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'karlz53c': {
      'en': 'Add',
      'th': '',
    },
  },
  // EditTeamMemberComponent
  {
    '593dlgkf': {
      'en': 'Edit Team Member',
      'th': '',
    },
    'q9lbpbz3': {
      'en': 'Upload Member Photo',
      'th': '',
    },
    'hlw480bt': {
      'en': 'Team Role:',
      'th': '',
    },
    'l4gl947m': {
      'en': 'Option 1',
      'th': '',
    },
    'i5u4fqsy': {
      'en': 'Assigned Branch:',
      'th': '',
    },
    'u2y2kshp': {
      'en': 'Option 1',
      'th': '',
    },
    'n2b1ftbt': {
      'en': 'Name',
      'th': '',
    },
    'btfqfuyk': {
      'en': 'Mobile Number',
      'th': '',
    },
    'qgpgo76s': {
      'en': 'Access Password',
      'th': '',
    },
    'tbsv6uro': {
      'en': 'Confirm Access Password',
      'th': '',
    },
    '1nclxmc5': {
      'en': 'Field is required',
      'th': '',
    },
    '8tdff71e': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'h9idj5cc': {
      'en': 'Field is required',
      'th': '',
    },
    '6javd6ud': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '0h8yozr7': {
      'en': 'Field is required',
      'th': '',
    },
    'hsp0k2hn': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '7ayye2lq': {
      'en': 'Field is required',
      'th': '',
    },
    'ybn75g3j': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '1tt25jdu': {
      'en': 'Save',
      'th': '',
    },
  },
  // SetupOwnerTeamMember
  {
    '23pdgbot': {
      'en': 'Setup Owner Account',
      'th': '',
    },
    '8is3c4hs': {
      'en': 'Upload Member Photo',
      'th': '',
    },
    'zoa0thrr': {
      'en': 'Option 1',
      'th': '',
    },
    'ejzma0w7': {
      'en': 'Name',
      'th': '',
    },
    'josrl8oz': {
      'en': 'Mobile Number',
      'th': '',
    },
    '2rhs8n88': {
      'en': 'Access Password',
      'th': '',
    },
    'd1e6yhi2': {
      'en': 'Confirm Access Password',
      'th': '',
    },
    'dewxp7pb': {
      'en': 'Field is required',
      'th': '',
    },
    'l1ffyv3v': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'amrk1r6d': {
      'en': 'Field is required',
      'th': '',
    },
    '0snp6pvt': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '1l87z3jp': {
      'en': 'Field is required',
      'th': '',
    },
    '0iypgdtt': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '748oqnpw': {
      'en': 'Field is required',
      'th': '',
    },
    '8wmhmegh': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'm9bpcs9m': {
      'en': 'Confirm',
      'th': '',
    },
  },
  // TeamMemberEnterPasscode
  {
    'c4ptsndq': {
      'en': 'Enter Password',
      'th': '',
    },
    'w55qkkuj': {
      'en': 'Wrong password, Please try again.',
      'th': '',
    },
    'y4400rpn': {
      'en': 'Login',
      'th': '',
    },
  },
  // AddStoreCatalogComponent
  {
    'kg3jt29y': {
      'en': 'Item Name',
      'th': '',
    },
    'se84f3kq': {
      'en': 'Category',
      'th': '',
    },
    'csszlomz': {
      'en': 'Select Category',
      'th': '',
    },
    'r1g86nj4': {
      'en': 'Search',
      'th': '',
    },
    '1jhb598y': {
      'en': 'Option 1',
      'th': '',
    },
    'a7f88b4o': {
      'en': 'Option 2',
      'th': '',
    },
    'hhed348x': {
      'en': 'Option 3',
      'th': '',
    },
    'lzibi9eg': {
      'en': 'Available At Branch',
      'th': '',
    },
    'uj1piz1v': {
      'en': 'Option 1',
      'th': '',
    },
    'cndijdzj': {
      'en': 'Option 2',
      'th': '',
    },
    'xdbad8jo': {
      'en': 'Option 3',
      'th': '',
    },
    '46pho4ni': {
      'en': 'Product Variation',
      'th': '',
    },
    'hjwpr4br': {
      'en': 'Add Variation',
      'th': '',
    },
    '6sfk7aak': {
      'en': 'Item Description',
      'th': '',
    },
    'pddc1wnq': {
      'en': 'Field is required',
      'th': '',
    },
    'ytq387kt': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'l1jr8yzj': {
      'en': 'Field is required',
      'th': '',
    },
    'hyyep7q4': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'db9c1zfm': {
      'en': 'Add Item',
      'th': '',
    },
  },
  // AddPointsCatalogItemComponent
  {
    'pbrjj7bf': {
      'en': 'Earn ⭐️',
      'th': '',
    },
    'gemsfz4i': {
      'en': 'Price: ',
      'th': '',
    },
    'crrjq6ll': {
      'en': 'Option 1',
      'th': '',
    },
  },
  // AddVariationComponent
  {
    'olywhl5t': {
      'en': 'Enter Variation Details',
      'th': '',
    },
    'h8cdixfc': {
      'en': 'Variation Name',
      'th': '',
    },
    'mqjmx123': {
      'en': 'Variation Price 💵',
      'th': '',
    },
    'gr3bvsvm': {
      'en': 'Variation Points ⭐️',
      'th': '',
    },
    'upljmdqr': {
      'en': 'Cancel',
      'th': '',
    },
    'a42kx93m': {
      'en': 'Add',
      'th': '',
    },
  },
  // VariationPointsComponent
  {
    'gjfkmpcv': {
      'en': 'Points Earn ⭐️',
      'th': '',
    },
  },
  // VariationPriceComponent
  {
    '74mpo5ur': {
      'en': 'Item Price 💵',
      'th': '',
    },
  },
  // OrderTransactionDetails
  {
    'c4bhiyzm': {
      'en': 'Transaction ID: ',
      'th': '',
    },
    'f17folhw': {
      'en': 'Team Member: ',
      'th': '',
    },
    'eucqxtcw': {
      'en': 'Role: ',
      'th': '',
    },
    'bntyctep': {
      'en': 'Branch: ',
      'th': '',
    },
    '21dk3utf': {
      'en': 'Date: ',
      'th': '',
    },
    '001aw3ld': {
      'en': 'Confirmation Date: ',
      'th': '',
    },
    'j9nnu2vh': {
      'en': 'Orders: ',
      'th': '',
    },
    'yimufeh7': {
      'en': 'x ',
      'th': '',
    },
    'b09fcihf': {
      'en': ' (',
      'th': '',
    },
    '4uh4gnvh': {
      'en': ')',
      'th': '',
    },
    'krhnfahl': {
      'en': 'Total Price: ',
      'th': '',
    },
    'yo06jrz5': {
      'en': 'Total Points Earned: ',
      'th': '',
    },
    'a8hx2o18': {
      'en': '⭐️',
      'th': '',
    },
    'x1d2gm3l': {
      'en': 'Previous Total Points: ',
      'th': '',
    },
    'ms3i62mn': {
      'en': '⭐️',
      'th': '',
    },
    'zvglm5nf': {
      'en': 'Notes: ',
      'th': '',
    },
    '92yphw8s': {
      'en': 'Cancelled Order',
      'th': '',
    },
    'se9xpuej': {
      'en': 'Cancel Order',
      'th': '',
    },
  },
  // OrderDetails
  {
    'tfe0cjql': {
      'en': 'Cancelled',
      'th': '',
    },
    '8ccyh64j': {
      'en': 'Scan the QR code at the front desk or kiosk.',
      'th': '',
    },
    'dpqwtf6u': {
      'en': 'Price Breakdown',
      'th': '',
    },
    '0umoa45p': {
      'en': 'Total Price',
      'th': '',
    },
    'fdbr2wgc': {
      'en': 'Points Earned',
      'th': '',
    },
    'q3ey3of6': {
      'en': '⭐️',
      'th': '',
    },
    'p9nkn8f1': {
      'en': '\$125.50',
      'th': '',
    },
    '7bs0kb8r': {
      'en': 'Note:',
      'th': '',
    },
    '4a11trlq': {
      'en': 'Branch: ',
      'th': '',
    },
    'syna17ep': {
      'en': 'Order Date: ',
      'th': '',
    },
    'sjffuq7z': {
      'en': 'Confirm Date: ',
      'th': '',
    },
    'o8kaxyba': {
      'en': 'Price: ',
      'th': '',
    },
    'haewg95t': {
      'en': '\$125.50',
      'th': '',
    },
    'wv9co0c2': {
      'en': 'Points Earned: ',
      'th': '',
    },
    'krr5bhuy': {
      'en': '\$125.50',
      'th': '',
    },
    'yzyknfw0': {
      'en': 'Quanity: ',
      'th': '',
    },
    'mvi0ckv0': {
      'en': 'Quanity: 1',
      'th': '',
    },
    'y1hopkvr': {
      'en': 'Controller Basic',
      'th': '',
    },
    'q4y7roho': {
      'en': '\$125.50',
      'th': '',
    },
    'scit25gi': {
      'en': 'Quanity: 1',
      'th': '',
    },
    'tqmw3a6o': {
      'en': 'Cancel Order',
      'th': '',
    },
    'ph8ygpvy': {
      'en': 'Rate Your Experience',
      'th': '',
    },
    '9v9fu0at': {
      'en': 'How satisfied were you with our service?',
      'th': '',
    },
    'iaoo2pis': {
      'en': 'Additional Feedback',
      'th': '',
    },
    'zl83igba': {
      'en': 'Tell us about your experience...',
      'th': '',
    },
    '95l1l9di': {
      'en': 'Submit Feedback',
      'th': '',
    },
    'qwtta1ty': {
      'en': 'Thank you for your feedback!',
      'th': '',
    },
    'o2o2dbf1': {
      'en': 'How satisfied were you with our service?',
      'th': '',
    },
    'oe7jrvma': {
      'en': 'Additional Feedback',
      'th': '',
    },
    '80j0x3k4': {
      'en': 'Tell us about your experience...',
      'th': '',
    },
  },
  // transactionPreviewItemComponent
  {
    'rrcs8rmn': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'th': '',
    },
    'jv8i006z': {
      'en': 'Orders:',
      'th': '',
    },
    'e8iuaacn': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'th': '',
    },
    'eunyqg2u': {
      'en': 'x ',
      'th': '',
    },
    'ufxto862': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'th': '',
    },
    'ggynetei': {
      'en': '⭐️',
      'th': '',
    },
    '6m2na0ad': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'th': '',
    },
  },
  // EditStoreCatalogComponent
  {
    '8a54pu37': {
      'en': 'Upload Image',
      'th': '',
    },
    'i4khjb9j': {
      'en': 'Item Name',
      'th': '',
    },
    'abyf9h4l': {
      'en': 'Category',
      'th': '',
    },
    '0appf91u': {
      'en': 'Select Category',
      'th': '',
    },
    '28px4603': {
      'en': 'Search',
      'th': '',
    },
    'ltf3er16': {
      'en': 'Option 1',
      'th': '',
    },
    'n3s0msq8': {
      'en': 'Option 2',
      'th': '',
    },
    'v74y3hub': {
      'en': 'Option 3',
      'th': '',
    },
    'wdg9gqoe': {
      'en': 'Available At Branch',
      'th': '',
    },
    'e17imzwd': {
      'en': 'Option 1',
      'th': '',
    },
    '0aagy8v9': {
      'en': 'Option 2',
      'th': '',
    },
    'qux068yp': {
      'en': 'Option 3',
      'th': '',
    },
    'p9n4swzz': {
      'en': 'Product Variation',
      'th': '',
    },
    'eoi529zj': {
      'en': 'Add Variation',
      'th': '',
    },
    'bi01mgeu': {
      'en': 'Out Of Stock',
      'th': '',
    },
    'lv4m2jhx': {
      'en':
          'This will show that the item is out of stock and ordering will be disabled',
      'th': '',
    },
    'jinyj91r': {
      'en': 'Item Description',
      'th': '',
    },
    'ucmaqyh5': {
      'en': 'Field is required',
      'th': '',
    },
    'gs9jd6lt': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'i2kf5v8q': {
      'en': 'Field is required',
      'th': '',
    },
    'zhf5g9je': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '0qegl8fg': {
      'en': 'Field is required',
      'th': '',
    },
    '3qpevcsx': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'e431q5v0': {
      'en': 'Update Item',
      'th': '',
    },
    'p5et45zn': {
      'en': 'Cancel',
      'th': '',
    },
  },
  // AddCategoryPrompt
  {
    'j966ubac': {
      'en': 'Name the category you want to add.',
      'th': '',
    },
    'jt44jxru': {
      'en': 'Category Name',
      'th': '',
    },
    'rttfgfi9': {
      'en': 'Category Name',
      'th': '',
    },
    '9fskic0h': {
      'en': 'Field is required',
      'th': '',
    },
    'yksonzs5': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'lqm8m3v8': {
      'en': 'Cancel',
      'th': '',
    },
    '8i4koi47': {
      'en': 'Add',
      'th': '',
    },
  },
  // emptyStoreCatalogComponent
  {
    'jmkm384o': {
      'en': 'No Catalog Item Yet',
      'th': '',
    },
  },
  // emptyNotificationComponent
  {
    'k58xi38m': {
      'en': 'No Notification Yet',
      'th': '',
    },
  },
  // DashboardComponent
  {
    'mi4h0zop': {
      'en': 'Summary Overview',
      'th': '',
    },
  },
  // RatingFeedbackComponent
  {
    '5yw59kk7': {
      'en': 'Rate Your Experience',
      'th': '',
    },
    '882ohemo': {
      'en': 'How satisfied were you with our service?',
      'th': '',
    },
    '9xkcgh4w': {
      'en': 'Additional Feedback',
      'th': '',
    },
    'ulxu5ju2': {
      'en': 'Tell us about your experience...',
      'th': '',
    },
    'jvaud4f7': {
      'en': 'Submit Feedback',
      'th': '',
    },
  },
  // ShareQRComponent
  {
    't7fnc9xg': {
      'en': 'Save QR',
      'th': '',
    },
  },
  // ShareActionComponent
  {
    'pgogih1k': {
      'en': 'Save QR',
      'th': '',
    },
    '3tmfwb1h': {
      'en': 'Share Link',
      'th': '',
    },
    '435rtjnn': {
      'en': 'Cancel',
      'th': '',
    },
  },
  // GooglePlacePreview
  {
    'xwf2u6mk': {
      'en': 'Confirm Store',
      'th': '',
    },
    'ksuchn3c': {
      'en': 'Cancel',
      'th': '',
    },
  },
  // AppstoreGoogleplayLinks
  {
    '4sxno1t0': {
      'en': 'For businesses, please download the Hi Perks app to get started!',
      'th': '',
    },
    'x808f638': {
      'en': 'Apple App Store',
      'th': '',
    },
    'yhrwr2az': {
      'en': 'Google Play',
      'th': '',
    },
    'hyf0p7j5': {
      'en': 'Cancel',
      'th': '',
    },
  },
  // LeaderboardComponent
  {
    '7iomdu5p': {
      'en': 'Top 10 Members ⭐️',
      'th': '',
    },
  },
  // PointsEarnedComponent
  {
    'stalgl47': {
      'en': 'Yay, You Did It! 👋',
      'th': '',
    },
    'ym2mmrre': {
      'en': 'Hit us with your feedback!',
      'th': '',
    },
    'q6wekus8': {
      'en': 'Maybe, Next Time ',
      'th': '',
    },
  },
  // EmptyChat
  {
    'qvhs5hmg': {
      'en': 'Start a conversation to see messages appear here.',
      'th': '',
    },
  },
  // MarketingMaterialsComponent
  {
    't7lr3060': {
      'en': 'Download Hi Perks Poster',
      'th': '',
    },
    'lxuqav5g': {
      'en': 'Save QR Only',
      'th': '',
    },
    'durdghqu': {
      'en':
          'With this printable poster, you can now easily encourage customers to join your loyalty program by simply scanning a QR code. Once scanned, customers will be redirected to download the Hi Perks app from the App Store or Google Play, making sign-up quick and effortless.\n\n\nHow to use it:\n\n1. Download the QR Poster from your Hi Perks dashboard\n\n2. Print and display it at your checkout counter, entrance, or window\n\n3. Let your customers scan and start earning rewards instantly!',
      'th': '',
    },
  },
  // NotificationDetailsComponent
  {
    '83w6445n': {
      'en': 'Close',
      'th': '',
    },
  },
  // UserVoucherDetail
  {
    's1uwqme9': {
      'en': 'Show this QR Code to cashier to redeem! 🎉',
      'th': '',
    },
  },
  // Miscellaneous
  {
    '9voif31z': {
      'en':
          ' Hi Perks would like to access your camera to enable you to set or update your profile picture and for QR scanning. ',
      'th':
          'สวัสดี Perks ต้องการเข้าถึงกล้องของคุณเพื่อให้คุณสามารถตั้งค่าหรืออัปเดตรูปโปรไฟล์และเพื่อการสแกน QR',
    },
    'wr5jc30l': {
      'en':
          ' Hi Perks would like to access your photo library to enable you to set or update your profile picture.',
      'th':
          'สวัสดี Perks ต้องการเข้าถึงคลังภาพของคุณ เพื่อให้คุณสามารถตั้งค่าหรืออัปเดตภาพโปรไฟล์ของคุณได้',
    },
    '91ntjch4': {
      'en':
          'Hi Perks would like to send you notifications to enhance your experience and keep you updated.',
      'th': '',
    },
    'susni0qd': {
      'en':
          'Hi Perks needs access to your location to help you set or update your store\'s Google Review reference accurately.',
      'th': '',
    },
    'bxl59js0': {
      'en':
          'Hi Perks needs access to your location to help you set or update your store\'s Google Review reference accurately.',
      'th': '',
    },
    '5tq1sb8l': {
      'en': '',
      'th': '',
    },
    'gdofr0w0': {
      'en': '',
      'th': '',
    },
    '3vj4eatd': {
      'en': '',
      'th': '',
    },
    'n7btbfpq': {
      'en': '',
      'th': '',
    },
    '270njw3p': {
      'en': '',
      'th': '',
    },
    'dawv4hi2': {
      'en': '',
      'th': '',
    },
    'qixbrank': {
      'en': '',
      'th': '',
    },
    'c2pup2qs': {
      'en': '',
      'th': '',
    },
    '94j3p5pn': {
      'en': '',
      'th': '',
    },
    '8nfc9si2': {
      'en': '',
      'th': '',
    },
    '11sz8vyw': {
      'en': '',
      'th': '',
    },
    'b1dqdlpq': {
      'en': '',
      'th': '',
    },
    'ea8jem9x': {
      'en': '',
      'th': '',
    },
    'eofrkew3': {
      'en': '',
      'th': '',
    },
    'adcxikw2': {
      'en': '',
      'th': '',
    },
    'qm9gxdtq': {
      'en': '',
      'th': '',
    },
    'd0ysc5yj': {
      'en': '',
      'th': '',
    },
    '6hnnk6cz': {
      'en': '',
      'th': '',
    },
    '5pvhamdl': {
      'en': '',
      'th': '',
    },
    'pd8geifo': {
      'en': '',
      'th': '',
    },
    '09sbo5vx': {
      'en': '',
      'th': '',
    },
    'wpg4nqau': {
      'en': '',
      'th': '',
    },
    'iut3rmq8': {
      'en': '',
      'th': '',
    },
    'qbzjh0lg': {
      'en': '',
      'th': '',
    },
    'mqdtsh91': {
      'en': '',
      'th': '',
    },
  },
].reduce((a, b) => a..addAll(b));
