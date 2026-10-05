/// 片假名外来语词源信息。
class LoanwordInfo {
  /// 片假名表面形式。
  final String surface;

  /// 源语言外来词原型 (如 'coffee', 'computer', 'Arbeit')。
  final String source;

  /// 源语言 (如 'en', 'de', 'pt', 'fr', 'nl', 'it')。
  final String language;

  /// 中文释义。
  final String meaningZh;

  /// 英文释义。
  final String meaningEn;

  const LoanwordInfo({
    required this.surface,
    required this.source,
    required this.language,
    required this.meaningZh,
    required this.meaningEn,
  });
}

/// 常用片假名外来语离线词典。
///
/// 覆盖高频生活、科技、饮食、日常用语, 帮助学习者理解片假名词汇的原生词源。
final Map<String, LoanwordInfo> kLoanwordsDict = _buildLoanwords();

LoanwordInfo? lookupLoanword(String surface) {
  return kLoanwordsDict[surface];
}

Map<String, LoanwordInfo> _buildLoanwords() {
  const list = <LoanwordInfo>[
    // 饮食生活
    LoanwordInfo(surface: 'コーヒー', source: 'koffie (Dutch) / coffee', language: 'nl', meaningZh: '咖啡', meaningEn: 'coffee'),
    LoanwordInfo(surface: 'パン', source: 'pão (Portuguese)', language: 'pt', meaningZh: '面包', meaningEn: 'bread'),
    LoanwordInfo(surface: 'アイス', source: 'ice / ice cream', language: 'en', meaningZh: '冰块 / 冰淇淋', meaningEn: 'ice / ice cream'),
    LoanwordInfo(surface: 'アイスクリーム', source: 'ice cream', language: 'en', meaningZh: '冰淇淋', meaningEn: 'ice cream'),
    LoanwordInfo(surface: 'ケーキ', source: 'cake', language: 'en', meaningZh: '蛋糕', meaningEn: 'cake'),
    LoanwordInfo(surface: 'チョコレート', source: 'chocolate', language: 'en', meaningZh: '巧克力', meaningEn: 'chocolate'),
    LoanwordInfo(surface: 'ジュース', source: 'juice', language: 'en', meaningZh: '果汁 / 饮料', meaningEn: 'juice'),
    LoanwordInfo(surface: 'ミルク', source: 'milk', language: 'en', meaningZh: '牛奶', meaningEn: 'milk'),
    LoanwordInfo(surface: 'ビール', source: 'bier (Dutch) / beer', language: 'nl', meaningZh: '啤酒', meaningEn: 'beer'),
    LoanwordInfo(surface: 'ワイン', source: 'wine', language: 'en', meaningZh: '葡萄酒', meaningEn: 'wine'),
    LoanwordInfo(surface: 'ステーキ', source: 'steak', language: 'en', meaningZh: '牛排', meaningEn: 'steak'),
    LoanwordInfo(surface: 'サラダ', source: 'salada (Portuguese) / salad', language: 'pt', meaningZh: '沙拉', meaningEn: 'salad'),
    LoanwordInfo(surface: 'サンドイッチ', source: 'sandwich', language: 'en', meaningZh: '三明治', meaningEn: 'sandwich'),
    LoanwordInfo(surface: 'ピザ', source: 'pizza', language: 'it', meaningZh: '披萨', meaningEn: 'pizza'),
    LoanwordInfo(surface: 'カレー', source: 'curry', language: 'en', meaningZh: '咖喱', meaningEn: 'curry'),
    LoanwordInfo(surface: 'チーズ', source: 'cheese', language: 'en', meaningZh: '奶酪 / 芝士', meaningEn: 'cheese'),
    LoanwordInfo(surface: 'バター', source: 'butter', language: 'en', meaningZh: '黄油', meaningEn: 'butter'),
    LoanwordInfo(surface: 'スープ', source: 'soup', language: 'en', meaningZh: '浓汤', meaningEn: 'soup'),
    LoanwordInfo(surface: 'デザート', source: 'dessert', language: 'en', meaningZh: '甜品', meaningEn: 'dessert'),
    LoanwordInfo(surface: 'メニュー', source: 'menu (French)', language: 'fr', meaningZh: '菜单', meaningEn: 'menu'),
    LoanwordInfo(surface: 'スプーン', source: 'spoon', language: 'en', meaningZh: '勺子', meaningEn: 'spoon'),
    LoanwordInfo(surface: 'フォーク', source: 'fork', language: 'en', meaningZh: '叉子', meaningEn: 'fork'),
    LoanwordInfo(surface: 'ナイフ', source: 'knife', language: 'en', meaningZh: '餐刀', meaningEn: 'knife'),
    LoanwordInfo(surface: 'コップ', source: 'kop (Dutch)', language: 'nl', meaningZh: '水杯', meaningEn: 'cup / glass'),
    LoanwordInfo(surface: 'グラス', source: 'glass', language: 'en', meaningZh: '玻璃杯', meaningEn: 'glass'),

    // 科技与网络
    LoanwordInfo(surface: 'コンピュータ', source: 'computer', language: 'en', meaningZh: '电脑', meaningEn: 'computer'),
    LoanwordInfo(surface: 'コンピューター', source: 'computer', language: 'en', meaningZh: '电脑', meaningEn: 'computer'),
    LoanwordInfo(surface: 'パソコン', source: 'personal computer (abbr.)', language: 'en', meaningZh: '个人电脑', meaningEn: 'PC / laptop'),
    LoanwordInfo(surface: 'インターネット', source: 'internet', language: 'en', meaningZh: '互联网', meaningEn: 'internet'),
    LoanwordInfo(surface: 'ネット', source: 'network / internet (abbr.)', language: 'en', meaningZh: '网络', meaningEn: 'the net'),
    LoanwordInfo(surface: 'アプリ', source: 'application (abbr.)', language: 'en', meaningZh: '应用程序', meaningEn: 'app'),
    LoanwordInfo(surface: 'スマートフォン', source: 'smartphone', language: 'en', meaningZh: '智能手机', meaningEn: 'smartphone'),
    LoanwordInfo(surface: 'スマホ', source: 'smartphone (abbr.)', language: 'en', meaningZh: '智能手机', meaningEn: 'smartphone'),
    LoanwordInfo(surface: 'メール', source: 'email', language: 'en', meaningZh: '邮件 / 简讯', meaningEn: 'email / mail'),
    LoanwordInfo(surface: 'メッセージ', source: 'message', language: 'en', meaningZh: '信息 / 消息', meaningEn: 'message'),
    LoanwordInfo(surface: 'ウェブ', source: 'web', language: 'en', meaningZh: '万维网', meaningEn: 'the web'),
    LoanwordInfo(surface: 'サイト', source: 'website', language: 'en', meaningZh: '网站', meaningEn: 'website / site'),
    LoanwordInfo(surface: 'データ', source: 'data', language: 'en', meaningZh: '数据', meaningEn: 'data'),
    LoanwordInfo(surface: 'ファイル', source: 'file', language: 'en', meaningZh: '文件', meaningEn: 'file'),
    LoanwordInfo(surface: 'フォルダー', source: 'folder', language: 'en', meaningZh: '文件夹', meaningEn: 'folder'),
    LoanwordInfo(surface: 'クリック', source: 'click', language: 'en', meaningZh: '点击', meaningEn: 'click'),
    LoanwordInfo(surface: 'キーボード', source: 'keyboard', language: 'en', meaningZh: '键盘', meaningEn: 'keyboard'),
    LoanwordInfo(surface: 'マウス', source: 'mouse', language: 'en', meaningZh: '鼠标', meaningEn: 'mouse'),
    LoanwordInfo(surface: 'スクリーン', source: 'screen', language: 'en', meaningZh: '屏幕', meaningEn: 'screen'),
    LoanwordInfo(surface: 'システム', source: 'system', language: 'en', meaningZh: '系统', meaningEn: 'system'),
    LoanwordInfo(surface: 'プログラム', source: 'program', language: 'en', meaningZh: '程序 / 项目', meaningEn: 'program'),
    LoanwordInfo(surface: 'ソフト', source: 'software (abbr.)', language: 'en', meaningZh: '软件', meaningEn: 'software'),
    LoanwordInfo(surface: 'ハード', source: 'hardware (abbr.)', language: 'en', meaningZh: '硬件', meaningEn: 'hardware'),
    LoanwordInfo(surface: 'オンライン', source: 'online', language: 'en', meaningZh: '在线', meaningEn: 'online'),
    LoanwordInfo(surface: 'オフライン', source: 'offline', language: 'en', meaningZh: '离线', meaningEn: 'offline'),
    LoanwordInfo(surface: 'パスワード', source: 'password', language: 'en', meaningZh: '密码', meaningEn: 'password'),
    LoanwordInfo(surface: 'アカウント', source: 'account', language: 'en', meaningZh: '账号', meaningEn: 'account'),
    LoanwordInfo(surface: 'ユーザー', source: 'user', language: 'en', meaningZh: '用户', meaningEn: 'user'),
    LoanwordInfo(surface: 'サーバー', source: 'server', language: 'en', meaningZh: '服务器', meaningEn: 'server'),

    // 职场与社会
    LoanwordInfo(surface: 'アルバイト', source: 'Arbeit (German)', language: 'de', meaningZh: '打工 / 兼职', meaningEn: 'part-time job'),
    LoanwordInfo(surface: 'バイト', source: 'Arbeit (abbr.)', language: 'de', meaningZh: '打工 / 兼职', meaningEn: 'part-time job'),
    LoanwordInfo(surface: 'プロジェクト', source: 'project', language: 'en', meaningZh: '项目 / 企划', meaningEn: 'project'),
    LoanwordInfo(surface: 'ミーティング', source: 'meeting', language: 'en', meaningZh: '会议', meaningEn: 'meeting'),
    LoanwordInfo(surface: 'スケジュール', source: 'schedule', language: 'en', meaningZh: '日程 / 安排', meaningEn: 'schedule'),
    LoanwordInfo(surface: 'プラン', source: 'plan', language: 'en', meaningZh: '计划 / 方案', meaningEn: 'plan'),
    LoanwordInfo(surface: 'アイデア', source: 'idea', language: 'en', meaningZh: '想法 / 点子', meaningEn: 'idea'),
    LoanwordInfo(surface: 'アイディア', source: 'idea', language: 'en', meaningZh: '想法 / 点子', meaningEn: 'idea'),
    LoanwordInfo(surface: 'サービス', source: 'service', language: 'en', meaningZh: '服务 / 优待', meaningEn: 'service'),
    LoanwordInfo(surface: 'オフィス', source: 'office', language: 'en', meaningZh: '办公室', meaningEn: 'office'),
    LoanwordInfo(surface: 'ビジネス', source: 'business', language: 'en', meaningZh: '商务 / 业务', meaningEn: 'business'),
    LoanwordInfo(surface: 'リーダー', source: 'leader', language: 'en', meaningZh: '领导 / 组长', meaningEn: 'leader'),
    LoanwordInfo(surface: 'スタッフ', source: 'staff', language: 'en', meaningZh: '工作人员', meaningEn: 'staff'),
    LoanwordInfo(surface: 'パートナー', source: 'partner', language: 'en', meaningZh: '伙伴 / 搭档', meaningEn: 'partner'),
    LoanwordInfo(surface: 'スキル', source: 'skill', language: 'en', meaningZh: '技能', meaningEn: 'skill'),
    LoanwordInfo(surface: 'キャリア', source: 'career', language: 'en', meaningZh: '职业生涯 / 资历', meaningEn: 'career'),
    LoanwordInfo(surface: 'トラブル', source: 'trouble', language: 'en', meaningZh: '纠纷 / 故障', meaningEn: 'trouble'),
    LoanwordInfo(surface: 'ストレス', source: 'stress', language: 'en', meaningZh: '压力', meaningEn: 'stress'),
    LoanwordInfo(surface: 'チャンス', source: 'chance', language: 'en', meaningZh: '机会', meaningEn: 'chance'),
    LoanwordInfo(surface: 'ミス', source: 'mistake / miss (abbr.)', language: 'en', meaningZh: '失误 / 差错', meaningEn: 'mistake'),
    LoanwordInfo(surface: 'ルール', source: 'rule', language: 'en', meaningZh: '规则', meaningEn: 'rule'),
    LoanwordInfo(surface: 'マナー', source: 'manner', language: 'en', meaningZh: '礼仪 / 规矩', meaningEn: 'manners'),

    // 交通与出行
    LoanwordInfo(surface: 'タクシー', source: 'taxi', language: 'en', meaningZh: '出租车', meaningEn: 'taxi'),
    LoanwordInfo(surface: 'バス', source: 'bus', language: 'en', meaningZh: '公共汽车', meaningEn: 'bus'),
    LoanwordInfo(surface: 'トラック', source: 'truck', language: 'en', meaningZh: '卡车', meaningEn: 'truck'),
    LoanwordInfo(surface: 'バイク', source: 'motorbike / bike', language: 'en', meaningZh: '摩托车', meaningEn: 'motorbike'),
    LoanwordInfo(surface: 'ホテル', source: 'hotel', language: 'en', meaningZh: '饭店 / 旅馆', meaningEn: 'hotel'),
    LoanwordInfo(surface: 'エレベーター', source: 'elevator', language: 'en', meaningZh: '升降电梯', meaningEn: 'elevator'),
    LoanwordInfo(surface: 'エスカレーター', source: 'escalator', language: 'en', meaningZh: '自动扶梯', meaningEn: 'escalator'),
    LoanwordInfo(surface: 'チケット', source: 'ticket', language: 'en', meaningZh: '票 / 入场券', meaningEn: 'ticket'),
    LoanwordInfo(surface: 'パスポート', source: 'passport', language: 'en', meaningZh: '护照', meaningEn: 'passport'),
    LoanwordInfo(surface: 'フロント', source: 'front desk', language: 'en', meaningZh: '前台 / 柜台', meaningEn: 'reception / front desk'),
    LoanwordInfo(surface: 'ツアー', source: 'tour', language: 'en', meaningZh: '观光旅行', meaningEn: 'tour'),
    LoanwordInfo(surface: 'ガイド', source: 'guide', language: 'en', meaningZh: '导游 / 指南', meaningEn: 'guide'),

    // 购物与商业
    LoanwordInfo(surface: 'スーパー', source: 'supermarket (abbr.)', language: 'en', meaningZh: '超级市场', meaningEn: 'supermarket'),
    LoanwordInfo(surface: 'コンビニ', source: 'convenience store (abbr.)', language: 'en', meaningZh: '便利店', meaningEn: 'convenience store'),
    LoanwordInfo(surface: 'デパート', source: 'department store (abbr.)', language: 'en', meaningZh: '百货商店', meaningEn: 'department store'),
    LoanwordInfo(surface: 'ビル', source: 'building (abbr.)', language: 'en', meaningZh: '大厦 / 大楼', meaningEn: 'building'),
    LoanwordInfo(surface: 'レストラン', source: 'restaurant (French)', language: 'fr', meaningZh: '西餐厅 / 餐馆', meaningEn: 'restaurant'),
    LoanwordInfo(surface: 'カフェ', source: 'café (French)', language: 'fr', meaningZh: '咖啡馆', meaningEn: 'café'),
    LoanwordInfo(surface: 'セール', source: 'sale', language: 'en', meaningZh: '特价大甩卖', meaningEn: 'sale'),
    LoanwordInfo(surface: 'レシート', source: 'receipt', language: 'en', meaningZh: '收据 / 小票', meaningEn: 'receipt'),
    LoanwordInfo(surface: 'カード', source: 'card', language: 'en', meaningZh: '卡片 / 银行卡', meaningEn: 'card'),
    LoanwordInfo(surface: 'キャッシュ', source: 'cash', language: 'en', meaningZh: '现金', meaningEn: 'cash'),
    LoanwordInfo(surface: 'サイズ', source: 'size', language: 'en', meaningZh: '尺寸 / 尺码', meaningEn: 'size'),
    LoanwordInfo(surface: 'カラー', source: 'color', language: 'en', meaningZh: '颜色', meaningEn: 'color'),
    LoanwordInfo(surface: 'プレゼント', source: 'present', language: 'en', meaningZh: '礼物', meaningEn: 'present / gift'),

    // 服饰与生活物品
    LoanwordInfo(surface: 'シャツ', source: 'shirt', language: 'en', meaningZh: '衬衫', meaningEn: 'shirt'),
    LoanwordInfo(surface: 'Tシャツ', source: 'T-shirt', language: 'en', meaningZh: 'T恤', meaningEn: 'T-shirt'),
    LoanwordInfo(surface: 'スカート', source: 'skirt', language: 'en', meaningZh: '裙子', meaningEn: 'skirt'),
    LoanwordInfo(surface: 'パンツ', source: 'pants', language: 'en', meaningZh: '短裤 / 内裤', meaningEn: 'pants / underwear'),
    LoanwordInfo(surface: 'ズボン', source: 'jupon (French) / trousers', language: 'fr', meaningZh: '裤子', meaningEn: 'trousers'),
    LoanwordInfo(surface: 'コート', source: 'coat', language: 'en', meaningZh: '外套 / 大衣', meaningEn: 'coat'),
    LoanwordInfo(surface: 'スーツ', source: 'suit', language: 'en', meaningZh: '西装', meaningEn: 'suit'),
    LoanwordInfo(surface: 'ネクタイ', source: 'necktie', language: 'en', meaningZh: '领带', meaningEn: 'necktie'),
    LoanwordInfo(surface: 'ドレス', source: 'dress', language: 'en', meaningZh: '礼服 / 连衣裙', meaningEn: 'dress'),
    LoanwordInfo(surface: 'シューズ', source: 'shoes', language: 'en', meaningZh: '鞋子', meaningEn: 'shoes'),
    LoanwordInfo(surface: 'ブーツ', source: 'boots', language: 'en', meaningZh: '靴子', meaningEn: 'boots'),
    LoanwordInfo(surface: 'バッグ', source: 'bag', language: 'en', meaningZh: '包 / 手提袋', meaningEn: 'bag'),
    LoanwordInfo(surface: 'ポケット', source: 'pocket', language: 'en', meaningZh: '口袋', meaningEn: 'pocket'),
    LoanwordInfo(surface: 'ボタン', source: 'botão (Portuguese)', language: 'pt', meaningZh: '纽扣 / 按钮', meaningEn: 'button'),
    LoanwordInfo(surface: 'メガネ', source: 'glasses', language: 'ja', meaningZh: '眼镜', meaningEn: 'glasses'),
    LoanwordInfo(surface: 'コンタクト', source: 'contact lenses (abbr.)', language: 'en', meaningZh: '隐形眼镜', meaningEn: 'contact lenses'),
    LoanwordInfo(surface: 'アクセサリー', source: 'accessory', language: 'en', meaningZh: '饰品 / 配饰', meaningEn: 'accessory'),
    LoanwordInfo(surface: 'タオル', source: 'towel', language: 'en', meaningZh: '毛巾', meaningEn: 'towel'),
    LoanwordInfo(surface: 'テーブル', source: 'table', language: 'en', meaningZh: '餐桌', meaningEn: 'table'),
    LoanwordInfo(surface: 'ソファ', source: 'sofa', language: 'en', meaningZh: '沙发', meaningEn: 'sofa'),
    LoanwordInfo(surface: 'ソファー', source: 'sofa', language: 'en', meaningZh: '沙发', meaningEn: 'sofa'),
    LoanwordInfo(surface: 'ベッド', source: 'bed', language: 'en', meaningZh: '床', meaningEn: 'bed'),
    LoanwordInfo(surface: 'ドア', source: 'door', language: 'en', meaningZh: '门', meaningEn: 'door'),
    LoanwordInfo(surface: 'シャワー', source: 'shower', language: 'en', meaningZh: '淋浴', meaningEn: 'shower'),
    LoanwordInfo(surface: 'トイレ', source: 'toilet (French: toilette)', language: 'fr', meaningZh: '洗手间 / 厕所', meaningEn: 'toilet / restroom'),
    LoanwordInfo(surface: 'テレビ', source: 'television (abbr.)', language: 'en', meaningZh: '电视机', meaningEn: 'television / TV'),
    LoanwordInfo(surface: 'ラジオ', source: 'radio', language: 'en', meaningZh: '收音机 / 广播', meaningEn: 'radio'),
    LoanwordInfo(surface: 'カメラ', source: 'camera', language: 'en', meaningZh: '相机', meaningEn: 'camera'),

    // 文娱与体育
    LoanwordInfo(surface: 'スポーツ', source: 'sports', language: 'en', meaningZh: '体育 / 运动', meaningEn: 'sports'),
    LoanwordInfo(surface: 'サッカー', source: 'soccer', language: 'en', meaningZh: '足球', meaningEn: 'soccer / football'),
    LoanwordInfo(surface: 'テニス', source: 'tennis', language: 'en', meaningZh: '网球', meaningEn: 'tennis'),
    LoanwordInfo(surface: 'スキー', source: 'ski (Norwegian)', language: 'no', meaningZh: '滑雪', meaningEn: 'skiing'),
    LoanwordInfo(surface: 'スケート', source: 'skate', language: 'en', meaningZh: '滑冰', meaningEn: 'skating'),
    LoanwordInfo(surface: 'ゴルフ', source: 'golf', language: 'en', meaningZh: '高尔夫', meaningEn: 'golf'),
    LoanwordInfo(surface: 'プール', source: 'pool', language: 'en', meaningZh: '游泳池', meaningEn: 'swimming pool'),
    LoanwordInfo(surface: 'ゲーム', source: 'game', language: 'en', meaningZh: '游戏', meaningEn: 'game'),
    LoanwordInfo(surface: 'アニメ', source: 'animation (abbr.)', language: 'en', meaningZh: '动画', meaningEn: 'anime / animation'),
    LoanwordInfo(surface: 'ドラマ', source: 'drama', language: 'en', meaningZh: '电视剧', meaningEn: 'TV drama'),
    LoanwordInfo(surface: 'ニュース', source: 'news', language: 'en', meaningZh: '新闻', meaningEn: 'news'),
    LoanwordInfo(surface: 'ギター', source: 'guitar', language: 'en', meaningZh: '吉他', meaningEn: 'guitar'),
    LoanwordInfo(surface: 'ピアノ', source: 'piano (Italian)', language: 'it', meaningZh: '钢琴', meaningEn: 'piano'),
    LoanwordInfo(surface: 'コンサート', source: 'concert', language: 'en', meaningZh: '音乐会 / 演唱会', meaningEn: 'concert'),
    LoanwordInfo(surface: 'カラオケ', source: 'karaoke (kara空 + orchestra)', language: 'ja', meaningZh: '卡拉OK', meaningEn: 'karaoke'),
    LoanwordInfo(surface: 'デザイン', source: 'design', language: 'en', meaningZh: '设计', meaningEn: 'design'),
    LoanwordInfo(surface: 'スタイル', source: 'style', language: 'en', meaningZh: '风格 / 体型', meaningEn: 'style'),
    LoanwordInfo(surface: 'ファッション', source: 'fashion', language: 'en', meaningZh: '时尚 / 时装', meaningEn: 'fashion'),
    LoanwordInfo(surface: 'イベント', source: 'event', language: 'en', meaningZh: '活动 / 盛事', meaningEn: 'event'),
    LoanwordInfo(surface: 'パーティー', source: 'party', language: 'en', meaningZh: '派对 / 聚会', meaningEn: 'party'),
    LoanwordInfo(surface: 'クリスマス', source: 'Christmas', language: 'en', meaningZh: '圣诞节', meaningEn: 'Christmas'),
  ];

  final map = <String, LoanwordInfo>{};
  for (final item in list) {
    map[item.surface] = item;
  }
  return map;
}
