import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:tiktokclone/tiktok_icons.dart';

class ActionsToolbar extends StatelessWidget {
  // Full dimensions of an action container
  static const double actionWidgetSize = 60.0;

  // The size of the profile image in the follow Action
  static const double profileImageSize = 50.0;

  // The size of the plus icon under the profile image in follow action
  static const double plusIconSize = 20.0;

  // Space between buttons
  static const double actionWidgetMargin = 12.0;

  // Temp profile pic URL
  static const String profilePic =
      'https://scontent-syd2-1.xx.fbcdn.net/v/t31.0-1/p200x200/23592004_543046272710670_4979707003685905568_o.jpg?_nc_cat=109&_nc_sid=7206a8&_nc_ohc=aaRxAHXuwFsAX_AOasw&_nc_ht=scontent-syd2-1.xx&_nc_tp=6&oh=8095eede8df8c47c3bea236b620b639e&oe=5F3F3AC7';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      //color: Colors.red[300], // visual
      child: Column(
          mainAxisSize: MainAxisSize.min, // Use min space and expand upwards
          children: <Widget>[
            _getFollowAction(),
            _getSocialAction(title: '3.2m', icon: TikTokIcons.heart),
            _getSocialAction(title: '16.4k', icon: TikTokIcons.chat_bubble),
            _getSocialAction(
                title: 'Share', icon: TikTokIcons.reply, iconSize: 30),
            _getMusicPlayerAction(),
          ]),
    );
  }

  Widget _getSocialAction({String title, IconData icon, double iconSize = 35}) {
    return Container(
      width: actionWidgetSize,
      height: actionWidgetSize,
      //color: Colors.blue[300], // Visual
      margin: EdgeInsets.only(bottom: actionWidgetMargin),
      child: Column(children: <Widget>[
        Icon(icon, size: iconSize, color: Colors.grey[300]),
        Padding(
          padding: EdgeInsets.only(top: 2),
          child: Text(title, style: TextStyle(fontSize: 12)),
        ),
      ]),
    );
  }

  Widget _getFollowAction() {
    return Container(
      width: actionWidgetSize,
      height: actionWidgetSize,
      //color: Colors.blue[300], // Visual
      margin: EdgeInsets.only(bottom: actionWidgetMargin),
      child: Stack(
        children: <Widget>[
          _getProfilePicture(),
          _getPlusIcon(),
        ],
      ),
    );
  }

  Widget _getProfilePicture() {
    return Center(
      child: Container(
        height: profileImageSize,
        width: profileImageSize,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: CachedNetworkImage(
          imageUrl: profilePic,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider)),
          ),
        ),
      ),
    );
  }

  Widget _getPlusIcon() {
    return Container(
      alignment: Alignment(0, 1),
      child: Container(
        width: plusIconSize,
        height: plusIconSize,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 43, 84),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.add, color: Colors.white, size: 20),
      ),
    );
  }

  LinearGradient get musicGradient => LinearGradient(
        colors: [
          Colors.grey[900],
          Colors.grey[900],
          Colors.grey[900],
          Colors.grey[800],
        ],
        stops: [0, 0.4, 0.6, 1],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      );

  Widget _getMusicPlayerAction() {
    return Container(
      width: actionWidgetSize,
      height: actionWidgetSize,
      //color: Colors.blue[300], // Visual
      margin: EdgeInsets.only(bottom: actionWidgetMargin),
      child: Container(
        padding: EdgeInsets.all(11),
        height: profileImageSize,
        width: profileImageSize,
        decoration: BoxDecoration(
          gradient: musicGradient,
          shape: BoxShape.circle,
        ),
        child: CachedNetworkImage(
          imageUrl: profilePic,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider)),
          ),
        ),
      ),
    );
  }
}
