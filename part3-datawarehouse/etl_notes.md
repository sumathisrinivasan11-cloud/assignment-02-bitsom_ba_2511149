\## ETL Decisions



\### Decision 1 — Standardizing Date Formats

\*\*Problem:\*\*  

The raw dataset contained multiple inconsistent date formats such as `29/08/2023`, `12-12-2023`, and `2023-02-05`. These inconsistencies made it impossible to reliably sort, filter, or join dates when loading the fact table or building the `dim\_date` dimension.



\*\*Resolution:\*\*  

All dates were parsed and converted into a single ISO‑standard format: `YYYY-MM-DD`. This ensured that every fact row could be linked to a valid `date\_id` and that the date dimension remained clean, consistent, and analytics‑friendly.



\---



\### Decision 2 — Fixing Inconsistent Category Casing

\*\*Problem:\*\*  

The `category` field had inconsistent casing and pluralization, including values like `electronics`, `Electronics`, `Grocery`, and `Groceries`. These inconsistencies would fragment reporting and produce incorrect aggregations in the product dimension.



\*\*Resolution:\*\*  

All category values were standardized to a consistent, singular, title‑case format (e.g., `Electronics`, `Grocery`, `Clothing`). This ensured that the `dim\_product` table contained clean, uniform categories and that analytical queries grouped data correctly.



\---



\### Decision 3 — Handling Missing Store City Values

\*\*Problem:\*\*  

Several rows had missing `store\_city` values (e.g., `Mumbai Central, , Atta 10kg`). Missing location data would break foreign key relationships and distort store‑level reporting in the warehouse.



\*\*Resolution:\*\*  

During ETL, missing store\_city values were filled using known store‑to‑city mappings derived from other rows in the dataset (e.g., `Mumbai Central → Mumbai`). This ensured that the `dim\_store` table remained complete and that all fact rows could be linked to a valid store dimension entry.

