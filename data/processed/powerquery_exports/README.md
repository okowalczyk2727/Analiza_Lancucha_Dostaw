# Eksporty Power Query

Katalog zawiera tabele przygotowane w Power Query na podstawie zbioru DataCo. Pliki służą jako źródło do załadowania warstwy `dw` w SQL Server.

## Tabele wymiarów

| Plik | Ziarnistość | Rekordy |
| --- | --- | ---: |
| `DIM_Category.csv` | Jedna kategoria | 51 |
| `DIM_Customer.csv` | Jeden klient | 20 652 |
| `DIM_Geography.csv` | Jedna kombinacja lokalizacji zamówienia | 3 772 |
| `DIM_Product.csv` | Jeden produkt | 118 |
| `DIM_Shipping_mode.csv` | Jeden sposób wysyłki | 4 |
| `DIM_Warehouse.csv` | Jeden magazyn modelowy | 3 |

## Tabele faktów

| Plik | Ziarnistość | Rekordy |
| --- | --- | ---: |
| `FAKT_OrderLines.csv` | Jeden wiersz zamówienia | 180 519 |
| `FAKT_Shipments.csv` | Jedno zamówienie i jego wysyłka | 65 752 |

## Zakres przekształceń

Obecne eksporty pokazują wykonanie następujących prac:

- rozdzielenie danych na fakty i wymiary,
- usunięcie danych klientów, które nie są potrzebne w analizie,
- przypisanie identyfikatorów geografii, sposobu wysyłki i magazynu,
- utworzenie flag anulowania, opóźnienia i terminowości,
- przygotowanie wartości sprzedaży netto, zysku i ilości,
- przygotowanie daty planowanej wysyłki i kosztu jednostkowego.

## Kolejność importu do SQL Server

1. `DIM_Category.csv`
2. `DIM_Customer.csv`
3. `DIM_Warehouse.csv`
4. `DIM_Geography.csv`
5. `DIM_Product.csv`
6. `DIM_Shipping_mode.csv`
7. `FAKT_OrderLines.csv`
8. `FAKT_Shipments.csv`

Przed importem faktów należy również załadować `dim_date.csv` z katalogu `generated_data`.

Powrót do [danych przetworzonych](../README.md).
