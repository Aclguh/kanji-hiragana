/// 四字熟语 (四字成语) 条目。
class YojijukugoEntry {
  /// 汉字原词 (如 '一期一会')。
  final String kanji;

  /// 规范读音 (平假名, 如 'いちごいちえ')。
  final String reading;

  /// 罗马音 (如 'ichigoichie')。
  final String romaji;

  /// 中文释义。
  final String meaningZh;

  /// 英文释义。
  final String meaningEn;

  const YojijukugoEntry({
    required this.kanji,
    required this.reading,
    required this.romaji,
    required this.meaningZh,
    required this.meaningEn,
  });
}

/// 常用四字熟语离线列表。
final List<YojijukugoEntry> kYojijukugoList = _buildYojijukugoList();

/// 单汉字到相关四字熟语的反向索引表 (如 '日' -> [日進月歩, 一日千秋, ...])。
final Map<String, List<YojijukugoEntry>> kYojijukugoByKanji = _buildYojijukugoIndex();

List<YojijukugoEntry> getYojijukugoForKanji(String kanji) {
  return kYojijukugoByKanji[kanji] ?? const [];
}

Map<String, List<YojijukugoEntry>> _buildYojijukugoIndex() {
  final map = <String, List<YojijukugoEntry>>{};
  for (final item in kYojijukugoList) {
    for (var i = 0; i < item.kanji.length; i++) {
      final char = item.kanji[i];
      (map[char] ??= []).add(item);
    }
  }
  return map;
}

