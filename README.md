# Indicator Button

A Flutter Button with indicates progress

![Pub](https://img.shields.io/pub/v/indicator_button) ![GitHub](https://img.shields.io/github/license/huobazi/indicator_button)

## Demo:

![Demo 1](https://github.com/huobazi/indicator_button/blob/master/demo1.gif?raw=true)

![Demo 2](https://github.com/huobazi/indicator_button/blob/master/demo2.gif?raw=true)

![Demo 3](https://github.com/huobazi/indicator_button/blob/master/demo3.gif?raw=true)

## Getting Started

- Add dependency to your pubspec.yaml
```yaml
dependencies:
  indicator_button: ^1.0.0
```

- Install packages

```bash
flutter pub get
```

- Add indicator to your widget tree
```dart
  int _targetUserId = 123;
  List<int> _followingUserIdList = [123];

  Widget _createFollowButton() {
    var followed = _followingUserIdList.contains(_targetUserId);
    var buttonText = followed ? 'Following' : ' +  Follow';
    var buttonBackgroundColor = followed ? Colors.white30 : Colors.white;
    var borderColor = followed ? Colors.grey : Colors.blue;
    var textColor = followed ? Colors.grey : Colors.blue;

    var button = IndicatorButton(
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
        await Future.delayed(new Duration(milliseconds: 2000), () {
          setState(() {
            if (followed) {
              _followingUserIdList.remove(_targetUserId);
            } else {
              _followingUserIdList.add(_targetUserId);
            }
          });
        });
      },
    );

    return Container(
      width: 130.0,
      height: 32.0,
      child: button,
    );
  }
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

See the [CHANGELOGS.md](https://github.com/huobazi/indicator_button/blob/master/CHANGELOG.md).


## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/huobazi/indicator_button/blob/master/LICENSE) file for details


