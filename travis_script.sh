set -e

declare -a  PROJECT_NAMES=(
	"jsonexample" \
	"shrine" \
	"veggieseasons" \
)

for PROJECT_NAME in "${PROJECT_NAMES[@]}"
do
	echo "== Testing '${PROJECT_NAME}' on Flutter's $FLUTTER_VERSION channel =="
	pushd "${PROJECT_NAME}"

	# Run the analyzer to find any static analysis issues.
	../flutter/bin/flutter analyze

	# Run the formatter on all the dart files to make sure everything's linted.
	find . | grep "\.dart$" | xargs ../flutter/bin/flutter format -n

	# Run the actual tests.
	../flutter/bin/flutter test

	popd
done

echo "-- Success --"
