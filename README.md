# MiyaAni

<p align="center">Miya ❤️ ni</p>

## development

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
