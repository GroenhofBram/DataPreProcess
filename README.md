# !!!: Het bestand `Rcommands_YAOA_RT_comparison.R` is denk ik het belangrijkst. Deze is te vinden in `src`. Dit is de "nieuwe" code. 
- `files` bevat alle bestanden die ik inlees/gebruik.
- `output` bevat output. In dit geval een screenshot van de regel die nu ingevuld is a.d.h.v. de participantdata die via de mail gestuurd was.

# Overzicht van de veranderingen die ik gemaakt heb: Dit is ALLES wat ik heb aangepast. De belangrijkste veranderingen staan onderaan.
### Libraries/Packages
Alle `install.packages(...)` en `library(...)` code staan nu bovenaan de code. Dit is voorkeur, dus kan veranderd worden.
- Dit gaf een error omdat je `library("stringr")` aanriep. Dit is een irritant dingetje bij R: `install.packages("naam_van_package")` is correct. Maar bij `library(...)` is het altijd zonder accolades: `library(naam_van_package)`.

### Filepaths
Omdat ik iets anders met filepaths werk, heb ik deze dus ook moeten aanpassen zodat de bestanden goed werden ingelezen/geschreven. Deze kun je zelf aanpassen door `setwd(...)` uit te voeren en dan de bestanden aan te roepen zoals in de code die jij stuurde.

### Data 2 inlezen
`data1[grepl("prac", data2$audio),]$Test <- "P"` werd aangeroepen voordat data2 was aangemaakt, dit gaf een error.

Ik heb daarom `data2 <-data1[data1$Test == "T", ]` nu eerst uitgevoerd.

### functie picture type info
`implementeer_picturetype_info <<- function(data_in_df){...}` heb ik uit de comments gehaald. Als je de functie wil gebruiken, klik eerst op deze regel en toets dan `control` en `enter` in. Dit zet de functie klaar.

- `data2 <- implementeer_picturetype_info(data2)` voert de functie dan uit op `data2` en slaat het op in `data2` (dus de nieuwe informatie wordt toegevoegd).
- Ook hier: Als je zonder de functie wil werken, kun je zoals je eerder ook deed gewoon de functie weg commenten. 

### Weghalen ".wav" uit data2$audio

Kleine aanpassing voor zekerheid: `data2$audio <- str_replace(data2$audio, ".wav$", "")`. Ik heb hier het dollarteken toegevoegd aan wat R zoekt om te vervangen met niks. Dit zorgt er voor dat hij alleen ".wav" weghaalt als dit ook daadwerkelijk aan het einde van de naam staat (ik denk niet dat ".wav" ergens middenin de tekst kan staan hoor, maar hier liepen we toen tegenaan. Dus liever zeker!)

### Aanmaking data3
Hier had je `data3=merge(x=data2, y=cuewordinfo, by.x = "audio", by.y= "file", all.x = TRUE)`. R kan tegen problemen aanlopen als je `=` gebruikt in plaats van `<-`. Dus dit heb ik gewijzigd.

### Weghalen output data3
Dit heb ik alleen gedaan voor mijn eigen overizcht. Wederom: Voorkeur dus niet cruciaal.

### Subject nummer veranderen data3
Zelfde verandering als eerder (`=` --> `<-`): `data3$subject_nr <- as.character(data3$subject_nr)`

### lijst van files krijgen
Dit gaat niet fout in jouw code: `files <- list.files(pattern = "\\.wav\\.Table$")` werkt. Deze heb ik in comments gezet omdat ik dit iets moest aanpassen voor op mijn computer.
- Je kan `files <- list.files(path = "files", pattern = "\\.wav\\.Table$", full.names = TRUE)` dus weghalen/uitcommenten en de andere regel gebruiken.

### aanmaken `m` in functie `voeg_respinfo_toe` 
Zelfde verandering als eerder (`=` --> `<-`): `m <- strsplit(file_name, '_')`

