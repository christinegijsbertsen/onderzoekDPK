# Exit Report of Project <X> for Customer <Y>

Instructions: Template for exit criteria for data science projects. This is concise document that includes an overview of the entire project, including details of each stage and learning. If a section isn't applicable (e.g. project didn't include a ML model), simply mark that section as "Not applicable". Suggested length between 5-20 pages. Code should mostly be within code repository (not in this document).

Customer: <Liander\>

Team Members: <Bart Bosveld, Yuri Gietman en Christine Gijsbertsen\>

##	Overview

<Executive summary of entire solution, brief non-technical overview\>


##	Business Domain
Liander is een netbeheer dat leidingen en kabels aanlegt. Daarnaast beheert zij het energie netwerk in verschillende regio's. 

##	Business Problem
<Business problem and exact use case(s), why it matters\>
Liander heeft al sinds 1940 data gemeten op gebied van gas en elektriciteit. Ze hebben deze data maar hebben nog niet inzichtelijk welke campagne het beste zal werken, gericht op een variabele uit de meeting. Dit onderzoek is er op gericht in hoeverre de variabelen van invloed zijn op het gas en elektriciteitsverbruik. 

##	Data Processing
<Schema of original datasets, how data was processed, final input data schema for model\>
We hebben twee datasets gebruikt en dezen samengevoegd. De datasets meten het gas en electriciteit vanaf 1940 tot en met heden. De eerste dataset gaat over rijtjeshuizen en het tweede dataset gaat over twee-onder-een-kap woningen. De data is vervolgens per bouwjaar en per gezinssamenstelling opgeslagen. Bijvoorbeeld hieronder gecategoriseerd in bouwjaar en type gezin, in dit voorbeeld een jong alleenstaande vrouw. 

| voor 1940 | 1940 t/m 1959 | 1960 t/m 1969 | 1970 t/m 1979 | 1980 t/m 1989 | 1990 t/m 1999 | 2000 t/m heden |
|---------- | ------------- | ------------- | ------------- | ------------- | ------------- | -------------- |
| E 3.487 | E 3.342 | E 3.782 | E 3.676 | E 3.394 | E 3.369 | E 2.998 |
| G 2.212 | G 1.722 | G 1.677 | G 1.574 | G 1.416 | G 1.380 | G 1.054 | 

Wij hebben de twee datasets samengevoegd tot een door het verbruik te meten variabelen (kolommem) type woning, bouwjaar, gezinssamenstelling, gasverbruik en elekticiteitsverbruik. 
Bijvoorbeeld, 

| Bouwjaar | gezinssamenstelling |type woning | elektriciteit | gas |
| -------- | ------------------- | ---------- | ------------- | --- |
| > 1940 | JA | rijtje | 3.487 | 2.212 | 

Om de data efficient te verwerken hebben we de data categorisch opgeslagen. Hierbij gebruiken we de volgende afkortingen. 

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

Daarnaast zaten er in één tabel de volgende fouten, in de tabel gezin met jonge en oudere kinderen, bij het elektriciteitsverbruik. 


| voor 1940 | 1940 t/m 1959 | 1960 t/m 1969 | 1970 t/m 1979 | 1980 t/m 1989 | 1990 t/m 1999 | 2000 t/m heden |
|---------- | ------------- | ------------- | ------------- | ------------- | ------------- | -------------- |
| E 4.71 | 6 E 4.51 | 6 E 4.423 | E 4.064 | E 4.35 | 8 E 4.985 | E 3.950|

De laatste getallen zijn versprongen naar de volgende kolom. Dit is in het 'nieuwe' dataset goed gezet.
Daarnaast zijn van de ouderen alleenstaand vanaf 2000 t/m heden geen variabelen gemeten. 

##	Modeling, Validation
<Modeling techniques used, validation results, details of how validation conducted\>

##	Solution Architecture
<Architecture of the solution, describe clearly whether this was actually implemented or a proposed architecture. Include diagram and relevant details for reproducing similar architecture. Include details of why this architecture was chosen versus other architectures that were considered, if relevant\>

##	Benefits
	
###	Company Benefit (internal only. Double check if you want to share this with your customer)
<What did our company gain from this engagement? ROI, revenue,  etc\>

###	Customer Benefit
What is the benefit (ROI, savings, productivity gains etc)  for the customer? If just POC, what is estimated ROI? If exact metrics are not available, why does it have impact for the customer?\>

##	Learnings

### 	Project Execution
<Learnings around the customer engagement process\>

### Data science / Engineering
<Learnings related to data science/engineering, tips/tricks, etc\>


### Domain
<Learnings around the business domain, \>


### Product
<Learnings around the products and services utilized in the solution \>

###	What's unique about this project, specific challenges
<Specific issues or setup, unique things, specific challenges that had to be addressed during the engagement and how that was accomplished\>

##	Links
<Links to published case studies, etc.; Link to git repository where all code sits\>


##	Next Steps
 
<Next steps. These should include milestones for follow-ups and who 'owns' this action. E.g. Post- Proof of Concept check-in on status on 12/1/2016 by X, monthly check-in meeting by Y, etc.\>

## Appendix
<Other material that seems relevant – try to keep non-appendix to <20 pages but more details can be included in appendix if needed\>
