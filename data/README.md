# Dane projektu

Katalog `data` rozdziela dane źródłowe od danych przygotowanych do modelu analitycznego.

## Struktura

```text
data/
|-- raw/
`-- processed/
    |-- generated_data/
    `-- powerquery_exports/
```

## Podział danych

### `raw`

Oryginalny zbiór DataCo i opis jego pól. Dane nie powinny być modyfikowane w tym katalogu.

Szczegóły: [raw/README.md](raw/README.md).

### `processed/powerquery_exports`

Tabele wymiarów oraz fakty sprzedaży i wysyłek przygotowane w Power Query. Są to pliki wejściowe do warstwy SQL.

Szczegóły: [processed/powerquery_exports/README.md](processed/powerquery_exports/README.md).

### `processed/generated_data`

Kalendarz oraz dane dostawców, zakupów, zapasów i klasyfikacji produktów. Dane zostały wcześniej przygotowane w Pythonie na potrzeby rozszerzenia analizy. Nie są częścią oryginalnego zbioru DataCo.

Szczegóły: [processed/generated_data/README.md](processed/generated_data/README.md).

Powrót do [głównego README](../README.md).
