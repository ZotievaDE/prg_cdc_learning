set project_name "cdc_learning"

set project_found [llength [get_projects $project_name] ]
if {$project_found > 0} close_project

# set the reference directory to where the script is
set origin_dir [file dirname [info script]]
cd [file dirname [info script]]

# create project
create_project $project_name "$project_name" -force

# add sources
add_files -norecurse trig_gen.v
add_files -norecurse dff_tr.v
add_files -norecurse cdc_test.sv

# lunch simulation
set_property top cdc_test [get_filesets sim_1]
#launch_simulation