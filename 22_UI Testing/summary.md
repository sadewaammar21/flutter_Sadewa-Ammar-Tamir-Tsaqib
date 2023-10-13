pada tanggal 9Oktober 2023 saya meengikuti live mentoring terkait section 22 dengan materi  UI Testing & build apk bersama mentor  kak  Yudha 
Materi Yang saya ambil pada live sesion ini adalah
A. UI Testing
1. UI testing adalah pengujian yang dilakukan pada tampilan suatu aplikasi untuk memastikan aplikasi dapat menerima interaksi dan memberi respon kepada penguna
* UI testing di flutter disebut juga widget testing sehingga pengujian dilakukas pada widgets dengan menuliskan script yang dapat dijalankan secara otomatis 
2. keuntungan UI Testing 
- memastikan seluruh widget memberi tampilan yangsesuai 
- memastikan seluruh interkasi dapat diterima dengan baik
- menjadi ketentuan yang harus diikuti saat diperlukan perubahan pada widget
3. cara melakukan UI Testing pada flutter maka harus memberikan packag Testing pada pubspeck.yaml seperti biasanya
4.Penulisan UScript dilakukan pada folder test & nama file harus diikuti _test.dart
5. mejalankan testing dengan cara memerika perintah flutter test pada terminal & hasil dari perintah ini adalah lamanya waktu pengujian, total pengujian yang dilakukan, dan pesan bahwa pengujian berhasil
krtika tesing gagal akan ditampilkan penyebab gagalnya pengujian
B. Output Build Flutter
1. deskripski 
- file/berkas hasil keluaran dari project flutter 
- Digunakan untuk merilis aplikasi ke App Store
- Terdi dari format APK atau AAB untuk android dan IPA untuk iOS
perintah pada terminal antara lain
- flutter build APK (Format .apk)
-  Flutter build appbundle (Format .aab)
- Flutter build ios (Format .ipa)
2. mode build
- flutter build apk--debug (untuk pengujian seleama proses development)
- flutter build apk --profile (Untuk pengujian peforma aplikasi)
- flutter build apk --release (untuk merilis ke google play store dan store android atau lainnya)
3. proses sebelum Build APK
* memberiri nama project 
* cara merubah nama
- ubah properti android:label pada AndroidManifest.xml yang ada di  folder android/src/main/AndoidManifest.xml
- jalankan ulang aplikasi
* menagtur icon aplikasi
- cara nya yaitu kiata mendownload ikon menggunakan website Android Assest Studio 
- unzip hasil downloadan
- buka folder ic_launcher-> buka folder res -> copy seluruh folder mipmap ke dalam folder res yang ada di project flutter mengantikan mipmap bawaan
- jalankan ulang aplikasi
* mangatur peizinan aplikasi
- pada AndroidManifest.xml tambahkan<uses-pemission android:name="android.permission.INTERNET"/>
*melakukan build apk 
- output file .apk berada di folder 
build/app/outputs/apk/debug/app-debug.apk
build/app/outputs/apk/profile/app-profile.apk
build/app/outputs/apk/release/app-release.apk
*install pada real device