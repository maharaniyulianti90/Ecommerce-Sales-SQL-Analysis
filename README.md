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
### 2. Customer Loyalty (Top Spender)
**Narrative:** Tim Marketing ingin memberikan reward...

<details>
<summary>Click to view SQL Syntax 🔑</summary>

```sql
SELECT customer_id, SUM(basket_count) 
FROM basket_details 
GROUP BY customer_id 
ORDER BY 2 DESC LIMIT 10;
