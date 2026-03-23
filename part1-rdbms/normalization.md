## Anomaly Analysis

\##Insert Anomaly
The system cannot store a new product unless it appears in an order.
In the dataset, product information only exists inside order rows.
For example:
“ORD1185, … P008, Webcam, Electronics, 2100 …”

If the company wants to add a new product (e.g., P009 – Monitor) but no customer has ordered it yet, there is no place to insert it.
Cause: Product attributes depend on the existence of an order row.
Impact: New products cannot be added independently.

\##Update Anomaly
Updating a sales rep’s office address requires modifying many rows.
Sales rep SR01 – Deepak Joshi appears in multiple rows, all repeating the same office address:
“SR01, Deepak Joshi, deepak@corp.com, Mumbai HQ, Nariman Point, Mumbai - 400021”

This address appears in many orders (e.g., ORD1114, ORD1153, ORD1083, ORD1091, ORD1125, etc.).
If the office address changes, every row must be updated manually.
Cause: Sales rep details are duplicated across many orders.
Impact: Missing even one update leads to inconsistent data.

\##Delete Anomaly
Deleting the only order for a product removes the product entirely.
Product P008 – Webcam appears only once:
“ORD1185, … P008, Webcam, Electronics, 2100 …”

If order ORD1185 is deleted (e.g., cancellation), then:

* The product P008 disappears from the system.
* The company loses all record that the product exists.
Cause: Product information is stored only within order rows.
Impact: Deleting an order unintentionally deletes product master data.



\## Normalization Justification

The idea that keeping all data in a single table is “simpler” may appear true initially, but the orders\_flat.csv dataset clearly demonstrates how a denormalized structure creates hidden complexity, inconsistency, and maintenance problems. While one table may look easy to manage, it actually introduces multiple data anomalies that make the system fragile and error‑prone.

For example, sales representative SR01 – Deepak Joshi appears repeatedly across many rows, each time duplicating his name, email, and office address. If his office location changes, every row must be updated manually. Missing even one row results in inconsistent information, which is a classic update anomaly. By normalizing the data into a dedicated SalesReps table, this information is stored once and updated once.

Similarly, product P008 – Webcam appears only in order ORD1185. If that order is deleted, the product disappears entirely from the dataset, causing a delete anomaly. In a normalized schema, products are stored independently in a Products table, ensuring product information is preserved even if no orders exist.

Normalization also resolves insert anomalies. In the flat file, a new product cannot be added unless it appears in an order. With a separate Products table, new items can be added freely without depending on customer activity.

Therefore, normalization is not over‑engineering—it is essential for maintaining data integrity, reducing redundancy, and ensuring scalability. 

The 3NF schema eliminates all anomalies, improves consistency, and creates a cleaner, more reliable database structure that supports long‑term growth and accurate reporting. It also optimizes storage by storing repetitive data as compact IDs rather than long strings there by saving space.



