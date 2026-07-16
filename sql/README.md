# Warstwa SQL Server

Katalog zawiera definicję obecnego modelu bazy `SupplyChainAnalytics` oraz widoki używane przez Power BI.

## Schematy

| Schemat | Zastosowanie | Obecny stan |
| --- | --- | --- |
| `dw` | Wymiary i tabele faktów | Utworzony |
| `mart` | Klasyfikacja produktów i widoki raportowe | Utworzony |
| `qa` | Kontrole jakości i uzgodnienia | Utworzony, bez gotowych obiektów |


## Skrypty

| Plik | Cel | Status |
| --- | --- | --- |
| `00_create_database.sql` | Utworzenie bazy i ustawienie kontekstu | Gotowy |
| `01_create_schemas.sql` | Utworzenie schematów `dw`, `mart`, `qa` | Gotowy |
| `02_create_tables.sql` | Tabele, klucze główne i obce | Wymaga poprawki przed ponownym uruchomieniem |
| `03_create_views.sql` | Widoki dla Power BI | Gotowy dla istniejącej bazy |

## Obiekty modelu

Tabele `dw`:

- `DIM_Category`
- `DIM_Customer`
- `DIM_Date`
- `DIM_Geography`
- `DIM_Product`
- `DIM_Shipping_mode`
- `DIM_Supplier`
- `DIM_Warehouse`
- `FAKT_OrderLines`
- `FAKT_Shipments`
- `FAKT_Inventory_daily`
- `FAKT_Purchase_orders`

Tabela `mart`:

- `mart_product_classification`

Widoki `mart`:

- `vw_dim_product`
- `vw_fact_sales`
- `vw_fact_shipments`
- `vw_fact_inventory`
- `vw_fact_purchase_orders`

## Kolejność wykonania

1. `00_create_database.sql`
2. `01_create_schemas.sql`
3. Korekta `02_create_tables.sql`
4. Utworzenie tabel
5. Import wymiarów
6. Import faktów
7. Kontrola liczby rekordów, duplikatów, wartości NULL i kluczy osieroconych
8. `03_create_views.sql`
9. Uzgodnienie KPI SQL z miarami DAX

Powrót do [głównego README](../README.md).
