#import "@preview/cetz:0.2.2": canvas

#set page(
  paper: "a4",
  margin: (left: 2cm, right: 2cm, top: 2cm, bottom: 2cm),
)

#set text(font: "New Computer Modern", size: 11pt, lang: "de")
#set par(leading: 0.7em)
#set heading(numbering: "1.1.")

#show heading.where(level: 1): it => {
  pagebreak()
  text(size: 18pt, weight: "bold", it.body)
  v(0.5em)
}

#show heading.where(level: 2): it => {
  text(size: 14pt, weight: "bold", it.body)
  v(0.3em)
}

#align(center)[
  #text(size: 28pt, weight: "bold")[Chemie-Repetitorium]
  #v(0.6em)
  #text(size: 20pt)[11. Klasse Gymnasium Bayern G9]
  #v(0.5em)
  #text(size: 14pt, style: "italic")[Wiederholung Klasse 10]
  #v(2em)
  #text(size: 11pt)[
    1. Energieumsatz, Aktivierung und Katalyse
    2. Isomerie bei Kohlenwasserstoff-Molekülen
    3. Alkohole, Aldehyde, Ketone und Carbonsäuren
    4. Zwischenmolekulare Wechselwirkungen und physikalische Eigenschaften
    5. Saure und basische Lösungen: Stoff- und Teilchenebene
    6. Neutralisation und Konzentrationsbestimmung durch Titration
    7. Redoxreaktionen und Oxidationszahlen
    8. Säure-Base- und Redoxreaktionen im Vergleich
    9. Redoxreaktionen in wässrigen Lösungen
    10. Redoxreaktionen von Alkoholen und Aldehyden
  ]
]

= Energieumsatz, Aktivierung und Katalyse

== Grundbegriffe

#table(
  columns: (1.2fr, 2.5fr),
  [*Begriff*], [*Erklärung*],
  [Reaktionsenthalpie], [$Delta H = H_("Produkte") - H_("Edukte")$],
  [exotherm], [Wärme wird an die Umgebung abgegeben; $Delta H < 0$],
  [endotherm], [Wärme wird aus der Umgebung aufgenommen; $Delta H > 0$],
  [Aktivierungsenergie], [Mindestenergie, die für den Reaktionsstart nötig ist],
  [Katalysator], [Beschleunigt eine Reaktion, bleibt am Ende unverändert],
)

== Energiediagramm

#let energiediagram = canvas({
  import cetz.draw: *
  line((0,0), (9,0))
  line((0,0), (0,6))
  text((4.5,-0.55), "Reaktionsverlauf")
  text((-0.5,3), "Energie", rotation: 90deg)

  // unkatalysiert
  line((0.5,1.4), (2.0,4.8), stroke: (paint: red, thickness: 1.5pt))
  line((2.0,4.8), (3.7,2.8), stroke: (paint: red, thickness: 1.5pt))

  // katalysiert
  line((4.5,1.4), (5.6,3.3), stroke: (paint: blue, thickness: 1.5pt))
  line((5.6,3.3), (6.8,2.8), stroke: (paint: blue, thickness: 1.5pt))

  // Aktivierungsenergie
  line((2.0,1.4), (2.0,4.8), stroke: (paint: red, dash: "dashed", thickness: 1pt))
  text((2.3,3.0), $E_a$ + " ohne Kat.", fill: red, size: 8pt)
  line((5.6,1.4), (5.6,3.3), stroke: (paint: blue, dash: "dashed", thickness: 1pt))
  text((5.9,2.3), $E_a$ + " mit Kat.", fill: blue, size: 8pt)

  // gleiche Delta H
  line((3.7,2.8), (6.8,2.8), stroke: (paint: green, dash: "dotted", thickness: 1pt))
  text((5.2,2.45), $Delta H$ " gleich", fill: green, size: 8pt)
})

#energiediagram

== Arten der Katalyse

