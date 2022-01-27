part of components;

class Global{

  static String getMoneySymbol(String code){
    switch(code){
      case "IN": return "\u20B9";
      case "EN": return "\$";
      case "EURO": return "\ue23c";
      default: return "\u20B9";
    }
  }

}