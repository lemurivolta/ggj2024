extends Node

###############################################################################
# CONFIGURATION
###############################################################################

# Current level of pleasure
var current_pleasure: float = 0

# Level of pleasure under which the monster is enraged and go to gameover
var enraged_threshold = -5

# Level of pleasure over which the monster is really happy and gets quiet
var happy_threshold = 5

###############################################################################
# SIGNALS
###############################################################################

# Signal raised whenever the monster is tickled in a good place (positive) or
# bad place (negative)
signal tickle(pleasure: float)

# Signal raised when the monster is too displeased and gets enraged (gameover)
signal enraged

# Signal raised when the monster is really happy and gets quiet
signal happy

###############################################################################
# FUNCTIONS
###############################################################################

# Reset the pleasure level to 0
func reset_pleasure():
	current_pleasure = 0

###############################################################################
# INTERNALS
###############################################################################

func _ready():
	tickle.connect(_on_tickle)
	
func _on_tickle(value: float):
	current_pleasure += value
	if current_pleasure <= enraged_threshold:
		enraged.emit()
	elif current_pleasure >= happy_threshold:
		happy.emit()