- Homogene Katalyse: Katalysator und Edukte in derselben Phase
  - Beispiel: $H^+$ bei der Veresterung
- Heterogene Katalyse: Katalysator und Edukte in verschiedenen Phasen
  - Beispiel: $Ni$ bei der Hydrierung von Alkenen
- Biokatalyse: Enzyme wirken als Katalysatoren
  - Beispiel: Katalase spaltet $H_2O_2$

= Isomerie bei Kohlenwasserstoff-Molekülen

== Arten der Isomerie

#table(
  columns: (1.5fr, 2.5fr),
  [*Art*], [*Erklärung*],
  [Kettenisomerie], [Gleiche Molekularformel, unterschiedliche Kohlenstoffketten],
  [Positionsisomerie], [Funktionelle Gruppe / Substituent an anderer Position],
  [Strukturisomerie], [Verschiedene Verknüpfung der Atome],
  [cis/trans-Isomerie], [Geometrische Isomerie bei Doppelbindungen],
)

== Beispiel: Pentan-Isomere

#table(
  columns: (1.4fr, 2.3fr, 0.9fr),
  [*Name*], [*Struktur*], [*Siedepunkt*],
  [n-Pentan], [$"CH"_3-"CH"_2-"CH"_2-"CH"_2-"CH"_3$], [$36^\circ"C"$],
  [2-Methylbutan], [$"CH"_3-"CH"_2-"CH"("CH"_3)-"CH"_3$], [$28^\circ"C"$],
  [2,2-Dimethylpropan], [$"C"("CH"_3)_4$], [$10^\circ"C"$],
)

== Geometrische Isomerie bei But-2-en

#figure(
  caption: [cis-But-2-en],
  ```
      H₃C     CH₃
         \  /
          C==C
         /  \
        H    H
  ```
)

#figure(
  caption: [trans-But-2-en],
  ```
      H₃C       H
         \     /
          C==C
         /     \
       H       CH₃
  ```
)

Hinweis: Bei cis-But-2-en stehen die gleichen Gruppen auf derselben Seite der Doppelbindung; bei trans-But-2-en auf gegenüberliegenden Seiten.

= Alkohole, Aldehyde, Ketone und Carbonsäuren

== Funktionelle Gruppen

#table(
  columns: (1.4fr, 1.6fr, 2.4fr),
  [*Stoffklasse*], [*Funktionelle Gruppe*], [*Beispiel*],
  [Alkohol], [$-"OH"$], [Ethanol: $"CH"_3-"CH"_2-"OH"$],
  [Aldehyd], [$-"CHO"$], [Ethanal: $"CH"_3-"CHO"$],
  [Keton], [$-"CO"-$], [Propanon: $"CH"_3-"CO"-"CH"_3$],
  [Carbonsäure], [$-"COOH"$], [Ethansäure: $"CH"_3-"COOH"$],
)

== Oxidationsstufen und Reaktionstypen

- Primärer Alkohol: $"R-CH"_2"OH"$ → Aldehyd → Carbonsäure
- Sekundärer Alkohol: $"R"_2"CHOH"$ → Keton
- Tertiärer Alkohol: nicht oxidierbar unter milden Bedingungen

=== Ethanol

$"CH"_3"CH"_2"OH" + ["O"] -> "CH"_3"CHO" + "H"_2"O"$

$"CH"_3"CHO" + ["O"] -> "CH"_3"COOH"$

=== Propan-2-ol

$("CH"_3)_2"CHOH" + ["O"] -> ("CH"_3)_2"C=O" + "H"_2"O"$

== Fehling- und Tollens-Test

#table(
  columns: (1.3fr, 1fr, 1fr),
  [*Probe*], [*Fehling*], [*Tollens*],
  [Aldehyd], [positiv], [positiv],
  [Keton], [negativ], [negativ],
  [primärer Alkohol], [negativ], [negativ],
  [sekundärer Alkohol], [negativ], [negativ],
)