# !!!!!: Problemen met de functie.
De fout gebeurt in de functie hierbij:
```R
	    data4[data4$item == item & data4$CondType == Cond_type & data4$subject_nr ==
	      subject_nr,]$Q_offsetT <- Q_offsetT 
      data4[data4$item == item & data4$CondType == Cond_type & data4$subject_nr ==
        subject_nr,]$Resp_acc <- Resp_acc
      data4[data4$item == item & data4$CondType == Cond_type & data4$subject_nr ==
        subject_nr,]$Resp_onsetT <- Resp_onsetT 
      data4[data4$item == item & data4$CondType == Cond_type & data4$subject_nr ==
        subject_nr,]$Resp_dur <- Resp_dur
```

Dit komt omdat R geen enkele overeenkomsten vindt, waardoor het "iets" probeert in te vullen met "niets".

## !!!: Het probleem
### LET OP: Klopt dit? Ik ga er hier vanuit dat dit bij jou ook misgaat hierom, omdat hij de bestanden niet of verkeerd inleest.
Het duurde voor mij ook erg lang om erachter te komen wat het probleem was, maar het zat hem in de bestandsnamen. 

- De bestandsnamen die de originele functie goed kan bewerken zien er als volgt uit: "mijntabel_49_L_prijs_oren.wav.Table".

- De bestandsnamen (althans het voorbeeld dat jij stuurde, dus ik hoop alles die deze functie moet bewerken: "mijntabel_subj-1101_1_E_hinnikt_dier.wav_1.wav.Table".

Hierdoor ging het mis, omdat de bestandsnamen dus anders gestructureerd waren. De code split de bestandsnamen op gebaseerd op "_", en dat leidt tot andere posities van de benodigde informatie.

De belangrijkste wijziging:

- `files <- list.files(pattern = "\\.wav\\.Table$")` --> `files <- list.files(pattern = "^mijntabel_subj-.*\\.wav\\.Table$")`: De nieuwe leest alleen de bestandsnamen in van de bestanden met de nieuwe bestandsnaamstijl ("mijntabel_subj-...").


Ik heb daarnaast aan het stukje hierboven verschillende veranderingen gemaakt zodat de variabelen nu wel overeenkomen en toegevoegd worden met deze nieuwe bestanden.

- `Resp_acc = as.character(0)` --> `Resp_acc = "EMPTY"`: Dit is denk ik iets duidelijker, ik maak hier deze kolom aan en vul hem een placeholder.

- `m <- strsplit(file_name, '_')` heb ik bovenin de functie gezet omdat ik hier alle informatie over de participant uit ophaal.

- `subject_nr <- str_sub(file_name, 6, 9)` --> `subject_nr_string <- m[[1]][2]` & `subject_nr <- as.numeric(str_extract(subject_nr_string, "\\d+$"))`: Dit pakt nu correct het subject nummer (dus als de bestandsnaam "subj-1234_1_E_woord_woord2_wav_1" is pakt dit 1234)

- `item<-m[[1]][2]` --> `item <- as.numeric(m[[1]][3])`: Dit pakte eerst een stuk tekst, en niet het daadwerkelijke itemnummer.

- Een paar `table_data` waren `int`s. Ik heb deze geconverteerd naar `numeric`s: `table_data$dur <- as.numeric(table_data$dur)` en `table_data$totdur <- as.numeric(table_data$totdur)`.

- `Cond_type <- str_extract(file_name, "[A-Z]")` --> `Cond_type <- str_extract(file_name, "(?<=_)[A-Z](?=_)")`: Conditie type wordt nu alleen gepakt uit de filename als het 1 hoofdletter is omsingeld door "_" (Dus: bij filename "xxx_E_xxx_" pakt het "E").

De oude functie staat er nog in, de nieuwe functie heet `voeg_respinfo_toe_nieuwe_namen()`

- Als het goed is kun je de code (nadat je de filepaths hebt aangepast voor jouw machine/de working directories hebt goed gezet) draaien door in R studio alle regels te selecteren en op `control` + `enter` te drukken.

  - Tip: Selecteer eerst de regels met `library(package_naam)` en draai deze los met `control` + `enter`. Zet deze daarna in comments. Deze hoef je maar 1 keer te draaien (hetzelfde voor `install.packages(...)`).








