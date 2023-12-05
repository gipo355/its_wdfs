# problemi ed algoritmi

e.g. esame

palloni di calcio vario stato di gonfiatura, trovare quello piu gonfio e
sgonfio.

e.g. uso array, lista, ricerca binaria, etc

creo una struttura cosi, ci applico questo algoritmo, faccio cosi etc

# dato un dominio di input e output

problema computazionale rappresentato da relazione matematica che associa un
elemento del dominio di input ad ogni elemento di output

dato un problema computazionale, un algoritmo e' un procedimento effettivo,
insieme di passi elementari ben specificati in un sistema formale di calcolo,
risolve il problema in tempo finito

# storia algos

MCD mcm

## minimo di un elemento

# complessita'

analisi delle risorse

dimensione e tipologia dell'input

# come si valuta

1. risolve problema in modo efficiente?

- come valutare
- alcuni non si puo ( esistono sol ottime )

2. risolve problema in modo corretto?

- dimostrazione matematica
- alcuni non si possono risolvere
- alcuni in modo approssimato

# risolvere in modo efficiente

unita' di misura della complessita'

- tempo ( devono sempre finire )
- spazio

quanto usa in termini di tempo e spazio.

# tempo

- velocita' del task

# spazio

- memoria occupata dalle strutture dati

# giusto equilibrio

- scegliere strutture dati giuste

- scegliere algoritmi giusti per quelle strutture

# misurare tempo e spazio

## tempo

molte cose influenzano il tempo

serve qualcosa di indipendente

### operazioni rilevanti

tutte le op che caratterizzano lo scopo dell'algo

e.s. numero di confronti per trovare il minimo

e.s. confronti di uguaglianza per trovare un elemento

e.s. calcolo = operazioni aritmetiche

# complessita' degli algoritmi

perche' stimare complessita' nel tempo?

dimensione input => tempo

# dimensione input

1. costo logaritmico

taglia dell'input: num di bit necessari per rappresentare l'input

2. costo uniforme

taglia dell'input: num di elementi dell'input

nella maggior parte, il costo e' uniforme ( float sempre 8 byte )

# tempo

numero di operazioni elementari

elementare = eseguita in tempo costante ( non dipende da n )
