# Indicator Button

A Flutter Button with indicates progress


## Demo:

![Demo 1](/demo1.gif?raw=true)

![Demo 2](/demo2.gif?raw=true)

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.



- Add dependency to your pubspec.yaml
```yaml
dependencies:
  indicator_button: ^0.0.1
```

- Install packages

```bash
flutter pub get
```

- Add indicator to your widget tree
```dart
  var followed = _followingUserIdList.contains(user.id);
  var buttonText = followed ? '已关注' : '关注 TA';
  var buttonBackgroundColor = followed ? Colors.white30 : Colors.white;
  var borderColor = followed ? Colors.grey : Colors.blue;
  var textColor = followed ? Colors.grey : Colors.blue;

  button = IndicatorButton(
    backgroundColor: buttonBackgroundColor,
    progressColor: textColor,
    borderColor: borderColor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.remove_red_eye,
          size: 20.0,
          color: textColor,
        ),
        Text(
          buttonText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            color: textColor,
          ),
        ),
      ],
    ),
    onPressed: () async {
      if (followed) {
        await model.unFollow(userId: user.id);
      } else {
        await model.follow(userId: user.id);
      }
    },
  );
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Contributors

See the [Contributors List](https://github.com/huobazi/indicator_button/graphs/contributors).

## CHANGE LOG

See the [CHANGELOGS.md](/CHANGELOG.md).


## License

This project is licensed under the MIT License - see the [LICENSE](/LICENSE) file for details

