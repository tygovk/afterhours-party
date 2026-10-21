# Afterhours — persoonlijke partygame

Responsive HTML/CSS/Vanilla JavaScript-app, zonder buildstap. Installeerbaar op het beginscherm via Safari (Delen → Zet op beginscherm) of Chrome (App installeren).

## Verplicht account en eigen inrichting

Een account is verplicht om te spelen. De app controleert Supabase Auth via getUser(), laadt het eigen profiel en opent daarna de lobby. Registratie vereist e-mailbevestiging. Na uitloggen verdwijnen de vorige bibliotheek en het profiel uit het geheugen.

Afterhours deelt Supabase-project lxqzkrdotiorqskfjrhs met AI-database. De accountregistratie is gedeeld; de eigen tabellen en private videomap zijn afgeschermd per gebruiker.

Via Mijn bibliotheek → Mijn huisregels, Instellingen → Mijn huisregels en profiel, of Aanpassen in de lobby kun je maximaal 100 huisregels van 400 tekens beheren. Geef je avond een eigen naam. Schakel individuele regels in of uit en bekijk de actieve regels tijdens het spel via Onze huisregels. De groep past de regels zelf toe.

Huisregels, de naam van de avond, spelers, categorieën, donkere modus, geluid en de aangepaste kaartenset synchroniseren automatisch met afterhours_profiles. De opslagstatus geeft aan of opslaan gelukt is. Op verschillende apparaten geldt de laatst opgeslagen versie. Nog niet gesynchroniseerde wijzigingen blijven als gebruikersgebonden concept op het apparaat staan. Via Bestaande lokale kaarten meenemen kun je eerdere lokale kaarten expliciet aan je profiel toevoegen.

## Opdrachten en video's

Maak in Mijn bibliotheek opdrachtkaarten met categorie en type. Koppel een HTTPS-videolink of een MP4/WebM/MOV-upload van maximaal 50 MB. YouTube en Vimeo spelen in de app; andere HTTPS-links openen extern. De afspeelbaarheid van videobestanden hangt af van de browser; MP4 wordt aanbevolen. Uploads staan in de private bucket afterhours-videos met toegang op basis van gebruikers-ID. Alleen een publishable key is opgenomen in de client.

## Spel

2–20 unieke spelers. De minst gekozen beschikbare spelers krijgen voorrang bij rolverdeling; twee rollen op één kaart zijn altijd verschillend. Kaarten herhalen pas als de set op is. Sidequests verlopen na het ingestelde aantal volgende kaarten. Timers starten handmatig. Stemmen gebeurt door de telefoon door te geven.

24 voorbeeldkaarten staan in cards.js en example-cards.json. Categorieën: warmup, silly, caliente, custom. Types: standard, sidequest, timer, vote, group, duel. JSON-import voegt gevalideerde kaarten toe.

## Offline gebruik

Bij het openen is internet nodig om het account te controleren en het profiel te laden. Een al gestart spel met lokale kaarten kan bij netwerkverlies doorgaan. Inloggen, synchroniseren, de cloudbibliotheek en video's vereisen internet. Ronde, stemmen en timers resetten bij herladen.

## Starten en deployen

Serveer deze map via localhost of HTTPS, bijvoorbeeld npx serve . Importeer de GitHub-repository in Vercel als Other, zonder buildcommando en met rootdirectory ./.

Productie: https://afterhours-party-five.vercel.app/

## Beheerder en standaardspeltypes

Het beheerdersaccount is tygovk@outlook.com. De rol staat in afterhours_admins en kan niet vanuit de app door gebruikers worden gewijzigd. Databasebeleid controleert alle schrijfacties; alleen een knop verbergen is niet de beveiliging.

Ga naar Mijn bibliotheek → Beheer speltypes of Instellingen → Algemene regels en speltypes. Algemene gepubliceerde regels gelden bij elke speelwijze. Een standaardspeltype heeft een naam, beschrijving, eigen regels, standaardcategorieën en toegestane kaarttypes. Bewaar als concept of vink Beschikbaar voor iedereen aan. Terug naar concept haalt een regel of speltype uit de openbare keuzelijst zonder het te wissen.

Iedere ingelogde speler ziet de gepubliceerde speltypes in de lobby. Eigen keuze gebruikt alleen de zelf toegevoegde en aangevinkte opdrachten. Je persoonlijke huisregels worden gecombineerd met de algemene regels en de speltyperegels. Regels worden bij het starten van een spel vastgezet, zodat een lopend spel niet onverwacht verandert door een publicatie. Nieuwe inhoud verschijnt bij het laden of door de app opnieuw te laden. De gekozen spelmodus wordt bewaard in je profiel.

## Spelopbouw met vier varianten
Na aanmelden: spelers invoeren, variant kiezen, vervolgens SPEEL. De drie gepubliceerde standaardvarianten hebben elk hun eigen opdrachtenlijst. Als beheerder kun je in Instellingen → Beheren → Speltypes de titel, regels, positie (1–3) en opdrachten wijzigen. Een gepubliceerde positie kan maar één variant bevatten.

Eigen keuze begint leeg. Spelers voegen eigen opdrachten toe, kiezen optionele voorbeelden met selectievakjes of gebruiken kaarten/video’s uit hun privébibliotheek. Geef de set een naam en bewaar deze op het account. SPEEL bewaart nieuwe of aangepaste sets automatisch voordat het spel begint. Een bewaarde set kan later gekozen en aangepast worden. Opgeslagen spellen staan in `afterhours_games` met toegangscontrole per account. Een lopend spel gebruikt een vaste kopie van de gekozen opdrachten en regels.
