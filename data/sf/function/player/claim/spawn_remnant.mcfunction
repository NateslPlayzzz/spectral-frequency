# player/claim/spawn_remnant.mcfunction
# Macro context:
# {
#   uuid:[I;...]
# }
#
# Creates:
# - one authoritative interaction entity
# - one visible Echo Shard
# - one floating instruction label
#
# Every component carries the owner's UUID and sf.remnant tag so normal
# case cleanup removes the complete visual assembly.

# Authoritative click zone and revival-state owner.
$summon minecraft:interaction ~ ~ ~ {width:0.9f,height:1.55f,response:1b,Tags:["sf.remnant","sf.remnant_interact","smithed.entity","smithed.strict"],data:{sf:{owner:$(uuid)}}}

# Temporary vanilla visual.
# During the resource-pack phase, this Echo Shard can be replaced by a
# dedicated sf:remnant item model without rewriting the revival engine.
$summon minecraft:item_display ~ ~0.85 ~ {Tags:["sf.remnant","sf.remnant_visual","smithed.entity"],billboard:"center",Glowing:1b,glow_color_override:8019199,brightness:{block:12,sky:12},view_range:20.0f,transformation:{translation:[0.0f,0.0f,0.0f],scale:[0.85f,0.85f,0.85f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]},item:{id:"minecraft:echo_shard",count:1,components:{"minecraft:custom_name":{text:"Remnant",color:"#C89BFF",italic:false},"minecraft:enchantment_glint_override":true,"minecraft:custom_data":{sf:{visual:"remnant_v1"}}}},data:{sf:{owner:$(uuid)}}}

# In-world interaction prompt.
$summon minecraft:text_display ~ ~1.75 ~ {Tags:["sf.remnant","sf.remnant_label","smithed.entity"],billboard:"center",background:0,default_background:0b,shadow:1b,see_through:0b,line_width:180,view_range:14.0f,transformation:{translation:[0.0f,0.0f,0.0f],scale:[0.55f,0.55f,0.55f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]},text:{text:"REMNANT\n",color:"#C89BFF",bold:true,extra:[{text:"Right-click to remember",color:"gray",bold:false,italic:true}]},data:{sf:{owner:$(uuid)}}}