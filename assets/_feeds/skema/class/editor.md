Title: Bagan Eksekusi
participant Buka Toko
participant Stok Barang
participant Merchant Center
participant Peluang Terbaik
participant Portfolio
participant Network
Buka Toko-->Stok Barang: Optimasi
Stok Barang->Merchant Center: Cloud-Task-API
Merchant Center->Peluang Terbaik: Cloud-Site-API
Peluang Terbaik->>Portfolio: Google-Ads-API
Portfolio->>Stok Barang: Google-Trend-API
Portfolio-->>Network: eShop SEO
