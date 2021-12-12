# rest api nedir

## [IBM](https://www.ibm.com/tr-tr/cloud/learn/rest-apis):

** Rest API nedir?:**

Rest API'leri, uygulamaları entegre etmek için esnek ve basit bir yöntem sağlar ve mikro hizmet mimarilerindeki bileşenlerin bağlantısını kurmak için en yaygın yöntem olarak ortaya çıkmıştır.

Bir API veya *uygulama programlama arayüzü*, uygulamaların veya cihazların birbirlerine nasıl bağlanabileceğini ve birbirleriyle nasıl iletişim kurabileceğini tanımlayan bir dizi kuralıdır. REST API'si, REST'in tasarım ilkelerine veya *temsili durum aktarımına* ilişkin mimari stiline uyan bir API'dir. Bu nedenle, REST API'leri bazen RESTful API'leri olarak da anılır.

**REST Tasarım İlkeleri:**

- Tek tip arayüz:
  * Aynı kaynağa yönelik tüm API istekleri, isteğin nereden geldiğine bakılmaksızın aynı görünmelidir. 

- İstemci-Sunucu Ayrıştırması:
  * REST API'si tasarımında, istemci ve sunucu uygulamaları birbirinde tamamen bağımsız olmalıdır. İstemci uygulamasının sahip olması gereken tek bilgi, istenen kaynağın tek tip kaynak tanımlayıcısıdır; istemci uygulaması, sunucu uygulamasıyla başka hiçbir şekilde etkileşime giremez. Benzer şekilde, bir sunucu uygulaması, istemci uygulamasını, HTTP aracılığıyla istenen verilere iletmek dışında değiştirmemelidir.

- Durum bilgisinin olmaması:
  * REST API'lerinden durum bilgisi yoktur; diğer bir deyişle, her isteğin, işlenmemesi için gerekli tüm bilgileri tüm bilgileri içermesi gerekir. Diğer bir ifadeyle, REST API'leri, herhangi bir sunucu tarafı oturumu gerektirmez. Sunucu uygulamalarının, bir istemci isteğiyle ilgili herhangi bir veriyi depolamasına olanak tanınmaz

- Önbelleğe alınabilirlik:
  * Mümkün olduğunda, kaynaklar, istemci veya sunucu tarafında önbelleğe alınabilir olmalıdır. Ayrıca sunucu yanıtlarının, sağlanan kaynak için önbelleğe alma işlemine izin verilip verilmediğiyle ilgili bilgiyi içermesi gerekir. Amaç, sunucu tarafında ölçeklenebilirliği artırırken, istemci tarafında performansı iyileştirmektir.

- Katmanlı sistem mimarisi:
  * REST API'lerinde, çağrılar ve yanıtlar farklı katmanlardan geçer. Genel bir kural olarak, istemci ve sunucu uygulamalarının doğrudan birbirine bağlandığı varsayımlarda bulunmayın. İletişim döngüsünde birkaç farklı aracı olabilir. REST API'lerinin, istemcinin ya da sunucunun, son uç uygulamayla mı yoksa bir aracıyla mı iletişim kurduğunun anlaşılamayacağı bir şekilde tasarlanması gerekir.

- İsteğe bağlı kod:
  * REST API'leri, genellikle statik kaynaklar gönderir; ancak bazı durumlarda yanıtlar, yürütülebilir kod da (Java uygulamaları gibi) içerebilir. Bu gibi durumlarda, kod yalnızca isteğe bağlı olarak çalışmalıdır.
  
