# Exit Report of Project <X>  for Liander <Y>


Customer: <Liander\>

Team Members: <Bart Bosveld, Yuri Gietman en Christine Gijsbertsen\>

##	Overview
Voor Liander hebben wij een onderzoek gedaan naar de relatie tussen het verbruik van gas en elektriciteit in relatie tot het bouwjaar van een huis, de gezinssamenstelling en het type huis. Door te onderzoeken of er een relatie tussen deze variabelen is kan er een advies worden gegeven aan Liander om verbeteringen te maken in hun business model.  


##	Business Domain
Liander is een netbeheer dat leidingen en kabels aanlegt. Daarnaast beheert zij het energie netwerk in verschillende regio's. 

##	Business Problem
<Business problem and exact use case(s), why it matters\>
Liander heeft al sinds 1940 data gemeten op gebied van gas en elektriciteit. Ze hebben deze data maar hebben nog niet inzichtelijk welke campagne het beste zal werken, gericht op een variabele uit de meeting. Dit onderzoek is er op gericht in hoeverre de variabelen van invloed zijn op het gas en elektriciteitsverbruik. 

##	Data Processing
We hebben twee datasets gebruikt en dezen samengevoegd. 

### Originele datasets
De datasets meten het gas en electriciteit vanaf 1940 tot en met heden (zie data: LianderKV01012018.xlsx & LianderKV01012018.xlsx 2). De eerste dataset gaat over rijtjeshuizen en het tweede dataset gaat over twee-onder-een-kap woningen. De data is vervolgens per bouwjaar en per gezinssamenstelling opgeslagen. Bijvoorbeeld hieronder gecategoriseerd in bouwjaar en type gezin, in dit voorbeeld een jong alleenstaande vrouw. 

| voor 1940 | 1940 t/m 1959 | 1960 t/m 1969 | 1970 t/m 1979 | 1980 t/m 1989 | 1990 t/m 1999 | 2000 t/m heden |
|---------- | ------------- | ------------- | ------------- | ------------- | ------------- | -------------- |
| E 3.487 | E 3.342 | E 3.782 | E 3.676 | E 3.394 | E 3.369 | E 2.998 |
| G 2.212 | G 1.722 | G 1.677 | G 1.574 | G 1.416 | G 1.380 | G 1.054 | 

### Geconstrueerde dataset
Wij hebben de twee datasets samengevoegd tot een door het verbruik te meten variabelen (kolommem) type woning, bouwjaar, gezinssamenstelling, gasverbruik en elekticiteitsverbruik (zie data: Liander.csv). 
Bijvoorbeeld, 

| Bouwjaar | gezinssamenstelling |type woning | elektriciteit | gas |
| -------- | ------------------- | ---------- | ------------- | --- |
| > 1940 | JA | rijtje | 3.487 | 2.212 | 

In onze samengevoegde dataset gebruiken we de volgende afkortingen. 

| Afkorting | uitleg |
| --------- | ------ |
| JA | jong alleenstaand |
| JPZK | jong paar zonder kinderen |
| GMAJK | gezin met alleen jonge kinderen |
| GJOK | gezin met jonge en oudere kinderen |
| MPZK | middelbaar paar zonder kinderen |
| OPZK | ouder paar zonder kinderen |
| MA | middelbaar allenstaand |
| OA | ouder alleenstaand |

### Fouten en missende waarden
Daarnaast zaten er in één tabel de volgende fouten, in de tabel gezin met jonge en oudere kinderen, bij het elektriciteitsverbruik. 

| voor 1940 | 1940 t/m 1959 | 1960 t/m 1969 | 1970 t/m 1979 | 1980 t/m 1989 | 1990 t/m 1999 | 2000 t/m heden |
|---------- | ------------- | ------------- | ------------- | ------------- | ------------- | -------------- |
| E 4.71 | 6 E 4.51 | 6 E 4.423 | E 4.064 | E 4.35 | 8 E 4.985 | E 3.950|

De laatste getallen zijn versprongen naar de volgende kolom. Dit is in het 'nieuwe' dataset goed gezet.
Daarnaast zijn van de ouderen alleenstaand vanaf 2000 t/m heden geen variabelen gemeten. 

Bovendien hebben we in de volgende cellen een aantal spaties tussen de waardes verwijderd: D33, G13 en G42 en miste er een aantal waardes in de laatste rij van de (gecontrueerde) dataset. 

### Implementatie - preprocessing
Om een statistische analyse te kunnen uitvoeren, hebben we de dataset ingelezen en vervolgens de kolommen bouwjaar, type woning en gezinssamenstelling categorisch opgeslagen (implementatiedetails zijn te vinden in code/analysis.R).
Daarnaast hebben we vanwege de missende waarden de complete laatste rij van de geconstrueerde dataset niet meegenomen in de analyse.

