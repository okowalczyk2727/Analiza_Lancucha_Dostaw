# Dane modelowane

Katalog zawiera dane pomocnicze przygotowane wcześniej w Pythonie na potrzeby analizy zapasów, zakupów i pracy dostawców.

Nie są to rzeczywiste dane operacyjne DataCo. Stanowią rozszerzenie scenariusza analitycznego oparte na produktach i okresie występującym w danych źródłowych.

## Pliki

| Plik | Ziarnistość | Rekordy |
| --- | --- | ---: |
| `dim_date.csv` | Jeden dzień | 1 162 |
| `dim_supplier.csv` | Jeden dostawca | 24 |
| `fact_inventory_daily.csv` | Jeden dzień, produkt i magazyn | 311 416 |
| `fact_purchase_orders.csv` | Jedno zamówienie zakupu | 2 199 |
| `mart_product_classification.csv` | Jeden produkt | 118 |

Kalendarz i stany zapasów obejmują okres od 01.01.2015 do 07.03.2018. Zamówienia zakupu obejmują okres od 13.01.2015 do 29.01.2018.

## Zakres modelu

- `dim_date.csv` wspiera filtrowanie po roku, kwartale, miesiącu, tygodniu i dniu tygodnia.
- `dim_supplier.csv` zawiera region, poziom jakości i parametry obsługi dostawcy.
- `fact_inventory_daily.csv` zawiera stan początkowy i końcowy, popyt, realizację, zapas bezpieczeństwa, wartość zapasu i flagi ryzyka.
- `fact_purchase_orders.csv` zawiera daty zamówienia i przyjęcia, ilości, wartości oraz flagi terminowości, kompletności i OTIF.
- `mart_product_classification.csv` zawiera klasy ABC i XYZ oraz miary sprzedaży, zysku i zmienności popytu.

Powrót do [danych przetworzonych](../README.md).
