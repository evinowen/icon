.segment "RAM"

map:                  .res 64
solid:                .res 240

room_buffer_current:  .res 192
room_buffer_prev:     .res 192

address_tile_map:     .res 2

monsters:
  .res OBJ_CREATURE
  .res OBJ_CREATURE
  .res OBJ_CREATURE
  .res OBJ_CREATURE
  .res OBJ_CREATURE
  .res OBJ_CREATURE
  .res OBJ_CREATURE
  .res OBJ_CREATURE
address_monsters:     .res 2

collectables:
  .res OBJ_COLLECTABLE
  .res OBJ_COLLECTABLE
  .res OBJ_COLLECTABLE
  .res OBJ_COLLECTABLE
  .res OBJ_COLLECTABLE
  .res OBJ_COLLECTABLE
  .res OBJ_COLLECTABLE
  .res OBJ_COLLECTABLE
address_collectables: .res 2
