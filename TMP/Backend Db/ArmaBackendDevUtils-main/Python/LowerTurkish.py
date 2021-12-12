class LowerTurkish(str):
  CHARMAP = {
      "to_upper": {
          u"ı": u"I",
          u"i": u"İ",
      },
      "to_lower": {
          u"I": u"ı",
          u"İ": u"i",
      }
  }

  def lower(self):
      for key, value in self.CHARMAP.get("to_lower").items():
          self = self.replace(key, value)
      return self.lower()

  def upper(self):
      for key, value in self.CHARMAP.get("to_upper").items():
          self = self.replace(key, value)
      return self.upper()

#if __name__ == '__main__':
#  print(unicode_tr("kitap").upper())
#  print(unicode_tr("KİTAP").lower())

