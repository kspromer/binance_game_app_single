part of string_extension;


extension StringExtension on String {

  PreferredSizeWidget get appbar => AppBar(
    bottom: AppBar(
      automaticallyImplyLeading: false,
      title: Text(this),
    ),
  );

}
