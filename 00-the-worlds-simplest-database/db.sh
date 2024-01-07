#!/usr/bin/bash

DB_FILE=${DB_FILE:-/tmp/the-worlds-simplest-database}

main() {
	case $1 in
	"set")
		db_set "$2" "$3";
		;;
	"get")
		db_get "$2";
		;;
	"print")
		db_print;
		;;
	*)
		echo "usage: $0 (set k v | get k | print)"
		exit 1
		;;
	esac
}

db_set() {
	echo "$1,$2" >> "$DB_FILE"
}

db_get() {
	grep "^$1," "$DB_FILE" | sed -e "s/^$1,//" | tail -n 1
}

db_print() {
	cat "$DB_FILE"
}

main "$@"
