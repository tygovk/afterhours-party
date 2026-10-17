const CATEGORIES={warmup:{name:'Warming-up',subtitle:'Breek het ijs',icon:'☀'},silly:{name:'Silly',subtitle:'Lekker onzinnig',icon:'✳'},caliente:{name:'18+ / Caliente',subtitle:'Een beetje spanning',icon:'♨'},custom:{name:'Eigen vragen',subtitle:'Jullie inside jokes',icon:'✎'}};
const TYPES={standard:{name:'Opdracht',icon:'✧'},sidequest:{name:'Sidequest',icon:'⚑'},timer:{name:'Tegen de klok',icon:'◷'},vote:{name:'Stemmen & dilemma',icon:'☞'},group:{name:'Iedereen doet mee',icon:'◎'},duel:{name:'Duel',icon:'⚔'}};
const DEFAULT_CARDS=[
['warmup','standard','{speler1}, wat is het meest spontane dat je ooit hebt gedaan?'],
['warmup','standard','{speler1}, geef {speler2} een onverwacht compliment.'],
['warmup','timer','{speler1}, noem 3 dingen die je meeneemt naar een onbewoond eiland.',0,10],
['warmup','vote','Wie zou het langst overleven zonder telefoon?'],
['warmup','group','Vertel om de beurt één goed ding over vandaag. Begin bij {speler1}.'],
['warmup','sidequest','{speler1}, sluit elke zin af met “volgens de legende”.',3],
['warmup','duel','{speler1} tegen {speler2}: wie kan het langst niet lachen? De groep is jury.'],
['silly','standard','{speler1}, verkoop je linkerschoen alsof het een luxeproduct is.'],
['silly','standard','{speler1}, doe de overwinningsdans van {speler2} na.'],
['silly','timer','{speler1}, noem 5 dieren met vier poten.',0,5],
['silly','timer','{speler1}, noem 3 merken bier.',0,5],
['silly','vote','Wie zou per ongeluk beroemd worden met een gênante video?'],
['silly','group','Iedereen doet een dierengeluid. Jullie mogen geen dier herhalen.'],
['silly','sidequest','{speler1}, praat als een sportcommentator wanneer je aan de beurt bent.',4],
['silly','duel','{speler1} en {speler2}: bedenk om de beurt een slechte superkracht. Wie hapert, verliest.'],
['caliente','standard','{speler1}, wat is jouw meest onhandige flirtmoment? Je mag passen.'],
['caliente','standard','{speler1}, beschrijf je ideale date in precies vijf woorden.'],
['caliente','timer','{speler1}, noem 3 romantische clichés.',0,10],
['caliente','vote','Wie zou het snelst een vakantieliefde krijgen?'],
['caliente','group','Iedereen noemt een onschuldige afknapper op een eerste date. Passen mag.'],
['caliente','sidequest','{speler1}, spreek de groep aan alsof je een extravagante datingpresentator bent.',3],
['caliente','duel','{speler1} en {speler2}: bedenk allebei een cheesy openingszin. De groep kiest de grappigste.'],
['custom','standard','{speler1}, vertel het verhaal achter jullie beste inside joke.'],
['custom','vote','Wie zou de beste organisator van jullie volgende weekend weg zijn?']
].map((c,i)=>({id:'default-'+i,category:c[0],type:c[1],text:c[2],duration:c[3]||3,seconds:c[4]||10}));
