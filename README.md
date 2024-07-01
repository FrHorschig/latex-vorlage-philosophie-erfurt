# latex-vorlage-philosophie-erfurt

Dieses Repository enthält eine LaTeX-Vorlage für Hausarbeiten an der Philosophischen Fakultät der Universität Erfurt.

Diese Vorlage gehorcht im Großen und Ganzen den Vorgaben, die [hier](https://www.uni-erfurt.de/philosophische-fakultaet/seminare-professuren/philosophie/geschichte-der-philosophie) im Abschnitt "Hinweise für Hausarbeiten" zu finden sind. Sie sorgt v.a. für die korrekte Formatierung des Deckblatts und des Literaturverzeichnisses. Dafür stellt sie die folgenden Befehle zur Verfügung:
- `\cite[<Seitenzahl>]{<bib-Code>}` erzeugt einen Nachweis für direkte Zitate im Format '(Mustermann, 12)'
- `\vglcite[<Seitenzahl>]{<bib-Code>}` erzeugt einen Nachweis für indirekte Zitate im Format '(vgl. Mustermann, 12)'
- `\blockzitat{<Text des Blockzitats>}` formatiert einen Text als Blockzitat

Die Nutzung kanonischer Zitierweisen ist etwas umständlich, aber möglich. Die Dateien `beispiel.tex` und `literatur.bib` enthalten Beispiele für Zitate nach kanonischer Zitierweise.

### Installation

0. Falls noch nicht geschehen: Installiere eine TeX-Distribution (z.B. [TeX Live](https://www.tug.org/texlive/) oder [MikTeX](https://miktex.org/))
1. Lade die Datei `hausarbeit_philosophie.cls` herunter und plaziere sie im Ordner der `.tex`-Datei
2. Füge `\documentclass{hausarbeit_philosophie}` als erste Zeile in das LaTeX-Dokumentes ein

Alternativ kann man auch einfach die Beispieldateien als Ausgangspunkt nehmen.

# Hausarbeiten schreiben mit Markdown

Mit [Markdown](https://www.markdownguide.org/cheat-sheet/) kann man sehr einfach Formatierungsanweisungen zum Text hinzufügen. Mit einem geeigneten Markdown-Editor (z.B. [Zettlr](https://www.zettlr.com/) oder [Obsidian](https://obsidian.md/)) wird der Markdown-Syntax direkt entfernt und stattdessen der Text formatiert angezeigt. Dadurch kann man sich beim Schreiben ganz auf den Inhalt des Textes konzentrieren, ohne von Formatierungsarbeiten abgelenkt zu werden, und trotzdem die Formatierungen, die für die Bedeutung des Textes wichtig sind (z.B. *Hervorhebungen*), beim Schreiben sehen.

Um die Arbeit mit Markdown und LaTeX einfacher zu machen, gibt es neben dem LaTeX-Template auch ein [Python](https://www.python.org/)-Skript, um den Markdown-Text in LaTeX-Code umzuwandeln. Das Skript ist sehr rudimentär, folgende Umwandlungen sind damit möglich:
- Asterisk-Paare werden in einen `\emph`-Befehl umgewandelt, z.B. aus `*Hervorbehung aus mehreren Wörtern*` wird `\emph{Hervorbehung aus mehreren Wörtern}`
- ein bib-Code (mit oder ohne Seitenzahl, 'f.' oder 'ff.' nach der Zahl sind ebenfalls möglich) innerhalb eckiger Klammern (z.B. `[MyBibCode 123f.]`) wird in einen `\cite`-Befehl umgewandelt, wenn die Zitation auf ein `"` folgt, andernfalls wird er in ein `\vglcite` umgewandelt
- Überschriften mit `###` werden in `\section`-, Überschriften mit `#####` in `\subsection`-Befehle umgewandelt

Zeilen, die mit "- " beginnen, werden beim Umwandeln ignoriert. Damit kann man im Text Notizen einfügen, die im finalen Text nicht sichtbar sind.

# Kontakt

Für Verbesserungsvorschläge einfach einen Pull Request erstellen oder eine [E-Mail](mailto:frhorschig@mailbox.org) schreiben.