##	Modeling, Validation
Het dataset bevat onafhankelijke waardes van nominale waarde. We hebben eerste getest of de waardes: bouwjaar, type woning en gezinssamenstelling correleren met elektriciteit of gas. In deze test wordt er gekeken naar de kracht van het verband, bij een correlatie van 0 is er geen verband, hoe hoger de waarde hoe krachtiger het verband. 
In de analyse wordt de functie complete.obs gebruikt, deze maken de paren compleet. 

Omdat correlatie geen causatie is hebben we vervolgens een chi-kwadraat test uitgevoerd. Bij dezen chi-kwadraat hebben getest of twee verdelingen van elkaar verschillen. In onze casus wordt er gekozen voor een onafhankelijkheidstest. Hierin wordt onderzocht of de simultane verdeling bestaat uit twee onafhankelijke. In de test voor dit onderzoek zullen de variabelen: bouwjaar, gezinssamenstelling en type woning getoetst worden of ze significant samenhangen met het gebruik van gas of/en elextriciteit. 
Hierbij wordt gekeken naar de P waardes. Een P >  0.05, dan is er geen significant verband tussen de categorische variabelen. 
Een P < 0.05, dan is er wel een significant verband tussen de categorische variabelen. 
In de analyse wordt de functie simulate.p.value = TRUE gebruikt, omdat de dataset te klein is voor de analyse en daardoor steeds een foutmelding gaf. Deze functie geeft extra waardes waardoor beter gemeten kan worden. 


##	Solution Architecture
Voor de analyse is gekozen voor een correlatietest en een chi-kwadraat toets omdat de dataset bestaat uit onafhankelijke waarnemingen op nominaal niveau. 

### 1. Correlatietest

| variabele | gas | elektriciteit |
| ------ | --- | ------------- |
| bouwjaar | -0.5875286 | 0.251412 |
| gezinssamenstelling | -0.1015118 | -0.6203572 |
| type woning | 0.5721096 |  0.3312101 |

Om in te schatten of de variabelen met elkaar samen hangen, dient de bovenstaande tabel geanalyseerd te worden. In het model werd gesteld dat er geen sprake is van correlatie bij een waarde van 0 en hoe hoger de waarde des te hoger de correlatie. Van de drie variabelen kan geconcludeerd worden dat type woning de krachtigste correlatie heeft, dus dat de type woning de meeste invloed heeft op het gas en elektrisiteits verbruik. Deze is echter nog erg laag voor een correlatie. 

### 2. Chi-kwadraat toets

| variabele | gas | elektriciteit |
| ------ | --- | ------------- |
| bouwjaar | 0.02199 | 0.4213 |
| type woning | 0.4898 | 0.7486|
| gezinssamenstelling | 0.9995 | 0.8526 |

Het enige significate verband tussen de variabelen is bij de variabelen bouwjaar en gas P: 0.02199 < 0.05. Er is dus een significant verband tussen het type bouwjaar van het huis en het gas verbruik. Bij de andere resulaten wordt er geen significant verband gemeten aangezien deze allemaal >0.05 zijn en zijn deze variabelen dus afhankelijk. Deze test is belangrijk omdat het inzicht geeft in de verbanden tussen de variabelen en met deze resultaten kan Liander ook beter inspelen op de afhankelijke veriabelen

##	Benefits
	
### Company Benefit (internal only. Double check if you want to share this with your customer)
Nu Liander weet dat er een significant verband is tussen het gas verbruik en het bouwjaar van het huis, kan zijn hier op anticiperen door haar marketing campagene hierop af te stemmen.

### Customer Benefit
Als de klant weet dat het bouwjaar van een huis van invloed is op het gasverbruik, kan zij beter onderzoeken of gas wel een juiste oplossing voor haar is en ze wellicht beter elektrischiteit kan gebruiken. 

##	Learnings
### Project Execution
Niet van toepassing.

### Data science / Engineering
Door dit project hebben we geleerd hoe met R-studie te werken en hierin data-analyses uit te voeren. 

### Domain
In de casus gaat het om het verbruik van gas en elektriciteit en welke variabele daar van invloed op kunnen zijn laat zien waar je op moet letten als je verbruik van gas en elektriciteit interpreteerd. Daarnaast geeft een beeld in wat Liander doet. 

### Product
Niet van toepassing.

### What's unique about this project, specific challenges
Het was een relatief klein dataset met verschillende waardes, waardoor het meeste werk vooral in de dataprocessing zat. Dit was nuttig omdat door dit onderzoek we kennis gemaakt het met de analyze technieken van data analyse. 

##	Links
Repository: https://github.com/christinegijsbertsen/onderzoekDPK 


## Appendix
Tilburg University, (z.d.). Crosstab. Geraadpleegd van https://www.tilburguniversity.edu/nl/studenten/studie/colleges/spsshelpdesk/edesk/crosstab/
SPSS Handboek, (z.d.). Correlatie analyse - Hoe het werkt. Geraadpleegd van https://spsshandboek.nl/correlatie/ 

