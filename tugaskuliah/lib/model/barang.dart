class Barang{
  String nama;
  String gambar;
  int harga;
  String desc;

  Barang({
    required this.nama,
    required this.gambar,
    required this.harga,
    required this.desc,
  });
}

var barang = [
  Barang(
      nama: "Bandeng Presto",
      gambar: "https://www.javatravel.net/wp-content/uploads/2019/12/Bandeng-Presto-Juwana-Semarang.jpg",
      harga: 64000,
      desc: "Makanan satu ini bisa menjadi pilihan oleh-oleh karena termasuk tahan lama. Memang banyak daerah yang memiliki bandeng presto, namun khas Semarang tak boleh dilewatkan begitu saja. Ikan bandeng segar yang dimasak dengan bumbu khusus seperti bawang putih, garam dan kunyit ini kemudian dialasi dengan daun pisang. Kemudian dimasak pada panci presto agar tulangnya lunak."
  ),
  Barang(
      nama: "Tembikar",
      gambar: "https://sc04.alicdn.com/kf/UTB8HU0NnFPJXKJkSahVq6xyzFXaV.jpg",
      harga: 500000,
      desc: "Perabotan pecah belah dari Indonesia dikenal dengan kualitasnya yang awet dan berbagai motif etnik yang unik. Tidak salah jika banyak turis dan permintaan impor dari Amerika, Eropa dan Timur Tengah terhadap barang-barang kerajinan tanah liat ini. Di pasar Internasional, tembikar asli Indonesia telah diekspor ke beberapa negara langganan seperti Singapura, Jepang, dan Malaysia. Daerah penghasil tembikar yang paling terkenal ada di kota Yogyakarta dalam bentuk dekorasi untuk hiasan rumah, pajangan bufet, piring cantik, dan sebagainya."
  ),
  Barang(
      nama: "Keris",
      gambar: "https://apollo-singapore.akamaized.net/v1/files/gwv9nplcjpa61-ID/image;s=780x0;q=60",
      harga: 2000000,
      desc: "Produk unik asal Indonesia lainnya yang bisa ditemukan adalah senjata tradisional. Keris merupakan salah satu produk unggulan dari Indonesia yang banyak diekspor ke luar negeri karena banyak permintaan dari para kolektor benda-benda seni antik serta pajangan dinding. Senjata tradisional lain yang berasal dari Indonesia dan diekspor sebagai produk unik antara lain clurit dari Madura, Mandau dari Kalimantan, dan sebagainya. Akan tetapi, bagi sejumlah kolektor benda-benda antik, Keris masih dianggap sebagai benda kuno yang mengandung unsur magis atau spiritual. Oleh karena itu, harganya bisa mencapai lebih dari Rp 1 juta, tergantung kualitas bahan dan corak hiasan ukiran pada permukaan keris."
  ),
  Barang(
      nama: "Batik",
      gambar: "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/08/14/3162922243.png",
      harga: 200000,
      desc: "Membawakan oleh-oleh berupa produk Indonesia yang unik, Anda tidak akan pernah salah jika memberikan batik. Kain batik merupakan kebanggaan Indonesia bahkan sudah ditetapkan oleh UNESCO sebagai salah satu warisan dunia pada 2 Oktober 2009. Batik memiliki banyak corak dan motif serta warna-warna yang memukau. Batik yang paling terkenal dan termahal adalah jenis batik tulis atau dibuat dengan tangan selama berminggu-minggu. Proses pembuatan yang tergolong rumit ini membuat harganya bisa mencapai ratusan ribu. Namun jangan khawatir karena kualitasnya sepadan dengan harganya."
  ),
  Barang(
      nama: "Dupa Aromaterapi",
      gambar: "https://ds393qgzrxwzn.cloudfront.net/resize/m720x480/cat1/img/images/0/dzOYy6iXMn.jpg",
      harga: 5000,
      desc: "Orang-orang luar negeri biasanya sangat suka relaksasi berendam di dalam bath-tube sembari menyalakan lilin aroma terapi. Nah, lalu kenapa Anda tidak memberikan oleh-oleh dupa aromaterapi dari Indonesia? Dupa aromaterapi dari Indonesia akan meningkatkan suasana hati siapa saja yang mencium wewangian ini. Dibuat dari bahan berkualitas dan aroma bunga yang menyegarkan. Cukup satu batang dupa akan menjadi penyemangat sepanjang hari. Berbagai jenis produk aromaterapi dari Indonesia juga bisa dijumpai di Bali. Selain berupa dupa, ada yang sudah dikemas dalam botol cantik untuk essence yang ditambahkan ke dalam bak mandi Anda. Dijual di Pasar Seni Sukowati dengan harga yang terjangkau mulai dari Rp 5.000 hingga Rp 20.000. Murah meriah, kan?"
  ),
  Barang(
      nama: "Kopi Luwak",
      gambar: "https://ds393qgzrxwzn.cloudfront.net/resize/m720x480/cat1/img/images/0/vC5v6StSb5.jpg",
      harga: 500000,
      desc: "Produk unik lain yang tak kalah terkenal dan populer dari Indonesia tentu saja adalah kopi luwak. Satu-satunya kopi yang berasal dari Indonesia dengan cita rasa yang tak perlu ditanyakan lagi. Kopi Luwak memiliki keunikan berupa rasanya yang asam karena mendapat fermentasi secara alami di dalam perut musang. Produk kopi luwak liar biasanya ada di daerah-daerah yang masih dekat dengan kawasan hutan atau lereng gunung. Seperti di Lembah Baliem dan Lereng Gunung Tanggamus. Soal harganya, ada kualitas ada harga. Per kilo masih mencapai ratusan ribu hingga jutaan rupiah."
  ),
];