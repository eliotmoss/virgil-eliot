#!/bin/bash

function do_parser_tests() {
	cd parser
	printf "  Running parser tests..."
	run_v3c "" -test -expect=expect.txt *.v3 > $OUT/out
	check_red $OUT/out
	cd ..
}

function do_seman_tests() {
	cd seman
	printf "  Running semantic tests..."
	run_v3c "" -test -expect=expect.txt *.v3 > $OUT/out
	check_red $OUT/out
	cd ..
}

. ../common.bash fsi64
if [ $# -gt 0 ]; then
	TESTS="$@"
else
	(do_parser_tests)
	(do_seman_tests)

	TESTS=*.v3
fi
run_exec_tests
exit $?
