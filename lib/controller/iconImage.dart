

// convert the icon code to link to get icon image
String getIconUrl(String icon){
  icon = icon[0]+icon[1]+"d";
  return "https://openweathermap.org/img/w/"+icon+".png";
}