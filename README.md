# E-Commerce Sales Analysis: Uncovering Customer Behavior
Portofolio ini menganalisis perilaku pelanggan dan tren penjualan menggunakan **PostgreSQL** dan **Power BI**.

## Executive Summary
Analisis ini bertujuan mengoptimalkan strategi bisnis melalui data penjualan e-commerce. Berdasarkan pengolahan data menggunakan SQL, ditemukan 3 poin kunci:
- Dominasi & Pertumbuhan: Pelanggan Laki-laki (76%) mendominasi pasar, dengan tingkat akuisisi pelanggan baru yang stabil mencapai ratusan orang tiap bulan.
- Pola "Payday": Penjualan melonjak hingga 300% pada periode gajian (tanggal 25-28). Ini adalah waktu krusial untuk memaksimalkan promo.
- Efisiensi Stok: Produk ID 43.524.799 adalah best-seller. Fokus stok pada produk Top 10 sangat disarankan untuk mencegah loss sales.

# Background Of The Narrative
Saya berperan sebagai Junior Data Analyst di sebuah startup E-Commerce. Perusahaan e-commerce Global Mart sedang mengalami pertumbuhan, namun manajemen ingin memahami lebih dalam siapa pelanggan mereka dan bagaimana pola belanja mereka agar strategi pemasaran bulan depan lebih efisien.

## Tech Stack
- **Database:** PostgreSQL
- **Tool:** DBeaver
- **Visualization:** Power BI
- **Dataset:** Kaggle E-Commerce Dataset (Link: https://www.kaggle.com/datasets/berkayalan/ecommerce-sales-dataset)

## Project Structure
- `analysis_queries.sql`: Berisi semua syntax SQL yang digunakan.
- `dataset/`: Folder berisi file CSV mentah.

## Deep Dive Analysis
### 1. Mengenal Demografi Pelanggan
**Narrative:** "Tim Marketing ingin membuat kampanye iklan yang tersegmentasi. Langkah awal yang mereka minta adalah melihat distribusi gender dari total pelanggan kita."

<details>
<summary>Click to view SQL Syntax 🔑</summary>

```sql
SELECT 
COUNT (customer_id) as total_customers,
sex
FROM customer_details
WHERE sex in ('Male','Female')
GROUP BY sex;


</details>

**Hasil :**
<img width="498" height="320" alt="image" src="https://github.com/user-attachments/assets/492e4475-5023-46a5-8f8e-de9095c20bce" />

**Analisa:**
Berdasarkan hasil berikut ternyata jumlah pelanggan toko global mart didominasi oleh laki-laki dengan jumlah hampir 3x lipat dengan jumlah pelanggan perempuan. 
Strategi : tim marketing harus memaksimalkan pemasaran produk pelanggan laki laki atau mencari tahu mengapa distribusi pasar tidak maksimal pada segmen perempuan. 

