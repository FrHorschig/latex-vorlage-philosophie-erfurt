# latex-vorlage-philosophie-erfurt

Dieses Repository enthält eine LaTeX-Vorlage für Hausarbeiten an der Philosophischen Fakultät der Universität Erfurt.

Diese Vorlage gehorcht im Großen und Ganzen den Vorgaben, die [hier](https://www.uni-erfurt.de/philosophische-fakultaet/seminare-professuren/philosophie/geschichte-der-philosophie) im Abschnitt "Hinweise für Hausarbeiten" zu finden sind. Sie sorgt v.a. für die korrekte Formatierung des Deckblatts und des Literaturverzeichnisses. Dafür stellt sie die folgenden Befehle zur Verfügung:
- `\cite[<Seitenzahl>]{<bib-Code>}` erzeugt einen Nachweis für direkte Zitate im Format '(Mustermann, 12)'
- `\vglcite[<Seitenzahl>]{<bib-Code>}` erzeugt einen Nachweis für indirekte Zitate im Format '(vgl. Mustermann, 12)'
- `\blockzitat{<Text des Blockzitats>}` formatiert einen Text als Blockzitat

Die Nutzung kanonischer Zitierweisen ist etwas umständlich, aber möglich. Die Dateien `beispiel.tex` und `literatur.bib` enthalten ein Beispiel für ein Zitat nach kanonischer Zitierweise.

### Installation

0. Falls noch nicht geschehen: Installiere eine TeX-Distribution (z.B. [TeX Live](https://www.tug.org/texlive/) oder [MikTeX](https://miktex.org/))
1. Lade die Datei `hausarbeit_philosophie.cls` herunter und plaziere sie im Ordner der `.tex`-Datei
2. Füge `\documentclass{hausarbeit_philosophie}` als erste Zeile in das LaTeX-Dokumentes ein

Alternativ kann man auch einfach die Beispieldateien als Ausgangspunkt nehmen.

### Ergänzungen und Verbesserungen sind willkommen!
Für Ergänzungen oder Verbesserungen einfach einen Pull Request oder im Tab "Issues" eine neue Aufgabe erstellen.
