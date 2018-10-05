#!/usr/bin/env zsh

mkdir -p src/leaflet.pm/

version="$(npm view leaflet.pm | grep latest | sed 's/.*latest.*: //')"
revision="0"

css="https://unpkg.com/leaflet.pm@${version}/dist/leaflet.pm.css"
minjs="https://unpkg.com/leaflet.pm@${version}/dist/leaflet.pm.min.js"
js="https://unpkg.com/leaflet.pm@${version}/dist/leaflet.pm.js"

output="src/leaflet.pm"

pushd "$output"
curl -O "$css"
curl -O "$js"
curl -O "$minjs"
popd

echo "Latest version is $version"

git add src/leaflet.pm
git commit -m "Bump leaflet.pm to ${version}"

git tag -a "v${version}-${revision}" -m "Release version ${version}"
