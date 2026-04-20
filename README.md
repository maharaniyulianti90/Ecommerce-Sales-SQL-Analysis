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

**Query:** 
SELECT 
COUNT (customer_id) AS total_customers,
sex 
FROM customer_details 
WHERE sex IN ('Male','Female')
GROUP BY sex;

**Hasil:**
<img width="498" height="320" alt="image" src="https://github.com/user-attachments/assets/a44671d9-42e6-49d1-ad22-1cb5dc6ff549" />

**Analisa:**
Berdasarkan hasil berikut ternyata jumlah pelanggan toko global mart didominasi oleh laki-laki dengan jumlah hampir 3x lipat dengan jumlah pelanggan perempuan. 
Strategi : tim marketing harus memaksimalkan pemasaran produk pelanggan laki laki atau mencari tahu mengapa distribusi pasar tidak maksimal pada segmen perempuan. 

### 2. Identifikasi Pelanggan Loyal (Top Spender)
**Narrative:** "Kepala Bagian Marketing ingin memberikan reward khusus kepada 10 pelanggan paling loyal yang paling sering melakukan transaksi di platform kita."

**Query:** 
SELECT
basket_details.customer_id,
SUM(basket_details.basket_count)AS total_bought,
customer_details.sex
FROM basket_details 
INNER JOIN customer_details ON basket_details.customer_id = customer_details.customer_id
GROUP BY basket_details.customer_id, customer_details.sex 
ORDER BY total_bought DESC
LIMIT 10;

**Hasil:**
<img width="681" height="453" alt="image" src="https://github.com/user-attachments/assets/41a384d4-9746-44fe-9b52-d5144e892cee" />

**Analisa:**
Berdasarkan hasil yang didapat setelah melakukan filterisasi untuk mengetahui pelanggan mana yang sering melakukan transaksi, didapatkan hasil bahwa:
1.	Customer dengan nomor id 12737235 dengan jenis kelamin laki laki telah melakukan 5 kali transaksi
2.	Dari seluruh pelanggan di toko Global Mart, pembelian tertinggi 5x transaksi, dengan berjenis kelamin laki-laki, hal ini selaras dengan hasil yang didapat bahwa distribusi pelanggan terbanyak adalah laki-laki dibandingkan dengan perepuan
3.	Data ini bisa digunakan untuk memberikan reward berupa voucher / hadiah kepada pelanggan yang loyal untuk mempertahankan loyalitas pelanggan. 

### 3. Identifikasi Pelanggan tidak loyal (Low Spender)
**Narrative:** "Kepala Bagian Marketing ingin memberikan perlakuan khusus kepada 10 pelanggan paling tidak lotal di platform kita."

**Query:** 
SELECT
basket_details.customer_id,
SUM(basket_details.basket_count)AS total_bought,
customer_details.sex
FROM basket_details 
INNER JOIN customer_details ON basket_details.customer_id = customer_details.customer_id
GROUP BY basket_details.customer_id, customer_details.sex 
ORDER BY total_bought ASC
LIMIT 10;

**Hasil:**
<img width="650" height="359" alt="image" src="https://github.com/user-attachments/assets/e3ebd642-7fff-492f-88c9-06c34ac0f420" />

**Analisa:**
Setelah dengan data top spender, lalu dilakukan analisa berdasarkan data low spender, berdasarkan hasil yang didapat, bisa diambil kesimpulan bahwa :
1.	Customer dengan transaksi paling rendah di toko Global Mart adalah 2x transaksi dan tetap didominasi oleh pelanggan laki-laki. 
2.	Tim marketing dapat melakukan pendekatan kepada para low spender untuk supaya menjadi top spender, bisa dilakukan melalui promosi, voucher, cashback dll. Tim marketing juga dapat melakukan prediksi supaya para low spender tidak berubah menjadi churn, guna mempertahankan mereka supaya tetap menjadi pelanggan.
3.	Dengan adanya data high spander dan data low spender dapat dijadikan data yang kuat untuk dilakukan segmentasi pelanggan, bisa berdasarkan customer behaviour, recency, frequency dan juga monetary supaya seluruh pelanggan mendapatkan reward / tindakan yang sesuai.

