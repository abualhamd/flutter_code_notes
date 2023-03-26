///This code defines an extension named ValidGdriveLink on String data type, which adds a function
/// named getValidGDriveLink to the String class. The function takes a string gDriveLink as input,
/// and it extracts the fileId component from the link and constructs a new link with the fileId parameter
/// that is compatible with the Google Drive API "https://drive.google.com/uc?export=view&id=[fileId]".
/// It then returns the new link as a String. The regular expression used in this code matches the string pattern
/// between the strings "file/d/" and "/" in the input gDriveLink string in order to extract the file ID.
/// The function use the non-null assertion operator ! to tell the compiler that the `firstMatch
extension ValidGdriveLink on String{
  static String getValidGDriveLink(String gDriveLink) {
    RegExp exp = RegExp(r'file/d/(.*?)/');
    String id = exp.firstMatch(gDriveLink)!.group(1)!;//TODO make it null safe
    String result = "https://drive.google.com/uc?export=view&id=$id";
    return result;
}
}