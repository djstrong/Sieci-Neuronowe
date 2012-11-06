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
$ octave -q main.m neurony.conf
```

Po uruchomieniu należy wybrać odpowiednią funkcję aktywacji oraz podać jej parametry.


Przykład
--------

Spróbujemy użyć programu do symulowania funkcji logicznej XOR.

Plik konfiguracyjny: [XORsigmoid.conf](https://github.com/djstrong/Sieci-Neuronowe/blob/master/XORsigmoid.conf)

Po uruchomieniu programu zobaczymy:

```bash
$ octave -q main.m XORsigmoid.conf

Wybierz funkcje aktywacji

  [ 1] Liniowa
  [ 2] Skokowa
  [ 3] Sigmoidalna

pick a number, any number: 
```

Wybieramy *3* i otrzymujemy wynik:
```bash
input_data =

   0   0
   0   1
   1   0
   1   1

answers =

   0.047082
   0.952536
   0.952534
   0.056104

Błąd: 0.0025
```

Gdy sieć posiada 2 wejścia i 1 wyjście wygenerowany zostanie wykres. 
W tym przykładzie wygląda on tak:

![wykres.jpg](master/img/wykres.jpg)








