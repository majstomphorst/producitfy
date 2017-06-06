# Proposal - Producitfy
## Programmeerproject - Maxim Stomphorst - 11436727
### The problem to be solved.
De behoeften om studie / werk activiteiten bij te houden. Om vervolgens een overzicht te bieden van de verrichten activiteiten per dag en of per week.

Een manier om een gebruiker te stimuleren om productief te zijn. 

### What features will be available to solve the problem.
- Een manier om studie activiteiten te bewerken/ maken/ veranderen/ verwijderen. (met plaatjes)
- Een manier om activiteiten bij te houden (een activiteit te loggen).
- Een activiteit handmatig toe voegen. (als je de app niet bij de hand hebt gehad.)
- Een manier om je activiteiten terug te zien bij dag / week.


### A sketch.
![proposal sketch](https://github.com/majstomphorst/producitfy/blob/master/doc/proposal_sketch.jpg?raw=true)


### How to store data.
De keuze die ik had was SQLlite of Firebase, na overleg met de staff is er gekozen voor <b>Firebase</b>. <br>
Omdat dit direct de mogenlijkheid bied om informatie te synchroniseren ook is de API implenentatie van Firebae gemakenlijker dan die van sqlite in [`swift`](https://github.com/stephencelis/SQLite.swift) 


### What separate parts of the application can be defined.

##### 01 - Main
Dit is de main controller waar je de activiteit kan starten.
##### 02 - Overview
Is de terugblik op de dag of week. Zodat je kan zien wat je hebt gedaan.
##### 03 - Manual log
Dit is een scherm waar je zelf activiteiten kan loggen zonder de timer te laten lopen. 
##### 04 - Settings
Hier kan je de isntellingen van de app aanpassen. 


### External components (online APIs, libraries etc.)
- [Firebase](https://firebase.google.com/) 


### Technical problems or limitations.
1. De visualisatie van de activiteiten in bar charts of pie chart. [optional]
2. Het opzoeken van specifieke activiteiten in firbase.


### A review of similar mobile apps or related visualizations.
Ik heb een aantal apps gevonden die soortelijke functionaliteit leveren maar ze zijn niet gericht op het bijhouden van studie activiteiten.

- [Productive](https://itunes.apple.com/us/app/productive-habits-daily-goals-tracker/id983826477?mt=8)<br>
Deze app bied wel wat functie om je te helpen om te focuesen op een taak maar deze is meer gericht op het ontwikkelen van habits.

- [Focus keeper](https://itunes.apple.com/nl/app/focus-keeper-work-study-timer/id830466924?mt=8)<br>
Is en app die enkel een timer bied om je te helpen met werken wel zitten er meer functies onder deze zijn echter wel "pro" en kosten dus geld.

- [Miracle Timer](https://itunes.apple.com/us/app/miracle-timer-be-productive-perfect-for-work-study/id1083895559?mt=8)<br>
Deze app geeft je enkele functies om een bepaalde tijdseenheid gefocust te werken maar heeft geen functie om bij te houden wat je hebt gedaan.

### Minimum features
1. Het selecteren van een activiteit.<br> 
2. Het bijhouden van een studie/activiteit.<br>
 - Met een timer.
 - De focus tijd instellen.
 - Met een notitie.
3. Een manier om een overzicht te krijgen van de afgelopen activiteiten per dag.
 - Het zien van de notitie.
 - Het zien vah het activiteit's plaatje.

### Optional features
1. Het uploaden van activiteit's plaatjes.
2. Het maken van een bar chart en of pie chart.
3. Syncronisatie mogenlijkheid.
4. Een Manier om activiteiten na der hand aan te passen. 