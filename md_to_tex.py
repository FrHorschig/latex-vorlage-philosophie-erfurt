import sys
import re

begin = """\documentclass{hausarbeit_philosophie}
\\addbibresource{literatur.bib}

\\title{Titel der Hausarbeit}
\\semester{Sommer-/Wintersemester 20xy/20xy}
\\name{Vorname Name}
\\matrikelnummer{Matrikelnummer}
\\hauptnebenfach{Hauptfach, Nebenfach}
\\fachsemester{Fachsemester}
\\email{email@uni-erfurt.de}
\\veranstaltung{Titel der Veranstaldung}
\\dozent{Titel und Namen der Dozentin/des Dozenten}
\\modul{Modulbezeichnung}
\\leistungart{Modulprüfung, qualifizierte Teilnahme}
\\abgabe{\\today}
\\zeichenzahl{Anzahl der Zeichen ohne Leerzeichen}

\\begin{document}

\\maketitle
\\tableofcontents
\\newpage

"""

end = """
\printbibliography

\end{document}
"""


lastRef = ""


def replace_function(match):
    global lastRef
    ref = match.group(2)
    page = match.group(3)
    if match.group(1) == '" ':
        # if ref == lastRef:
        #     return f'" (ebd. {page})'
        # lastRef = ref
        return f'" \\cite[{page}]{{{ref}}}'
    else:
        # if ref == lastRef:
        #     return f" (vgl. ebd. {page})"
        # lastRef = ref
        return f" \\vglcite[{page}]{{{ref}}}"


def process_lines(input_file, output_file):
    with open(input_file, "r") as f:
        lines = f.readlines()

    with open(output_file, "w") as f:
        f.write(begin)
        for line in lines:
            if line.startswith("- "):
                continue
            elif line.startswith("#####"):
                line = r"\subsection{" + line[5:].strip() + "}\n"
            elif line.startswith("###"):
                line = r"\section{" + line[3:].strip() + "}\n"
            elif line.startswith("\\break"):
                line = "\\bigbreak\n\\noindent\n"
            line = re.sub(r"\s*\*(.*?)\*\s*", r" \\emph{\1} ", line)
            line = re.sub(r"(\"? )?\[(\w+) (\d+f?f?\.?)\]", replace_function, line)
            f.write(line)
        f.write(end)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Please provide the input filename as an argument.")
        sys.exit(1)

    input_filename = sys.argv[1]
    if len(sys.argv) == 3:
        process_lines(input_filename, sys.argv[2])
    else:
        process_lines(
            input_filename, input_filename[: len(input_filename) - 3] + ".tex"
        )
