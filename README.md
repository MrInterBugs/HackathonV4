# Hackathon V4
### Education Support App For Online Learning During COVID-19
Our project submission for Royal Hackaway 2021. 

We have created an app for teachers, parents and pupils designed to help track, register and support younger year pupils.
Written using the flutter framework (NEVER AGAIN) as well as firebase we have attempted to make a system to be used alongside 
zoom, teams, google classroom or any other system.

It allows teachers to push notifications to pupils phones for time management with emoji support for younger users who's reading may not be the best.

Pupils have a muh simpler UI which allows for attendance tacking and raising their hand. This could easily be extended to a messaging system.

Parents have a similar view to teachers with some pupil features such as messaging teachers and being able to see their childs timetable.
## Getting Started
### Prerequisites
Install the flutter sdk from [here](https://flutter.dev/docs/get-started/install).

Then we can import the project into android studio/IntelliJ IDEA's with the [flutter plugin](https://plugins.jetbrains.com/plugin/9212-flutter).
If you do not have an android testing device you should then create an AVD device which can be used instead.
### Installing
To run this you will need to creat your own google-services.json from firebase, this can be done following this [link](https://flutter.dev/docs/deployment/android#create-a-keystore).

Then it should be as simple as a click and launch. If you are having issues run
```flutter clean && flutter get``` which should then allow the project to run.
##Code Snippets
If a database table gets new data push a notification to the user:
```java
if (snapshot.hasData) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: 'Pupil has just registered for you class.',
          body: ('test')
      ),
    );
    }
```
Used to get user information from a Google OAuth login.
```java
name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');

    return '$user';
```

## Authors
* **Bruce Lay** - [brucelay](https://github.com/brucelay)
* **Aedan Lawrence** - [MrInterBugs](https://github.com/MrInterBugs)
* **Charlie** - [chazzox](https://github.com/chazzox)
* **Snow** - [Bchilled](https://github.com/Bchilled)

## Acknowledgements
* [**Flutter**](https://flutter.dev/docs)
* [**Awesome_Notifications**](https://github.com/rafaelsetragni/awesome_notifications)
* [**Firebase**](https://firebase.google.com/)
