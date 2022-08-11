

echo "Running test for \"$1\""

python3 tcl_preparer.py generate_many.tcl "READ_COMMAND" "$2"
python3 tcl_preparer.py generate_many.tcl "TOP_MODULE" "$3"

/home/jacobb00/yosys/yosys/yosys generate_many.tcl > output.txt

python3 tcl_preparer.py generate_many.tcl "$2" "READ_COMMAND"
python3 tcl_preparer.py generate_many.tcl "$3" "TOP_MODULE"

python3 test_many_checker.py netlists/p_ff_r.blif
python3 test_many_checker.py netlists/p_ff.blif
python3 test_many_checker.py netlists/p_r.blif
python3 test_many_checker.py netlists/ff_r.blif
python3 test_many_checker.py netlists/r.blif
python3 test_many_checker.py netlists/p.blif
