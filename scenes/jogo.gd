extends Node2D

var tempoLimite = 60  # segundos
var score = 0

signal item_quebrado

func game_over():
	$StartTimer.stop()
	tempoLimite = 60
	score = 0

func new_game():
	tempoLimite = 60
	score = 0
	$StartTimer.start()

	# Conectar o sinal 'just_broken' de 'Quebraveis' diretamente
	for node in get_children():
		# Verificar se o nó é um 'Quebraveis' e conectar o sinal
		for ch_node in node.get_children():
			for queb in ch_node.get_children():
				if queb is Quebraveis:  
					node.connect("just_broken", Callable(self, "_on_coisas_pra_quebrar_just_broken"))
					node.connect("item_broken", Callable(self, "_on_quebraveis_item_broken"))


func _on_start_timer_timeout():
	tempoLimite -= 1
	$contador.update_timer(tempoLimite)
	if (tempoLimite == 0): 
		game_over()

func _on_item_quebrado() -> void:
	score += 1
	$contador.update_score(score)
	
# Chamado quando o nó entra na árvore de cena pela primeira vez.
func _ready() -> void:
	new_game()

# Chamado a cada quadro.
func _process(delta: float) -> void:
	pass
