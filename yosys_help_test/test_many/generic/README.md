The test_many_check.sh bash script will prepare the yosys tcl file, run it, then run the spydrnet check for the TMR'd netlists.

Arguments are:
  1. The test name
  2. The read command for yosys
  3. The top module name

Example usage: 

    sh test_many_check.sh toggle "yosys read -sv ~/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv" toggle

Output:

    Running test for "toggle"
    Running check for netlists/p_ff_r.blif
    Parsing original
    Found information for 5 definitions
    Parsing TMR
    Found information for 6 definitions
    PASSED

    Running check for netlists/p_ff.blif
    Parsing original
    Found information for 5 definitions
    Parsing TMR
    Found information for 6 definitions
    PASSED

    Running check for netlists/p_r.blif
    Parsing original
    Found information for 5 definitions
    Parsing TMR
    Found information for 6 definitions
    PASSED

    Running check for netlists/ff_r.blif
    Parsing original
    Found information for 5 definitions
    Parsing TMR
    Found information for 6 definitions
    PASSED

    Running check for netlists/r.blif
    Parsing original
    Found information for 5 definitions
    Parsing TMR
    Found information for 6 definitions
    PASSED

    Running check for netlists/p.blif
    Parsing original
    Found information for 5 definitions
    Parsing TMR
    Found information for 6 definitions
    PASSED