### 4. Analisis Tren Penjualan Harian
**Narrative:** "Manajer Operasional ingin memantau apakah ada lonjakan transaksi pada tanggal tertentu untuk memastikan server dan tim logistik siap."

**Query:** 
SELECT
COUNT(customer_id)AS total_customer,
basket_date,
SUM(basket_count) AS total_daily_sales
FROM basket_details
GROUP BY basket_date 
ORDER BY total_daily_sales DESC;

**Hasil:**
<img width="628" height="319" alt="image" src="https://github.com/user-attachments/assets/9b0db288-d8c7-4408-a447-f40f054f8d88" />

**Analisa:**
Berdasarkan hasil berikut, dapat ditarik kesimpulan bahwa:
1. Pada tanggal 25 hingga 28 atau akhir bulan terdapat lonjakan pembelian dengan total penjualan hingga 12049 dengan total customer 5570, dengan rata-rata tiap customer melakukan minimal 2 hingga 3 kali transaksi atau pembelia setiap harinya,
2. Berdasarkan data ini diharapkan tim operasional dapat memperkuat server dan juga tim logistik setiap akhir bulan dikarenakan adanya lonjakan transaksi yang terjadi
3. Data ini juga dapat digunakan tim sales / finance untuk memberikan discount, voucher atau promo di akhir bulan supaya menarik lebih banyak pelanggan. 


### 5. Mencari Produk Populer
**Narrative:** "Tim Inventaris perlu tahu produk mana yang paling banyak masuk ke keranjang pelanggan agar stoknya selalu terjaga."

**Query:**
SELECT 
product_id,
SUM(basket_count)AS total_quantity
FROM basket_details
GROUP BY product_id 
ORDER BY total_quantity DESC 
LIMIT 10;

**Hasil:**
<img width="428" height="352" alt="image" src="https://github.com/user-attachments/assets/4116ef6c-cb31-4f5d-924f-2b7104b47518" />

**Analisa:**
Berdasarkan hasil berikut, didapatkan bahwa :
Product dengan id 4354799 merupakan produk dengan total penjualan tertinggi yaitu sebesar 69. Data ini bisa dijadikan patokan untuk pengadaan produk sehingga ketika terjadinya lonjakan pembelian pada masa payday kuantitas produk tetap aman, begitu juga dengan produk lainnya sehingga semua produk sesuai dengan kebutuhan customer

### 6. Filter Pelanggan Baru (Low Tenure)
**Narrative:** "Manajemen ingin memberikan promo 'Welcome Pack' khusus untuk pelanggan yang masa bergabungnya (tenure) masih di bawah 6 bulan agar mereka rajin belanja."

**Query:** 
SELECT 
COUNT (customer_id) AS total_customers,
sex,
tenure
FROM customer_details 
WHERE tenure <= 6 AND sex IN ('Female','Male')
GROUP BY customer_details.sex, customer_details.tenure
ORDER BY customer_details.tenure DESC;

**Hasil:**
<img width="559" height="236" alt="image" src="https://github.com/user-attachments/assets/8040582e-b9c3-4950-a4b1-e30d4595a1db" />

**Analisa:**
Saya membedah data pelanggan yang baru bergabung dalam 6 bulan terakhir. Terlihat bahwa jumlah pelanggan baru pria cenderung lebih banyak di setiap bulannya dibandingkan wanita. Contohnya, pada tingkat tenure 4 bulan, terdapat 152 pelanggan pria berbanding 89 pelanggan wanita, hal ini selaras dengan segmentasi pelanggan toko Global Mart kita yang cenderung lebih banyak pelanggan laki-laki dibandingkan perempuan.
Insight Bisnis: Pertumbuhan pelanggan baru cukup stabil di angka ratusan setiap bulannya. Ini adalah indikator bahwa akuisisi pelanggan masih berjalan dengan baik.
Rekomendasi Strategis: Tim Marketing dapat meluncurkan kampanye "Referral Code" khusus untuk segmen ini guna mempercepat pertumbuhan. Selain itu, karena porsi wanita di pelanggan baru masih kecil, ada peluang besar untuk membuat kampanye bertema Woman-Focused guna menyeimbangkan demografi.

