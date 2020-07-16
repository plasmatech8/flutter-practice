# Flutter Tutorial for Beginners

[Flutter Tutorial for Beginners](https://www.youtube.com/watch?v=1ukSR1GRtMU&list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ) by The Net Ninja on YouTube.

- [Flutter Tutorial for Beginners](#flutter-tutorial-for-beginners)
  - [Widgets](#widgets)
  - [Simple app](#simple-app)
  - [Colors](#colors)
  - [Text Styles](#text-styles)
  - [Fonts](#fonts)
  - [Stateless Widgets & Hot Reload](#stateless-widgets--hot-reload)
  - [Images](#images)
  - [Buttons and Icons](#buttons-and-icons)
  - [Containers and Padding](#containers-and-padding)
  - [Rows and Columns](#rows-and-columns)
  - [Flutter Outline and Shortcuts](#flutter-outline-and-shortcuts)

vscode setup (see [here](https://www.youtube.com/watch?v=VHhksMa2Ffg)):
* Settings: `Dart: Preview Flutter Ui Guides`
* Ext: `Pubspec Assist` (use prompt to obtain dependencies/packages)
* Ext: `Awesome Flutter Snippets`
* Ext: `bloc`
* Ext: `Advanced New File` (ctrl+alt+n to create new folder/file)
* To make guides continuous: `editor.lineHeight: 17` (instead of 0)
* To remove indentation guides: `"[dart]": {"editor.renderIndentGuides": false,},`

## Widgets

There are many widgets and each widget can be configured using properties.

e.g:
* Text Widget
  * style
  * textAlign
  * overflow
  * maxLines
  * ...etc
* Button Widget
  * color
  * elevation
  * disabledColor
  * enabled
  * ...etc
* Row Widget
* Column Widget
* Image Widget

## Simple app

```dart
void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my first app'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Hello ninjas!'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('click'),
        ),
      ),
    ));
```

## Colors

We can add colors using the `Colors` object:
```dart
Colors.red[600]
```
We can also set strengths for the colors using the square brackets.

## Text Styles

We style text using `TextStyle` object
```dart
child: Text(
  'Hello ninjas!!!',
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
```

## Fonts

If we want to add a custom font (not in library) we can downlaod a font from
[Google Fonts](https://fonts.google.com/), and save to the project (i.e. fonts
directory).

We can then add it to the pubspec.yaml file. Then use `fontFamily: 'My Font',`.

## Stateless Widgets & Hot Reload

We need to create a stateless widget widget with a `build` function in order to
use Hot-Reloading (not just a MaterialApp widget).

```dart
void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my first app'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Center(
        child: AssetImage('assets/space.png'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('click'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
```

## Images

We can use either `NetworkImages('URL')` or
`AssetImage(assets/image.png)`.

If using assets, you need to add assets to the pubspec.yaml file.

```dart
child: Image(image: NetworkImage('https://www.publicdomainpictures.net/pictures/40000/velka/spatiul-cosmic.jpg')),
child: Image(image: AssetImage('assets/space.png')),

// Shortcuts
Image.network('https://www.publicdomainpictures.net/pictures/40000/velka/spatiul-cosmic.jpg')
Image.asset('assets/space.png')
```

## Buttons and Icons

```dart
Icon(
  Icons.airport_shuttle,
  color: Colors.lightBlue,
  size: 50,
)

// Button with shadow
RaisedButton(
  onPressed: () {
    print('you clicked me!');
  },
  child: Text('Click Me!'),
  color: Colors.lightBlue,
),

// Button without shadow
FlatButton(
  onPressed: () {
    print('you clicked me!');
  },
  child: Text('Click Me!'),
  color: Colors.lightBlue,
),

// Button with icon
RaisedButton.icon(
  onPressed: () {
    print('you clicked me!');
  },
  icon: Icon(Icons.mail),
  label: Text('Click Me!'),
  color: Colors.amber,
),

// Icon that is a button
IconButton(
  onPressed: () {
    print('you clicked me!');
  },
  icon: Icon(Icons.mail),
  color: Colors.amber,
),
```

## Containers and Padding

**Containers**:
* Fills maxmimum area when contains no children.
* Fills minimum area when contains children.
* We can add padding using `padding: EdgeInsets.all(20)` (can customize)
* We can also add margin `margin: EdgeInsets.all(2)` (can customize)

If we only want padding, we can use the `Padding` class.

## Rows and Columns

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Horizontal space
  crossAxisAlignment: CrossAxisAlignment.end, // Vertical alignment in row
  children: <Widget>[
    // ...
  ],
)
Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Horizontal space
  crossAxisAlignment: CrossAxisAlignment.end, // Vertical alignment in row
  children: <Widget>[
    // ...
  ],
)
```
Columns and rows are basically the same except the main and cross axis
directions are swapped.

Columns are probably most useful for most apps.

We can also use nested rows/columns. Note: that columns/rows will fill maximium
distance.

## Flutter Outline and Shortcuts

If you click on a class, a light-bulb will pop up which provides quick-actions.