- Fehling: $"Cu"^{2+}$ wird zu $"Cu"_2"O"$ reduziert
- Tollens: $"Ag"^+$ wird zu metallischem Silber reduziert

== Beispiel-SMILES

- Ethanol: `CCO`
- Ethanal: `CC=O`
- Propanon: `CC(=O)C`
- Essigsäure: `CC(=O)O`
- But-2-en: `CC=CC`

= Zwischenmolekulare Wechselwirkungen und physikalische Eigenschaften

== Arten der Wechselwirkungen

#table(
  columns: (1.7fr, 1.7fr, 1.2fr),
  [*Art*], [*Bedingung*], [*Energie*],
  [London-Kräfte], [unpolare Moleküle], [$1-10 "kJ/mol"$],
  [Dipol-Dipol], [polare Moleküle], [$5-20 "kJ/mol"$],
  [Wasserstoffbrückenbindung], [$H$ an O, N oder F], [$10-40 "kJ/mol"$],
  [Ionenbindung], [Kationen und Anionen], [$200-4000 "kJ/mol"$],
)

== Wasserstoffbrückenbindungen in Wasser

"Wasser bildet Wasserstoffbrücken zwischen H und O anderer Moleküle. Dadurch sind Siedepunkt und Oberflächenspannung höher als bei ähnlichen Molekülen ohne H-Brücken."

#figure(
  caption: [Wasserstoffbrücken zwischen Wassermolekülen],
  ```
      H   ...   O
      |         |
      O--H ... H-O
      |         |
      H         H
  ```
)

== Einfluss auf physikalische Eigenschaften

- Je stärker die Wechselwirkungen, desto höher der Siedepunkt.
- Polare Stoffe lösen sich eher in polaren Lösungsmitteln.
- Wasser hat eine hohe Oberflächenspannung und eine Dichteanomalie um 4 °C.

#let dichte = canvas({
  import cetz.draw: *
  line((0,0), (8,0))
  line((0,0), (0,5))
  text((4,-0.5), "Temperatur (°C)")
  text((-0.7,2.5), "Dichte", rotation: 90deg)

  let points = ((0,1.0), (1,1.2), (2,1.6), (3,1.8), (4,2.0), (5,1.7), (6,1.3), (7,1.0))
  for i in range(0, points.len()-1) {
    let p1 = points.at(i)
    let p2 = points.at(i+1)
    line(p1, p2, stroke: (paint: blue, thickness: 1.5pt))
  }
  circle((4,2.0), radius: 0.12, fill: red)
  text((4.7,2.25), "Maximum bei 4 °C", fill: red, size: 8pt)
})

#dichte

= Saure und basische Lösungen: Stoff- und Teilchenebene

== Brønsted-Lowry-Definition

- Säure: Protonendonator
- Base: Protonenakzeptor
- Ampholyt: kann sowohl Proton aufnehmen als auch abgeben

Beispiele:

- $"HCl" -> "H"^+ + "Cl"^-$
- $"NH"_3 + "H"_2"O" ⇌ "NH"_4^+ + "OH"^-$
- $"H"_2"O"$ ist amphoter

== pH und pOH

$"pH" = -log_10 ["H"^+]$

$"pOH" = -log_10 ["OH"^-]$

$"pH" + "pOH" = 14$ bei $25^\circ"C"$

#table(
  columns: (1fr, 1fr, 1fr),
  [*pH*], [*Lösung*], [*Bedeutung*],
  [$< 7$], [sauer], [$["H"^+] > ["OH"^-]$],
  [$= 7$], [neutral], [$["H"^+] = ["OH"^-]$],
  [$> 7$], [basisch], [$["OH"^-] > ["H"^+]$],
)

== Starke und schwache Säuren/Basen

