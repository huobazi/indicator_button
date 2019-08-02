## Example

[example application](https://github.com/huobazi/indicator_button/tree/master/example) for [indicator_button](https://github.com/huobazi/indicator_button) .

![Demo 3](https://github.com/huobazi/indicator_button/blob/master/demo3.gif?raw=true)

## Getting Started

- Add dependency to your pubspec.yaml
```yaml
dependencies:
  indicator_button: ^1.0.1
```

- Install packages

```bash
flutter pub get
```

- Import it
```dart
import 'package:indicator_button/indicator_button.dart';
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
