Sieci Neuronowe - projekt
=========================


Ogólnie
----------

Projekt jest pisany jako skrypt do uruchomienia przez środowisko Octave.

Składa się z 3 części:
* moduł main.m ładujący konfigurację i komunikujący się z użytkownikiem poprzez menu
* moduł nn.m wyliczający wartości zwracane przez sieć neuronową
* 3 małe moduły na funkcje aktywacji


Użycie
-------

### Definicja sieci
Definicja sieci znajduje się w pliku konfiguracyjnym. Jego format odpowiada formatowi zapisywania zmiennych do pliku przez Octave. 
Przykładowe pliki konfiguracyjne są załączone do projektu.

### Uruchomienie programu
Jako parametr należy podać plik konfiguracyjny, np.:

```bash
$ octave main.m neurony.conf
```

Po uruchomieniu należy wybrać odpowiednią funkcję aktywacji oraz podać jej parametry.







