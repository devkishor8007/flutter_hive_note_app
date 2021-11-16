# Hive Note App in Flutter

Using Hive to store the data as a Offline.
Hive is a lightweight and blazing fast key-value database written in pure Dart.

## Getting Started

### Before clone the repo, you must have flutter on your device.
 
    Fork this repo 
    $ git clone https://github.com/<username_github>/flutter_hive_note_app


### Remember to update all the packages...
    $ flutter clean
    $ flutter pub get
    
### Run the app
    f5 or click on RUN

##

### Pacakge That I use in this project
    hive
    hive_flutter
    path_provider

### Usage

#### You can use Hive just like a map. It is not necessary to await Futures.

    var box = Hive.box('myBox');

    box.put('name', 'David');

    var name = box.get('name');

    print('Name: $name');
    
## Hive Note App Final Output

<p float="left">
<img src="https://user-images.githubusercontent.com/73419211/142026443-2fa91191-fa8d-4cec-bfce-f76f59ef7439.jpg" height="500" width="280">
<img src="https://user-images.githubusercontent.com/73419211/142026448-32dc3124-95c5-4108-bce3-79237dcf3aa2.jpg" height="500" width="280"> 
<img src="https://user-images.githubusercontent.com/73419211/142026439-f461e5ef-86ae-4d92-ab1d-e0ff094a92f1.jpg" height="500" width="280">
<img src="https://user-images.githubusercontent.com/73419211/142026428-f786efc9-de8c-4906-b1fb-455ae0bea782.jpg" height="500" width="280">
<img src="https://user-images.githubusercontent.com/73419211/142026460-bc3da3d8-c886-439b-b395-9098cd7334db.jpg" height="500" width="280">
<img src="https://user-images.githubusercontent.com/73419211/142027272-f51c29d0-ae5a-4b8b-b734-16cd7f19b5d9.jpg" height="500" width="280">
</p>

