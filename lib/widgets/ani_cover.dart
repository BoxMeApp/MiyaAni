import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:subject_repository/subject_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AniCover extends StatelessWidget {
  final Subject content;

  const AniCover({super.key, required this.content});

  @Preview(name: 'Example AniCover', size: Size(200, 300))
  factory AniCover.$example() {
    return AniCover(
      content: Subject(
        id: 500313,
        nameJa: '魔法少女ララベル 海が呼ぶ夏休み',
        nameCn: "",
        images: {
          .small:
              "https://lain.bgm.tv/r/200/pic/cover/l/df/8e/500313_1s1iz.jpg",
          .grid: "https://lain.bgm.tv/r/100/pic/cover/l/df/8e/500313_1s1iz.jpg",
          .large: "https://lain.bgm.tv/pic/cover/l/df/8e/500313_1s1iz.jpg",
          .medium:
              "https://lain.bgm.tv/r/800/pic/cover/l/df/8e/500313_1s1iz.jpg",
          .common:
              "https://lain.bgm.tv/r/400/pic/cover/l/df/8e/500313_1s1iz.jpg",
        },
        summary:
            "1980年7月12日、「東映まんがまつり」内で上映、\r\n併映は『白雪姫』『ゲゲゲの鬼太郎（第2作）』『電子戦隊デンジマン』。\r\n『花の子ルンルン こんにちわ桜の国』に次ぐ、「東映アニメーション魔女っ子アニメシリーズ」の劇場用新作第2弾。しかし『ルンルン』はテレビ版が終了した後の上映だったので、テレビ版が放送中に上映されたのは本作がシリーズ初。本作も『ルンルン』同様、映画用オープニングとエンディングはテレビ版のものを使用、『海が呼ぶ夏休み』もサブタイトル的扱いとなっている。\r\n本作は番外編的な構成となった『ルンルン』の劇場用作品とは異なり、テレビ版の同様のストーリー進行となる。海が舞台ということもあって、テレビ版では登場しなかったララベル・テコ・トコの水着姿が見られる。また『ルンルン』の劇場用作品では「魔女っ子の定番」の一つである京都をストーリーの後半に登場させたのに対し、本作では同じく「魔女っ子の定番」の一つである「海の少年」を登場させている。\r\n本作は海が舞台のため、レギュラー的キャラクターのうち、咲花小学校の先生や生徒（花園先生、つぼみ、杉太郎ほか）、そして街の人たち（椿兄弟、みのる、和尚ほか）は全く登場しない。\r\nシナリオ段階では、ララベルが汽車の中でいきなり水着になったり、テコが珊瑚に服を破かれるなどといった、お色気シーンが用意されていた。\r\n2005年11月30日にコロムビアミュージックエンターテインメントから発売されたDVD-BOX「魔法少女ララベル DVD-BOX 1」に、映像特典として収録されている。",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: content.images[ImageType.small]!,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Row(
        children: [
          const Icon(Icons.error),
          Expanded(child: Text(error.toString())),
        ],
      ),
      fit: .cover,
    );
  }
}
