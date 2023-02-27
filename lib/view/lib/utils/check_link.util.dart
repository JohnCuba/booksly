final uriRegexp = RegExp(r'(.+\..+)');

bool checkLink(String link) {
  return uriRegexp.hasMatch(link);
}