#table(
  columns: (1.3fr, 1.5fr, 1.5fr),
  [*Eigenschaft*], [*stark*], [*schwach*],
  [Dissoziation], [nahezu vollständig], [teilweise],
  [Beispiele], [HCl, $"HNO"_3$, $"H"_2"SO"_4$], [Essigsäure, $"H"_2"CO"_3$],
)

= Neutralisation und Konzentrationsbestimmung durch Titration

== Neutralisation

Allgemein:

$"Säure" + "Base" -> "Salz" + "Wasser"$

Beispiel:

$"H"_2"SO"_4 + 2 "NaOH" -> "Na"_2"SO"_4 + 2"H"_2"O"$

Nettoionengleichung:

$"H"^+ + "OH"^- -> "H"_2"O"$

== Titration

- Äquivalenzpunkt: genau so viel Base wie Säure vorhanden
- Umschlagspunkt: Indikator wechselt die Farbe
- Bei einer guten Titration liegen beide Punkte nah beieinander.

#table(
  columns: (1.5fr, 1.5fr, 1.5fr),
  [*Titration*], [*pH am Äquivalenzpunkt*], [*Indikator*],
  [stark/stark], [$approx 7$], [Methylrot],
  [schwach/stark], [$> 7$], [Phenolphthalein],
  [stark/schwach], [$< 7$], [Methylorange],
)

== Berechnung einer Titration

$C_1 V_1 = C_2 V_2$ nur bei gleicher Stoffzahl-Relation im Reaktionsschema.

Bei $"HCl" + "NaOH" -> "NaCl" + "H"_2"O"$ gilt:

$C_("HCl") dot V_("HCl") = C_("NaOH") dot V_("NaOH")$

= Redoxreaktionen und Oxidationszahlen

== Regeln für Oxidationszahlen

#table(
  columns: (2.1fr, 1.3fr),
  [*Regel*], [*Beispiel*],
  [Elemente in elementarem Zustand], [$0$],
  [Einatomige Ionen], [Ladung],
  [Wasserstoff], [$+1$],
  [Sauerstoff], [$-2$],
  [Gesamtsumme im Molekül], [$0$],
  [Gesamtsumme im Ion], [Ionladung],
)

== Beispiele

=== Permanganat

$"MnO"_4^-$

$x + 4 dot (-2) = -1$

$x - 8 = -1$

$x = +7$

=> Mangan hat die Oxidationszahl $+7$.

=== Dichromat

$"Cr"_2"O"_7^{2-}$

$2x + 7 dot (-2) = -2$

$2x - 14 = -2$

$x = +6$

=> Chrom hat die Oxidationszahl $+6$.

== Redoxdefinition

- Oxidation: Verlust von Elektronen, Oxidationszahl steigt
- Reduktion: Aufnahme von Elektronen, Oxidationszahl sinkt
- Oxidationsmittel: nimmt Elektronen auf und wird reduziert
- Reduktionsmittel: gibt Elektronen ab und wird oxidiert

= Säure-Base-Reaktionen und Redoxreaktionen im Vergleich

#table(
  columns: (1.4fr, 1.6fr, 1.6fr),
  [*Merkmal*], [*Säure-Base-Reaktion*], [*Redoxreaktion*],
  [Prozess], [Protonenübergang], [Elektronenübergang],
  [Oxidationszahlen], [bleiben meist gleich], [ändern sich],
  [Beispiel], [$"HCl" + "NaOH"$], [$"Zn" + "Cu"^{2+}$],
)

= Redoxreaktionen in wässrigen Lösungen

== Beispiel 1: Eisen(II) mit Permanganat in saurer Lösung

$"Fe"^{2+} + "MnO"_4^- + "H"^+ -> "Fe"^{3+} + "Mn"^{2+} + "H"_2"O"$

Halbreaktionen:

$"Fe"^{2+} -> "Fe"^{3+} + "e"^-$

$"MnO"_4^- + 8"H"^+ + 5"e"^- -> "Mn"^{2+} + 4"H"_2"O"$