List<YojijukugoEntry> _buildYojijukugoList() {
  return const [
    YojijukugoEntry(
      kanji: '一期一会',
      reading: 'いちごいちえ',
      romaji: 'ichigoichie',
      meaningZh: '一生仅有一次的相会，当珍惜相遇',
      meaningEn: 'Once-in-a-lifetime encounter',
    ),
    YojijukugoEntry(
      kanji: '一石二鳥',
      reading: 'いっせきにちょう',
      romaji: 'issekinichou',
      meaningZh: '一举两得，一石二鸟',
      meaningEn: 'Killing two birds with one stone',
    ),
    YojijukugoEntry(
      kanji: '以心伝心',
      reading: 'いしんでんしん',
      romaji: 'ishindenshin',
      meaningZh: '心领神会，彼此心意相通',
      meaningEn: 'Telepathy / tacit understanding',
    ),
    YojijukugoEntry(
      kanji: '自業自得',
      reading: 'じごうじとく',
      romaji: 'jigoujitoku',
      meaningZh: '自作自受，因果报应',
      meaningEn: 'Reaping what you sow / poetic justice',
    ),
    YojijukugoEntry(
      kanji: '十人十色',
      reading: 'じゅうにんといろ',
      romaji: 'juunintoiro',
      meaningZh: '十人十色，各有所好',
      meaningEn: 'Different strokes for different folks',
    ),
    YojijukugoEntry(
      kanji: '臨機応変',
      reading: 'りんきおうへん',
      romaji: 'rinkiouhen',
      meaningZh: '随机应变，视情况调整',
      meaningEn: 'Adapting to circumstances',
    ),
    YojijukugoEntry(
      kanji: '日進月歩',
      reading: 'にっしんげっぽ',
      romaji: 'nisshingeppo',
      meaningZh: '日新月异，进步飞速',
      meaningEn: 'Rapid and steady progress',
    ),
    YojijukugoEntry(
      kanji: '一日千秋',
      reading: 'いちじつせんしゅう',
      romaji: 'ichijitsusenshuu',
      meaningZh: '一日三秋，度日如年',
      meaningEn: 'Waiting impatiently / a day feels like years',
    ),
    YojijukugoEntry(
      kanji: '起死回生',
      reading: 'きしかいせい',
      romaji: 'kishikaisei',
      meaningZh: '绝处逢生，起死回生',
      meaningEn: 'Revival from despair / miraculous turnaround',
    ),
    YojijukugoEntry(
      kanji: '絶体絶命',
      reading: 'ぜったいぜつめい',
      romaji: 'zettaizetsumei',
      meaningZh: '危在旦夕，穷途末路',
      meaningEn: 'Desperate situation / between rock and hard place',
    ),
    YojijukugoEntry(
      kanji: '喜怒哀楽',
      reading: 'きどあいらく',
      romaji: 'kidoairaku',
      meaningZh: '喜怒哀乐，人间百感',
      meaningEn: 'Human emotions (joy, anger, grief, pleasure)',
    ),
    YojijukugoEntry(
      kanji: '三日坊主',
      reading: 'みっかぼうず',
      romaji: 'mikkabouzu',
      meaningZh: '三天打鱼两天晒网，缺乏恒心',
      meaningEn: 'Giving up quickly / short-lived resolve',
    ),
    YojijukugoEntry(
      kanji: '自画自賛',
      reading: 'じがじさん',
      romaji: 'jigajisan',
      meaningZh: '王婆卖瓜，自吹自擂',
      meaningEn: 'Singing one\'s own praises',
    ),
    YojijukugoEntry(
      kanji: '試行錯誤',
      reading: 'しこうさくご',
      romaji: 'shikousakugo',
      meaningZh: '摸索试错，反复尝试',
      meaningEn: 'Trial and error',
    ),
    YojijukugoEntry(
      kanji: '切磋琢磨',
      reading: 'せっさたくま',
      romaji: 'sessatakuma',
      meaningZh: '互相切磋，共同进步',
      meaningEn: 'Mutual polishing / diligent self-improvement',
    ),
    YojijukugoEntry(
      kanji: '順風満帆',
      reading: 'じゅんぷうまんぱん',
      romaji: 'jumpuumanpan',
      meaningZh: '一帆风顺，万事顺遂',
      meaningEn: 'Smooth sailing / proceeding without a hitch',
    ),
    YojijukugoEntry(
      kanji: '大器晩成',
      reading: 'たいきばんせい',
      romaji: 'taikibansei',
      meaningZh: '大器晚成，厚积薄发',
      meaningEn: 'Late bloomer',
    ),
    YojijukugoEntry(
      kanji: '千載一遇',
      reading: 'せんざいいちぐう',
      romaji: 'senzaiichiguu',
      meaningZh: '千载难逢的良机',
      meaningEn: 'Once-in-a-lifetime opportunity',
    ),
    YojijukugoEntry(
      kanji: '晴耕雨読',
      reading: 'せいこううどく',
      romaji: 'seikouudoku',
      meaningZh: '晴耕雨读，闲适田园生活',
      meaningEn: 'Living in quiet retirement in the countryside',
    ),
    YojijukugoEntry(
      kanji: '百発百中',
      reading: 'ひゃっぱつひゃくちゅう',
      romaji: 'hyappatsuhyakuchuu',
      meaningZh: '百发百中，料事如神',
      meaningEn: 'Hitting the mark every time',
    ),
    YojijukugoEntry(
      kanji: '本末転倒',
      reading: 'ほんまつてんとう',
      romaji: 'hommatsutentou',
      meaningZh: '本末倒置，颠倒主次',
      meaningEn: 'Putting the cart before the horse',
    ),
    YojijukugoEntry(
      kanji: '油断大敵',
      reading: 'ゆだんたいてき',
      romaji: 'yudantaiteki',
      meaningZh: '大意失荆州，麻痹大意是劲敌',
      meaningEn: 'Carelessness is the greatest enemy',
    ),
    YojijukugoEntry(
      kanji: '一喜一憂',
      reading: 'いっきいちゆう',
      romaji: 'ikkiichiyuu',
      meaningZh: '忽喜忽忧，情绪随境而迁',
      meaningEn: 'Swinging between joy and anxiety',
    ),
    YojijukugoEntry(
      kanji: '一心不乱',
      reading: 'いっしんふらん',
      romaji: 'isshinfuran',
      meaningZh: '全神贯注，心无旁骛',
      meaningEn: 'With undivided attention / wholeheartedly',
    ),
    YojijukugoEntry(
      kanji: '一長一短',
      reading: 'いっちょういったん',
      romaji: 'icchouittan',
      meaningZh: '各有优劣，有利有弊',
      meaningEn: 'Having both pros and cons',
    ),
    YojijukugoEntry(
      kanji: '意気投合',
      reading: 'いきとうごう',
      romaji: 'ikitougou',
      meaningZh: '情投意合，志趣相投',
      meaningEn: 'Hitting it off / congenial spirits',
    ),
    YojijukugoEntry(
      kanji: '四面楚歌',
      reading: 'しめんそか',
      romaji: 'shimensoka',
      meaningZh: '四面楚歌，孤立无援',
      meaningEn: 'Surrounded by enemies / isolated',
    ),
    YojijukugoEntry(
      kanji: '単刀直入',
      reading: 'たんとうちょくにゅう',
      romaji: 'tantouchokunyuu',
      meaningZh: '开门见山，直奔主题',
      meaningEn: 'Straight to the point',
    ),
    YojijukugoEntry(
      kanji: '八方美人',
      reading: 'はっぽうびじん',
      romaji: 'happoubijin',
      meaningZh: '八面玲珑的人，老好人',
      meaningEn: 'Trying to please everybody',
    ),
    YojijukugoEntry(
      kanji: '半信半疑',
      reading: 'はんしんはんぎ',
      romaji: 'hanshinhangi',
      meaningZh: '半信半疑，犹豫不决',
      meaningEn: 'Half in doubt / skeptical',
    ),
    YojijukugoEntry(
      kanji: '誠心誠意',
      reading: 'せいしんせいい',
      romaji: 'seishinseii',
      meaningZh: '全心全意，竭诚以待',
      meaningEn: 'With all sincerity / wholeheartedly',
    ),
    YojijukugoEntry(
      kanji: '異口同音',
      reading: 'いくどうおん',
      romaji: 'ikudouon',
      meaningZh: '异口同声，不约而同',
      meaningEn: 'With one voice / unanimously',
    ),
    YojijukugoEntry(
      kanji: '空前絶後',
      reading: 'くうぜんぜつご',
      romaji: 'kuuzenzetsugo',
      meaningZh: '空前绝后，举世无双',
      meaningEn: 'Unprecedented and never to be repeated',
    ),
    YojijukugoEntry(
      kanji: '古今東西',
      reading: 'ここんとうざい',
      romaji: 'kokontouzai',
      meaningZh: '古今中外，贯穿时空',
      meaningEn: 'All times and places',
    ),
    YojijukugoEntry(
      kanji: '前代未聞',
      reading: 'ぜんだいみもん',
      romaji: 'zendaimimon',
      meaningZh: '前所未闻，破天荒',
      meaningEn: 'Unheard-of / record-breaking',
    ),
    YojijukugoEntry(
      kanji: '無我夢中',
      reading: 'むがむちゅう',
      romaji: 'mugamuchuu',
      meaningZh: '如痴如醉，浑然忘我',
      meaningEn: 'Absorbed in / completely carried away',
    ),
    YojijukugoEntry(
      kanji: '弱肉強食',
      reading: 'じゃくにくきょうしょく',
      romaji: 'jakunikukyoushoku',
      meaningZh: '弱肉强食，适者生存',
      meaningEn: 'Survival of the fittest / law of the jungle',
    ),
    YojijukugoEntry(
      kanji: '電光石火',
      reading: 'でんこうせっか',
      romaji: 'denkousekka',
      meaningZh: '电光石火，迅雷不及掩耳',
      meaningEn: 'Lightning speed',
    ),
    YojijukugoEntry(
      kanji: '悠々自適',
      reading: 'ゆうゆうじてき',
      romaji: 'yuuyuujiteki',
      meaningZh: '悠闲自得，自得其乐',
      meaningEn: 'Living leisurely and comfortably',
    ),
    YojijukugoEntry(
      kanji: '森羅万象',
      reading: 'しんらばんしょう',
      romaji: 'shinrabanshou',
      meaningZh: '森罗万象，宇宙万物',
      meaningEn: 'All things in the universe',
    ),
    YojijukugoEntry(
      kanji: '大同小異',
      reading: 'だいどうしょうい',
      romaji: 'daidoushoui',
      meaningZh: '大同小异，基本一致',
      meaningEn: 'Essentially the same / minor differences',
    ),
    YojijukugoEntry(
      kanji: '天真爛漫',
      reading: 'てんしんらんまん',
      romaji: 'tenshinranman',
      meaningZh: '天真烂漫，率直纯洁',
      meaningEn: 'Naive and innocent / free and natural',
    ),
    YojijukugoEntry(
      kanji: '画竜点睛',
      reading: 'がりょうてんせい',
      romaji: 'garyoutensei',
      meaningZh: '画龙点睛，关键一笔',
      meaningEn: 'Adding the final finishing touch',
    ),
  ];
}
