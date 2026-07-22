# Warstwa SQL Server

Skrypty tworzą bazę `SupplyChainAnalytics`, model danych, widoki dla Power BI oraz warstwę kontroli jakości.

## Schematy

| Schemat | Zastosowanie |
| --- | --- |
| `dw` | Tabele wymiarów i faktów |
| `mart` | Klasyfikacja produktów i widoki raportowe |
| `qa` | Kontrole liczby rekordów, kluczy i głównych KPI |

## Skrypty

| Plik | Cel |
| --- | --- |
| `00_create_database.sql` | Utworzenie bazy i ustawienie kontekstu |
| `01_create_schemas.sql` | Utworzenie schematów `dw`, `mart` i `qa` |
| `02_create_tables.sql` | Utworzenie tabel, kluczy głównych i obcych |
| `03_create_views.sql` | Utworzenie lub aktualizacja widoków używanych przez Power BI |
| `04_qa_checks.sql` | Utworzenie widoków kontrolnych i wyświetlenie wyników QA |

`02_create_tables.sql` jest przeznaczony do jednorazowego uruchomienia na pustej bazie. Nie usuwa istniejących tabel i przy ponownym uruchomieniu zwróci błąd informujący, że obiekty już istnieją. Widoki w skryptach `03` i `04` korzystają z `CREATE OR ALTER`, dlatego można je uruchamiać ponownie.

## Kolejność wykonania

1. `00_create_database.sql`
2. `01_create_schemas.sql`
3. `02_create_tables.sql`
4. Import wymiarów
5. Import tabel faktów
6. Import `mart_product_classification`
7. `03_create_views.sql`
8. `04_qa_checks.sql`
9. Uzgodnienie wyników z kartami na stronie `00_QA` w Power BI

## Kolejność ładowania danych

Najpierw należy załadować tabele, do których odwołują się klucze obce:

1. `DIM_Category`
2. `DIM_Customer`
3. `DIM_Date`
4. `DIM_Warehouse`
5. `DIM_Geography`
6. `DIM_Product`
7. `DIM_Shipping_mode`
8. `DIM_Supplier`
9. `FAKT_OrderLines`
10. `FAKT_Shipments`
11. `FAKT_Inventory_daily`
12. `FAKT_Purchase_orders`
13. `mart_product_classification`

Pliki wejściowe znajdują się w `data/processed/powerquery_exports` i `data/processed/generated_data`.

## Klucze dat w sprzedaży i wysyłkach

Eksporty `FAKT_OrderLines.csv` oraz `FAKT_Shipments.csv` zawierają pełne znaczniki czasu, natomiast tabele docelowe przechowują również trzy kolumny typu `date`:

| Kolumna docelowa | Źródło |
| --- | --- |
| `order_date_key` | `CAST(order_date AS date)` |
| `shipping_date_key` | `CAST(shipping_date AS date)` |
| `scheduled_shipping_date_key` | `CAST(scheduled_shipping_date AS date)` |

Podczas importu można przygotować te pola w tabeli tymczasowej, Power Query albo w instrukcji `INSERT ... SELECT`. Nie należy wypełniać ich ręcznie.

## Widoki raportowe

Power BI korzysta z pięciu widoków w schemacie `mart`:

- `mart.vw_dim_product`,
- `mart.vw_fact_sales`,
- `mart.vw_fact_shipments`,
- `mart.vw_fact_inventory`,
- `mart.vw_fact_purchase_orders`.

Widoki porządkują nazwy kolumn, łączą produkt z kategorią i klasyfikacją oraz dodają flagę ważnego zamówienia. Za ważne uznawane są rekordy, których status nie jest równy `CANCELED` ani `SUSPECTED_FRAUD`.

## Kontrole jakości

`04_qa_checks.sql` tworzy trzy widoki:

- `qa.vw_row_counts` — liczba rekordów w każdej tabeli,
- `qa.vw_orphan_keys` — liczba kluczy bez pasującego wymiaru,
- `qa.vw_kpi_reconciliation` — podstawowe wartości służące do uzgodnienia miar DAX.

Po poprawnym załadowaniu danych wszystkie wartości `orphan_count` powinny wynosić zero. Wyniki `vw_kpi_reconciliation` należy porównać ze stroną `00_QA` po pełnym odświeżeniu modelu.

Powrót do [głównego README](../README.md).
