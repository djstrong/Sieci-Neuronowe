Sieci Neuronowe - projekt
=========================


Ogólnie
----------

Projekt jest pisany jako skrypt do uruchomienia przez środowisko Octave.

Składa się z 3 części:
* moduł main.m ładujący konfigurację, obliczający błąd i rysujący wykres
* moduł nn.m wyliczający wartości zwracane przez sieć neuronową
* 3 małe moduły na funkcje aktywacji


Użycie
-------

### Definicja sieci
Definicja sieci znajduje się w pliku konfiguracyjnym. Jest on skryptem w jezyku Octave (ze względu na czytelność nie stosujemy formatu zapisu zmiennych przez Octave). 
Przykładowe pliki konfiguracyjne są załączone do projektu.

### Uruchomienie programu
Jako parametr należy podać plik konfiguracyjny, np.:

```bash
$ octave -q main.m neurony.conf
```


Przykład
--------

Spróbujemy użyć programu do symulowania funkcji logicznej XOR.

Plik konfiguracyjny: [XOR_sigmoid_learned.conf](https://github.com/djstrong/Sieci-Neuronowe/blob/master/XOR_sigmoid_learned.conf)

Po uruchomieniu programu zobaczymy:

```bash
$ octave -q main.m XOR_sigmoid_learned.conf
```

Otrzymujemy wynik:
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

![wykres.jpg](https://raw.github.com/djstrong/Sieci-Neuronowe/master/img/wykres.jpg)