Gesamtgleichung:

$5"Fe"^{2+} + "MnO"_4^- + 8"H"^+ -> 5"Fe"^{3+} + "Mn"^{2+} + 4"H"_2"O"$

== Beispiel 2: Oxalat mit Permanganat

$5"C"_2"O"_4^{2-} + 2"MnO"_4^- + 16"H"^+ -> 10"CO"_2 + 2"Mn"^{2+} + 8"H"_2"O"$

== Wasserstoffperoxid

Wasserstoffperoxid kann je nach Reaktion als Oxidations- oder Reduktionsmittel wirken.

$"H"_2"O"_2 + 2"H"^+ + 2"e"^- -> 2"H"_2"O"$

$"H"_2"O"_2 -> "O"_2 + 2"H"^+ + 2"e"^-$

= Redoxreaktionen von Alkoholen und Aldehyden

== Oxidation primärer Alkohole

$"R-CH"_2"OH" + ["O"] -> "R-CHO" + "H"_2"O"$

$"R-CHO" + ["O"] -> "R-COOH"$

Beispiel:

$"CH"_3"CH"_2"OH" + ["O"] -> "CH"_3"CHO" + "H"_2"O"$

$"CH"_3"CHO" + ["O"] -> "CH"_3"COOH"$

== Oxidation sekundärer Alkohole

$"R"_2"CHOH" + ["O"] -> "R"_2"C=O" + "H"_2"O"$

Beispiel:

$("CH"_3)_2"CHOH" + ["O"] -> ("CH"_3)_2"C=O" + "H"_2"O"$

== Tertiäre Alkohole

Tertiäre Alkohole sind unter normalen Bedingungen nicht oxidierbar, weil am alkoholischen C-Atom kein H-Atom vorhanden ist.

== Aldehyde als Reduktionsmittel

Aldehyde geben positive Fehling- und Tollens-Tests:

$"R-CHO" + 2"Cu"^{2+} + 5"OH"^- -> "R-COO"^- + "Cu"_2"O" + 3"H"_2"O"$

$"R-CHO" + 2["Ag"("NH"_3)_2]^+ + 3"OH"^- -> "R-COO"^- + 2"Ag" + 4"NH"_3 + 2"H"_2"O"$

== Vergleich von Alkohol- und Aldehydoxidation

#table(
  columns: (1.4fr, 1.3fr, 1.3fr),
  [*Substanz*], [*Oxidationsprodukt*], [*Bemerkung*],
  [primärer Alkohol], [Aldehyd → Carbonsäure], [zweistufig],
  [sekundärer Alkohol], [Keton], [einstufig],
  [tertiärer Alkohol], [keine normale Oxidation], [kein H am C-OH],
  [Aldehyd], [Carbonsäure], [sehr leicht oxidierbar],
)

#pagebreak()

== Merksätze

- Katalysatoren senken die Aktivierungsenergie, nicht die Reaktionsenthalpie.
- Isomere haben dieselbe Molekularformel, aber unterschiedliche Strukturen.
- Zwischenmolekulare Kräfte bestimmen Siedepunkt, Löslichkeit und Aggregatzustand.
- Säure-Base-Reaktionen handeln von Protonen, Redoxreaktionen von Elektronen.
- Oxidationszahlen helfen, Redoxgleichungen zu erkennen und auszugleichen.
- Primäre Alkohole lassen sich zu Aldehyden und dann zu Carbonsäuren oxidieren.
- Sekundäre Alkohole ergeben Ketone.
- Aldehyde sind leicht oxidierbar und geben positive Fehling-/Tollens-Tests.

#pagebreak()

#align(center)[
  #text(size: 22pt, weight: "bold")[Viel Erfolg beim Test!]
  #v(1em)
  #text(size: 12pt)[Wiederhole die Grundlagen, übe Redoxgleichungen und mache viele kleine Aufgaben.]
]
