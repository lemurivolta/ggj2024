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

# Signal raised when the monster name is chosen
signal set_name(part1: String, part2: String, part3: String)

# Signal to warn about the start of the interaction (started = true) or the end
# of it (started = false)
signal interaction(started: bool)

###############################################################################
# FUNCTIONS
###############################################################################

var tickle_enabled = true

# Reset the pleasure level to 0
func reset_pleasure():
	current_pleasure = 0
	
###############################################################################
# INTERNALS
###############################################################################

func _ready():
	tickle.connect(_on_tickle)
	
func _on_tickle(value: float):
	if not tickle_enabled:
		return
	current_pleasure = \
		clamp(current_pleasure + value, enraged_threshold, happy_threshold)
	if current_pleasure <= enraged_threshold:
		current_pleasure = 0
		enraged.emit()
	elif current_pleasure >= happy_threshold:
		current_pleasure = 0
		happy.emit()
