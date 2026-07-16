# Dane przetworzone

Katalog zawiera dane przygotowane do załadowania do SQL Server i wykorzystania w Power BI.

## Podkatalogi

| Katalog | Pochodzenie | Zastosowanie |
| --- | --- | --- |
| `powerquery_exports` | Czyszczenie i modelowanie danych DataCo w Power Query | Sprzedaż, wysyłki i podstawowe wymiary |
| `generated_data` | Dane przygotowane wcześniej w Pythonie | Zapasy, zakupy, dostawcy, kalendarz i ABC/XYZ |

## Kolejność ładowania

1. Wymiary z `powerquery_exports`.
2. Kalendarz i dostawcy z `generated_data`.
3. Tabele faktów sprzedaży i wysyłek.
4. Tabele faktów zapasów i zamówień zakupu.
5. Tabela klasyfikacji produktów.


Szczegóły:

- [Eksporty Power Query](powerquery_exports/README.md)
- [Dane modelowane](generated_data/README.md)

Powrót do [opisu danych](../README.md).
