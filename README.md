🚀 Flutter 3 Seviye Mimarisi – Bloc/Cubit + Mixin Örneği

Bu proje, Flutter ile 3 seviyeli mimari yapısını kullanarak hazırlanmış bir örnek uygulamadır.
State management olarak Bloc & Cubit, kod tekrarını azaltmak için Mixin, veri yönetimi için de repository yapısı kullanılmıştır.

📌 Proje Mimarisi

Uygulama, okunabilirliği ve ölçeklenebilirliği artırmak için 3 katmanlı bir yapı ile geliştirilmiştir:

lib/
├── seviye1/ (UI - Görsel Katman)
├── seviye2/ (Cubit - İş Mantığı)
└── seviye3/ (Repository & Model - Veri Katmanı)

1️⃣ Seviye 1 – UI (View)

Sayfaların görsel tasarımı burada yapılır.

Kullanıcı etkileşimleri Cubit’e iletilir.

Veriler BlocBuilder / BlocConsumer ile dinlenir.

2️⃣ Seviye 2 – Cubit / Bloc

Tüm iş mantığı bu katmanda.

UI’dan gelen istekleri işler.

Repository ile haberleşir.

State yönetimi Cubit ile yapılmıştır.

Kullanılan yapılar:

Cubit

BlocBuilder

BlocListener

Error / Success state yapıları

3️⃣ Seviye 3 – Repository & Model

Hive veya API gibi veri kaynaklarına bağlanır.

UserModel, UserService, Repository yapıları burada bulunur.

UI bu seviyeye asla direkt erişmez.

🎯 Kullanılan Teknolojiler
Teknoloji	Açıklama
Flutter	UI geliştirme
Bloc / Cubit	State management
Repository Pattern	Veri organizasyonu
Mixin	Tekrar eden fonksiyonları ortak kullanma
Hive (opsiyonel)	Lokal veritabanı (projeye uygunsa)
🧩 Mixin Kullanımı

Projede tekrar eden işlemler için Mixin yapısı kullanılmıştır.
Bu sayede sayfaların ortak mantığı tek bir mixin içinde toplanır.

Örnek:

mixin UserHelperMixin {
bool validateUserName(String name) => name.length > 3;
}


Bu mixin, UI veya Cubit sınıflarında şöyle kullanılır:

class UserCubit extends Cubit<UserState> with UserHelperMixin {
...
}

🗂 Bloc / Cubit Kullanımı

User verisini çekmek için örnek Cubit akışı:

getAllUsers() async {
emit(UserLoading());
final data = await repo.getUsers();
emit(UserLoaded(data));
}


UI tarafında:

BlocBuilder<UserCubit, UserState>(
builder: (context, state) {
if (state is UserLoading) {
return CircularProgressIndicator();
}
if (state is UserLoaded) {
return UserList(state.users);
}
return SizedBox();
},
)

📷 Proje Görselleri

Eğer istersen buraya ekran görüntüleri için bir bölüm hazır bırakabilirim.

🚀 Çalıştırmak İçin
flutter pub get
flutter run

🧪 Öne Çıkan Özellikler

✔ 3 seviyeli Flutter mimarisi

✔ Temiz, test edilebilir kod

✔ Bloc & Cubit kullanım örnekleri

✔ Repository + Model yapısı

✔ Mixin ile tekrar eden fonksiyonların sadeleşmesi

✔ Kolay ölçeklenebilir yapı

📌 Geliştirici Notları

Bu proje, Flutter’da mimari öğrenmek isteyenler için rehber niteliğinde hazırlanmıştır.
Gelişmiş projelerde rahatlıkla temel olarak kullanılabilir.🚀 Flutter 3 Seviye Mimarisi – Bloc/Cubit + Mixin Örneği

Bu proje, Flutter ile 3 seviyeli mimari yapısını kullanarak hazırlanmış bir örnek uygulamadır.
State management olarak Bloc & Cubit, kod tekrarını azaltmak için Mixin, veri yönetimi için de repository yapısı kullanılmıştır.

📌 Proje Mimarisi

Uygulama, okunabilirliği ve ölçeklenebilirliği artırmak için 3 katmanlı bir yapı ile geliştirilmiştir:

lib/
├── seviye1/ (UI - Görsel Katman)
├── seviye2/ (Cubit - İş Mantığı)
└── seviye3/ (Repository & Model - Veri Katmanı)

1️⃣ Seviye 1 – UI (View)

Sayfaların görsel tasarımı burada yapılır.

Kullanıcı etkileşimleri Cubit’e iletilir.

Veriler BlocBuilder / BlocConsumer ile dinlenir.

2️⃣ Seviye 2 – Cubit / Bloc

Tüm iş mantığı bu katmanda.

UI’dan gelen istekleri işler.

Repository ile haberleşir.

State yönetimi Cubit ile yapılmıştır.

Kullanılan yapılar:

Cubit

BlocBuilder

BlocListener

Error / Success state yapıları

3️⃣ Seviye 3 – Repository & Model

Hive veya API gibi veri kaynaklarına bağlanır.

UserModel, UserService, Repository yapıları burada bulunur.

UI bu seviyeye asla direkt erişmez.

🎯 Kullanılan Teknolojiler
Teknoloji	Açıklama
Flutter	UI geliştirme
Bloc / Cubit	State management
Repository Pattern	Veri organizasyonu
Mixin	Tekrar eden fonksiyonları ortak kullanma
Hive (opsiyonel)	Lokal veritabanı (projeye uygunsa)
🧩 Mixin Kullanımı

