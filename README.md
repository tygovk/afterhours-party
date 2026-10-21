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
