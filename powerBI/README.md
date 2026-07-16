# Raport Power BI

Katalog zawiera bieżący raport oraz wcześniejszy plik roboczy wykorzystany podczas przygotowania danych.

## Pliki

| Plik | Zastosowanie | Status |
| --- | --- | --- |
| `ChainSupplyAnalysis.pbix` | Główny model i raport połączony z SQL Server | Aktualny |
| `ChainSupplyAnalysis_powerquery.pbix` | Wcześniejszy etap Power Query i modelowania | Plik roboczy, strona raportowa jest pusta |

Do prezentacji projektu należy używać `ChainSupplyAnalysis.pbix`.

## Model danych

Aktualny model zawiera 12 tabel widocznych w układzie relacji:

- 7 wymiarów,
- 4 tabele faktów,
- 1 tabelę miar `KPI_Measures`.

Model korzysta z danych zapisanych w bazie `SupplyChainAnalytics`. Część faktów i wymiar produktu jest pobierana przez widoki warstwy `mart`.

## Obecne strony

### `00_QA`

Strona techniczna służy do sprawdzenia modelu przed analizą. Zawiera kontrolę:

- liczby rekordów,
- pierwszej i ostatniej daty,
- sprzedaży i marży,
- terminowości wysyłek,
- dostępności zapasu,
- realizacji zamówień zakupu,
- zgodności klasyfikacji produktów.

### `Executive Overview`

Strona zawiera:

- filtr zakresu dat,
- `Net Sales`,
- `Profit Margin %`,
- `On-Time Delivery %`,
- `Inventory Value EOP`,
- `Inventory Fill Rate %`,
- `Supplier OTIF %`,
- wykres sprzedaży netto i zysku według miesiąca,
- 10 kategorii z najwyższą sprzedażą netto.

Na obecnych wizualizacjach raport odwołuje się do 47 unikalnych nazw miar.

## Docelowe strony biznesowe

1. `Executive Overview`
2. `Delivery Performance`
3. `Inventory Health`
4. `Supplier Performance`
5. `Product Classification`

Strona `00_QA` pozostaje stroną techniczną poza tym zakresem.

## Odświeżenie raportu

1. Uruchom SQL Server i upewnij się, że baza `SupplyChainAnalytics` jest dostępna.
2. Otwórz `ChainSupplyAnalysis.pbix` w Power BI Desktop.
3. Wejdź w ustawienia źródeł danych.
4. Wskaż własną nazwę serwera i bazę `SupplyChainAnalytics`.
5. Ustaw właściwy sposób uwierzytelniania.
6. Odśwież dane.
7. Sprawdź stronę `00_QA`.

Powrót do [głównego README](../README.md).
