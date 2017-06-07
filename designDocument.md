# Design Document - Producitfy
## Programmeerproject - Maxim Stomphorst - 11436727



## An overview of your application
### main
Je selecteerd aan welke taak je gaat werken (wiskunde), wat je gaat studeren (h1 en h2) en voor welke tijd je dit gaat doen (25min). 

Als je klaar bent vul je in hoe goed de activiteit ging (slecht, medium, goed) en wat je daadwerkenlijk hebt gedaan. 

Dit word verstuurd naar firbase. 
 

#### A diagram of modules, classes and functions that you’ve decided to implement, in appropriate detail
##### modules
##### classes
**Class Timer()** {  
Deze class zorgt er voor dat de timer loopt en geeft een melding als de tijd op 0 staat.  
}

**Class Firbase()** {  
Moet zorgen voor inlog functionaliteit en een manier om te lezen/ schrijven/ en mutaties door te geven aan de database.   
}  
**Class Helper()** {  
Voor debuggen.  
}
##### Functions
Ik weet nog niet goed of ik nog meer speciefieken functies kan benoemen, ik denk dat de meeste functies wel in de Firbase class kunnen omdat hier alle info uit zal worden opgehaald.  
Daarnaast zijn er nog wat functies die ik in mijn hoofd heb maar dit zijn meer opties voor als er tijd over is. 

#### Advanced sketches of your UI that clearly explain which features are connected to which underlying part of the code. 
In de MainViewController wordt alle informatie verzammeld dit wordt verstuurd naar fibase. vervolgens wordt het in de History view opgevraagd en aan de user terug gegeven. 

#### A list of APIs and frameworks or plugins that you will be using to provide functionality in your app
- The fibase API

#### A list of data sources if you will get data from an external source
- History view krijgt dat data van FireBase.

#### A list of database tables and fields (and their types) if you will use a database
.userid  
..timestamp (voor activiteit)  
......activiteit  
......wat ga je doen   
......Hoelang is er gewerkt   
......Wat heb je echt gedaan   
......Hoe ging het   