Projede tekrar eden işlemler için Mixin yapısı kullanılmıştır.
Bu sayede sayfaların ortak mantığı tek bir mixin içinde toplanır.

Örnek:

mixin UserHelperMixin {
bool validateUserName(String name) => name.length > 3;
}


Bu mixin, UI veya Cubit sınıflarında şöyle kullanılır:

class UserCubit extends Cubit<UserState> with UserHelperMixin {
...
}

🗂 Bloc / Cubit Kullanımı

User verisini çekmek için örnek Cubit akışı:

getAllUsers() async {
emit(UserLoading());
final data = await repo.getUsers();
emit(UserLoaded(data));
}


UI tarafında:

BlocBuilder<UserCubit, UserState>(
builder: (context, state) {
if (state is UserLoading) {
return CircularProgressIndicator();
}
if (state is UserLoaded) {
return UserList(state.users);
}
return SizedBox();
},
)

📷 Proje Görselleri

Eğer istersen buraya ekran görüntüleri için bir bölüm hazır bırakabilirim.

🚀 Çalıştırmak İçin
flutter pub get
flutter run

🧪 Öne Çıkan Özellikler

✔ 3 seviyeli Flutter mimarisi

✔ Temiz, test edilebilir kod

✔ Bloc & Cubit kullanım örnekleri

✔ Repository + Model yapısı

✔ Mixin ile tekrar eden fonksiyonların sadeleşmesi

✔ Kolay ölçeklenebilir yapı

📌 Geliştirici Notları

Bu proje, Flutter’da mimari öğrenmek isteyenler için rehber niteliğinde hazırlanmıştır.
Gelişmiş projelerde rahatlıkla temel olarak kullanılabilir.🚀 Flutter 3 Seviye Mimarisi – Bloc/Cubit + Mixin Örneği

Bu proje, Flutter ile 3 seviyeli mimari yapısını kullanarak hazırlanmış bir örnek uygulamadır.
State management olarak Bloc & Cubit, kod tekrarını azaltmak için Mixin, veri yönetimi için de repository yapısı kullanılmıştır.

📌 Proje Mimarisi

Uygulama, okunabilirliği ve ölçeklenebilirliği artırmak için 3 katmanlı bir yapı ile geliştirilmiştir:

lib/
├── seviye1/ (UI - Görsel Katman)
├── seviye2/ (Cubit - İş Mantığı)
└── seviye3/ (Repository & Model - Veri Katmanı)

1️⃣ Seviye 1 – UI (View)

Sayfaların görsel tasarımı burada yapılır.

Kullanıcı etkileşimleri Cubit’e iletilir.

Veriler BlocBuilder / BlocConsumer ile dinlenir.

2️⃣ Seviye 2 – Cubit / Bloc

Tüm iş mantığı bu katmanda.

UI’dan gelen istekleri işler.

Repository ile haberleşir.

State yönetimi Cubit ile yapılmıştır.

Kullanılan yapılar:

Cubit

BlocBuilder

BlocListener

Error / Success state yapıları

3️⃣ Seviye 3 – Repository & Model

Hive veya API gibi veri kaynaklarına bağlanır.

UserModel, UserService, Repository yapıları burada bulunur.

UI bu seviyeye asla direkt erişmez.

🎯 Kullanılan Teknolojiler
Teknoloji	Açıklama
Flutter	UI geliştirme
Bloc / Cubit	State management
Repository Pattern	Veri organizasyonu
Mixin	Tekrar eden fonksiyonları ortak kullanma
Hive (opsiyonel)	Lokal veritabanı (projeye uygunsa)
🧩 Mixin Kullanımı

Projede tekrar eden işlemler için Mixin yapısı kullanılmıştır.
Bu sayede sayfaların ortak mantığı tek bir mixin içinde toplanır.

Örnek:

mixin UserHelperMixin {
bool validateUserName(String name) => name.length > 3;
}


Bu mixin, UI veya Cubit sınıflarında şöyle kullanılır:

class UserCubit extends Cubit<UserState> with UserHelperMixin {
...
}

🗂 Bloc / Cubit Kullanımı

User verisini çekmek için örnek Cubit akışı:

getAllUsers() async {
emit(UserLoading());
final data = await repo.getUsers();
emit(UserLoaded(data));
}


UI tarafında:

BlocBuilder<UserCubit, UserState>(
builder: (context, state) {
if (state is UserLoading) {
return CircularProgressIndicator();
}
if (state is UserLoaded) {
return UserList(state.users);
}
return SizedBox();
},
)

📷 Proje Görselleri

Eğer istersen buraya ekran görüntüleri için bir bölüm hazır bırakabilirim.

🚀 Çalıştırmak İçin
flutter pub get
flutter run

🧪 Öne Çıkan Özellikler

✔ 3 seviyeli Flutter mimarisi

✔ Temiz, test edilebilir kod

✔ Bloc & Cubit kullanım örnekleri

✔ Repository + Model yapısı

✔ Mixin ile tekrar eden fonksiyonların sadeleşmesi

✔ Kolay ölçeklenebilir yapı

📌 Geliştirici Notları

Bu proje, Flutter’da mimari öğrenmek isteyenler için rehber niteliğinde hazırlanmıştır.
Gelişmiş projelerde rahatlıkla temel olarak kullanılabilir.