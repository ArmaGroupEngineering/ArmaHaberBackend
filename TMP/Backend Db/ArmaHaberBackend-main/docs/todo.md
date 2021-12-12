## TABLOLAR:

**Kullanıcılar Tablosu:**

- Kayıt olacak kullanıcılar:

  - Herbir kullanıcı için key (token), token'ın expires süresi olacak.
  - Yeni kayıt olacak kullanıcılar için access token üzerinden onay maili yollama kısmı istenebilir.

- Başarılı bir şekilde kayıt olmuş kullanıcılar:

  - Yöneticiler olacak, içerik üreticileri olacak, okuyucular olacak
  - Bunların her birine verilecek olan yetkilendirmeler bitwise sistemi kullanılarak olacak

**Haberler Tablosu:**

- Haberler için kategori, içerik, video, resim, yorum tabloları olacak
- İçerik tipi diye bir alanımız olacak o alana göre join kısımlarını bağlayacağız

**Mail Tablosu:**

- Mail gönderme sistemine abone olmuş kişilerin kişisel bilgileri, gönderilecek olan mail metni olacak o metin mail template'ine entegre edilecek

**Mesaj Tablosu:**

- Site içinden gönderilen mesajların, haberlere yapılan yorumların, feedbacklerin tutulacağı tablolar olması gerekiyor.

**ÖNEMLİ!**

- Arama kısmını iyi araştırmak lazım, string araması olmasını istemiyormuş hoca (?)
- Resimler üzerinden işlem yapabilmek için _Jimp_ isimli kütüphane kullanılabilir. Resim boyutları için S, M, B, Orjinal olmak üzere 4 varyant resimler tablosunda tutulacak
