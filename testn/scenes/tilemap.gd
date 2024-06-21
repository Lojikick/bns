extends TileMap
#
var astar = AStarGrid2D.new()
var map_rect = Rect2i()



#For later, potentially for less buggy dialogue:
	#https://www.youtube.com/watch?v=0JPNmQ27uwA&list=PLPwlXx18zF7EKPb4sVu4gZ9S7XS0-ad_a&index=1&ab_channel=LazyGames
	#https://www.youtube.com/watch?v=2CuJRbTpkZ4&list=PLPwlXx18zF7EKPb4sVu4gZ9S7XS0-ad_a&index=2&ab_channel=LazyGames
## Called when the node enters the scene tree for the first time.
#func _ready():
	#var tilemap_size = get_used_rect().end - get_used_rect().position
	#map_rect = Rect2i(Vector2i.ZERO, tilemap_size)
	#
	#var tile_size = get_tileset().tile_size
	#
	###AStar region parameters and agent search heuristic initialization
	#astar.region = map_rect
	#astar.cell_size = tile_size
	#astar.default_compute_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	#astar.default_estimate_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	#astar.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	#astar.update()
	#
	##Determine walls
	#for i in tilemap_size.x:
		#for j in tilemap_size.y:
			#var coords = Vector2i(i, j)
			#var tile_data = get_cell_tile_data(0, coords)
			#if tile_data and tile_data.get_custom_data('type') == 'wall':
				#astar.set_point_solid(coords)
			#
	#pass # Replace with function body.
#
#func is_point_walkable(position):
	##point will be relative to position on map
	#var map_position = local_to_map(position)
	#if map_rect.has_point(map_position) and not astar.is_point_solid(map_position):
		#return true
	#return false
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
