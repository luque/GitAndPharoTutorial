as yet unclassified
newCellAt: i at: j
	"Crée une cellule à la position (i,j) et l'ajoute dans ma représentation graphique à la
position correcte. Retourne une nouvelle cellule"

	| c origin |
	c := LOCell new.
	origin := self innerBounds origin.
	self addMorph: c.
	c position: ((i - 1) * c width) @ ((j - 1) * c height) + origin.
	c mouseAction: [ self toggleNeighboursOfCellAt: i at: j ]