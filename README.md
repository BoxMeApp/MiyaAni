# MiyaAni

<p align="center">Miya ❤️ 你</p>

## features

- 支持 bt 下载
- 播放器
- 记录功能

## development

### workflow

- 提出需求： 用 Excalidraw 画图，然后放到 [working](docs/working) 当中
- 大概的要求写入 Changelog.md
- 主题讨论放到 Issues 里面
- 开启分支实现功能
  - 先实现 mini 功能，用方块代替
  - 建立相应的方程放到 PR 里面
  - 用 MP4/Gif 录制功能 (OBS studio 录制 + clipchamp 编辑压缩) 放到 PR 里面
- 主要功能应该有 preview，边界条件则需要测试

### rename

采用 [rename_app](https://pub.dev/packages/rename_app) 加入到 dev

```bash
flutter pub add dev:rename_app
```

设置 app 名字：

```bash
dart run rename_app:main all="MiyaAni"
```

### proxy problem

如果遇到网络问题，可以尝试设置环境变量： [教程](https://docs.flutter.cn/community/china/)

### UI model

对于 UI 建模，采用状态空间方程描述：

```math
\begin{cases}
\dot s = f(s) \\
y = A \cdot s
\end{cases}
```

$`f`$ 是逻辑，$`y`$ 是 UI 描述，详细的案例见 [cms](https://github.com/BoxMeApp/cms)。$`y`$ 采用 [flutter_bloc](https://pub.dev/packages/flutter_bloc)

约定用 S 表示状态，A 表示事件或者动作，cms 表示状态转移函数

eg. TODO

### UI compose

经常需要 UI 组合，比如字体居中，修饰大小等，避免深入的嵌套，采用 decorator 模式，见 [infix](https://github.com/dzylikecode/infix)

eg.

```dart
Center(
	child: Padding(
		padding: .all(16),
		child: Card(
			child: Text('Hello')
		)
	)
),

// can be written as
via((Widget c) => Center(child: c))
.via((c) => Padding(padding: .all(16), child: c,))
.via((c) => Card(elevation: 4, child: c,))
> Text('Hello')
```

### tools

- [Flutter Widget Previewer](https://docs.flutter.dev/tools/widget-previewer): 方便预览 widget
- [Flutter Property Editor](https://docs.flutter.dev/tools/property-editor): 属性编辑
- [inspector](https://docs.flutter.dev/tools/devtools/inspector): 查看 UI 实际布局
