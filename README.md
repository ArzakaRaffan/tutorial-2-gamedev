## Refleksi Tutorial 2

> 1. Apa saja pesan log yang dicetak pada panel Output?

Pesan yang muncul di log:
- `platform initialized` -> Log di awal, menandakan _ready() atau dimulainya MainLevel
- `Object reached` -> Muncul ketika pesawat sampai ke Area2D

> 2. Coba gerakkan landasan ke batas area bawah, lalu gerakkan kembali ke atas hingga hampir menyentuh batas atas. Apa saja pesan log yang dicetak pada panel Output?
- `Reached Objective`

> 3. Buka scene MainLevel dengan tampilan workspace 2D. Apakah lokasi scene ObjectiveArea memiliki kaitan dengan pesan log yang dicetak pada panel Output pada percobaan sebelumnya

`ObjectiveArea` memiliki signal `_on_ObjectiveArea_body_entered` yang memicu log atau output  

> 4. Scene BlueShip dan StonePlatform sama-sama memiliki sebuah child node bertipe Sprite2D. Apa fungsi dari node bertipe Sprite2D?

`Sprite2D` adalah sebuah node yang berfungsi untuk menampilkan tekstur atau gambar 2D pada layar. Node ini adalah sebuah representasi visual dari suatu objek dalam scene sehingga dapat dilihat oleh player dan muncul di scene

> 5. Root node dari scene BlueShip dan StonePlatform menggunakan tipe yang berbeda. BlueShip menggunakan tipe RigidBody2D, sedangkan StonePlatform menggunakan tipe StaticBody2D. Apa perbedaan dari masing-masing tipe node?

Sesuai dengan namanya, `StaticBody2D` adalah sebuah node statis yang tidak bergerak dan tidak terpengaruh oleh gaya fisika apapun. Biasanya `StaticBody2D` digunakan untuk membuat dinding atau lantai. Sementara `RigidBody2D` adalah sebuah node yang dipengaruhi oleh gaya dan hukum fisika. Objek ini dapat bergerak akibat gaya gravitasi, dorongan, atau tumbukan.

> 6. Ubah nilai atribut Mass pada tipe RigidBody2D secara bebas di scene BlueShip, lalu coba jalankan scene MainLevel. Apa yang terjadi?
Jika nilai Mass diubah contohnya jadi diperbesar,`BlueShip` akan terasa lebih berat, percepatannya lebih lambat, dan lebih susah digerakkan. Namun, saat saya jalankan scene 

`MainLevel`, tidak ada hal yang signifikan yang terjadi. Saya merasa memang pesawat lebih berat saat diangkat oleh platform, tapi tidak tahu apakah benar atau hanya plasebo saja :D

> 7. Ubah nilai atribut Disabled milik node CollisionShape2D pada scene StonePlatform, lalu coba jalankan scene MainLevel. Apa yang terjadi?

Jika nilai atribut `Disabled` diubah, maka collision dari `StonePlatform` nya tidak aktif sehingga pesawat tidak dapat tertahan oleh `StonePlatform`. Hal ini menyebabkan pesawat hilang dari layar.

> 8. Pada scene MainLevel, coba manipulasi atribut Position, Rotation, dan Scale milik node BlueShip secara bebas. Apa yang terjadi pada visualisasi BlueShip di Viewport?

- Position: Atribut position ada X dan Y dimana sesuai dengan letak `BlueShip`. Jika nilai X diubah, maka objek bergerak di sumbu X yakni ke kanan atau kiri. Jika nilai Y diubah, maka objek bergerak di sumbu Y yakni ke atas dan ke bawah sehingga posisi letak `BlueShip` akan berubah di layar
- Rotation: Atribut rotation mengubah sudut rotasi atau kemiringan dari `BlueShip`, objek akan berputar sesuai nilai rotasi (dalam derajat). Misalnya saya mencoba mengubah menjadi 90 deg, maka `BlueShip` akan berputar 90 deg.
- Scale: Atribut scale mengubah ukuran dari `BlueShip`. Atribut scale memiliki dua bagian, yakni X dan Y. Atribut ini bisa di-'link' antara X dan Y nya. Jika misalkan nilai X dan Y di-link dan diperbesar dari 1.0 menjadi 2.2, maka pesawat akan membesar secara proporsional dari segi X dan Y. Namun jika tidak di-link dan X diperbesar, maka pesawat akan membesar dari segi sumbu X nya saja (namun tetap ada penyesuaian dari sumbu Y-nya)

> 9. Pada scene MainLevel, perhatikan nilai atribut Position node PlatformBlue, StonePlatform, dan StonePlatform2. Mengapa nilai Position node StonePlatform dan StonePlatform2

tidak sesuai dengan posisinya di dalam scene (menurut Inspector) namun visualisasinya berada di posisi yang tepat?
Perbedaan tersebut terjadi karena transformation dalam Godot diatur secara hierarkis (Parent-child). Transformation `StonePlatform` dan `StonePlatform2` mengikuti transformation dari parent nya yakni `PlatformBlue`. Dalam scene `MainLevel`, `PlatformBlue` memiliki position (35, 565). Secara penempatan di world, `StonePlatform` dan `StonePlatform2` memiliki position yang sama dengan `PlatformBlue` karena position dari `StonePlatform` dan `StonePlatform2` adalah (0,0) (Dalam inspektornya)
