# Afterhours

Responsive Nederlandstalige partygame, gebouwd met HTML, CSS en Vanilla JavaScript. Geen build of dependencies nodig. Alle opmaak staat lokaal, zodat de app offline werkt zonder CSS-framework of CDN.

## Starten

Open index.html voor direct lokaal spelen. Voor installatie en offline caching: serveer deze map via localhost of HTTPS, bijvoorbeeld met `npx serve .`. Open daarna de getoonde URL. De service worker slaat de app na de eerste online laadbeurt op. Externe fonts zijn optioneel; offline worden systeemfonts gebruikt.

## Spelen

Voeg 2–20 unieke spelers toe, selecteer categorieën en start. Iedere getrokken kaart is één ronde. Persoonlijke rollen worden willekeurig toegewezen aan de minst gekozen beschikbare spelers. De twee rollen op een kaart zijn altijd verschillend. Groepskaarten zonder rollen tellen niet als persoonlijke beurt. Kaarten worden zonder herhaling getrokken totdat de gekozen set op is.

Sidequests vervallen na het opgegeven aantal volgende kaarten. De timer start handmatig en kan worden gepauzeerd. Stemmen gebeurt door de telefoon door te geven: iedere speler brengt één stem uit. Dit is een lokaal spel op één apparaat, geen online multiplayer. De groep beoordeelt de uitvoering van opdrachten en duels.

De kaartenstudio werkt ook tijdens het spel. Import voegt kaarten toe aan de bestaande set en valideert de volledige invoer voordat iets verandert. Export bevat de volledige huidige set. LocalStorage bewaart spelers, kaarten, categorieën en instellingen. De lopende ronde, stemmen, timers en sidequests worden bij herladen gereset.

## Kaartformaat

Een JSON-array met objecten: `{"text":"{speler1}, geef {speler2} een compliment.","category":"custom","type":"standard","duration":3,"seconds":10}`.

Categorieën: `warmup`, `silly`, `caliente`, `custom`. Types: `standard`, `sidequest`, `timer`, `vote`, `group`, `duel`. Duur: 1–20 rondes; timer: 3–120 seconden. Tekst: maximaal 600 tekens. De 24 voorbeeldkaarten staan in `cards.js` en als losse dataset in `example-cards.json`.

## Publicatie

Upload deze map naar een GitHub-repository. Importeer de repository in Vercel als framework **Other**, zonder build command, met deze map als root. `vercel.json` configureert statische hosting. Pushes naar de productiebranch worden via de Vercel Git-integratie automatisch gepubliceerd.

Installatie op iOS: Safari → Delen → Zet op beginscherm. Op ondersteunde browsers verschijnt een installatieknop. Voor brede ondersteuning zijn ook PNG-iconen van 192 en 512 pixels meegeleverd.
