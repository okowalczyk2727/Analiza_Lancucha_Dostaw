# Raport Power BI

Katalog zawiera końcowy raport oraz wcześniejszy plik roboczy wykorzystany podczas przygotowania danych w Power Query.

## Pliki

| Plik | Zastosowanie |
| --- | --- |
| `ChainSupplyAnalysis.pbix` | Główny model i gotowy raport analityczny |
| `ChainSupplyAnalysis_powerquery.pbix` | Wcześniejszy etap czyszczenia i modelowania danych; nie jest przeznaczony do prezentacji |

Do portfolio i prezentacji projektu należy używać `ChainSupplyAnalysis.pbix`.

## Model

Raport korzysta z modelu wielofaktowego zbudowanego na wspólnych wymiarach. Zawiera:

- 4 tabele faktów,
- 7 wymiarów,
- tabelę `KPI_Measures` z 66 miarami DAX,
- 23 relacje,
- 140 kolumn, z których techniczne klucze i pola pomocnicze są ukryte.

Dane sprzedaży, wysyłek, zapasów i zakupów są filtrowane przez jeden kalendarz. Dla każdej tabeli faktów aktywna jest główna data procesu, a pozostałe role dat pozostają nieaktywne.

## Strony raportu

### `00_QA`

Strona techniczna służy do sprawdzenia modelu przed analizą lub prezentacją. Pokazuje liczby rekordów, zakres dat oraz kontrolne wartości KPI dla sprzedaży, dostaw, zapasów, zakupów i klasyfikacji produktów.

### `Executive Overview`

Zawiera najważniejsze wskaźniki całego łańcucha dostaw, trend sprzedaży i zysku oraz ranking dziesięciu kategorii z najwyższą sprzedażą netto.

### `Delivery Performance`

Pokazuje liczbę ważnych i opóźnionych wysyłek, terminowość, średni czas realizacji i średnie opóźnienie. Wykresy przedstawiają zmianę jakości dostaw w czasie oraz wyniki według sposobu wysyłki.

### `Inventory Health`

Łączy wartość zapasu końcowego z fill rate, ekspozycją na brak zapasu, poziomem poniżej zapasu bezpieczeństwa, nadmiarem zapasu i liczbą dni pokrycia. Pozycję zapasową można porównać między magazynami.

### `Supplier Performance`

Obejmuje wartość zamówień zakupu, OTIF, fill rate, terminowość, kompletność i średni lead time. Ranking pokazuje OTIF dziesięciu dostawców o największej wartości zamówień.

### `Product Classification`

Pozwala analizować sprzedaż, zysk, marżę, liczbę produktów, liczbę sprzedanych sztuk i utraconą sprzedaż. Wykresy porównują klasy ABC i XYZ, a filtr umożliwia wybór kategorii produktu.

## Układ i filtrowanie

Pięć stron biznesowych korzysta z tego samego układu 1280 × 720 px:

- tytuł i filtr w górnej części strony,
- sześć kart KPI,
- dwa wykresy zajmujące dolną część raportu.

Na stronach operacyjnych używany jest filtr zakresu dat. Strona klasyfikacji produktów korzysta z filtra kategorii, ponieważ klasy ABC/XYZ opisują cały portfel.

## Otwieranie i odświeżanie

1. Otwórz `ChainSupplyAnalysis.pbix` w Power BI Desktop.
2. Raport można przejrzeć na zapisanych danych bez odświeżania.
3. Aby pobrać aktualne dane, otwórz ustawienia źródeł i wskaż własny SQL Server.
4. Wybierz bazę `SupplyChainAnalytics` i właściwy sposób uwierzytelniania.
5. Odśwież model.
6. Sprawdź stronę `00_QA` przed przejściem do stron biznesowych.

Model odwołuje się do widoków warstwy `mart` oraz wymiarów w bazie. Jeśli raport jest przenoszony na inny komputer, zmiana danych logowania i nazwy serwera jest spodziewanym krokiem.

Powrót do [głównego README](../README.md).
