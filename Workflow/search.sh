#!/bin/zsh --no-rcs

# Automatically Get Bookmarks Database for Default Profile

readonly releaseChannel="firefox"
readonly versionCode="2656FF1E876E9973"

readonly zenDefaultProfile=$(grep Default "${HOME}/Library/Application Support/zen/installs.ini" | cut -d"=" -f2)
readonly bookmarks_file="${HOME}/Library/Application Support/zen/${zenDefaultProfile}/places.sqlite"

readonly sqlQuery="SELECT p.id, p.url, b.title, p.description, JSON_GROUP_ARRAY(DISTINCT t.title) AS tag_names
FROM moz_places p
JOIN moz_bookmarks b ON b.fk = p.id
JOIN moz_bookmarks t ON t.id = b.parent
GROUP BY p.url;"

# Load Bookmarks
sqlite3 -json ${bookmarks_file} ${sqlQuery} | jq -s \
--arg useDesc "$useDesc" \
--arg useURL "$useURL" \
--arg useTag "$useTag" \
--arg releaseChannel "$releaseChannel" \
--arg showAllTags "$showAllTags" \
--arg useQL "$useQL" \
--arg useKeyword "$useKeyword" \
'{
    "items": (if (length > 0) then map(.[] | (if .tag_names | contains("Exclude-Alfred") then empty else
    	{
    		"uid": .id,
    		"title": .title,
    		"subtitle": "\(.tag_names | fromjson | .[1:] | if .[0] then "["+(if $showAllTags == "1" then join(", ") else .[0] end)+"] " else "" end)\(.url)",
    		"arg": .url,
    		"match": "\(.title) \(if $useURL == "1" then .url else "" end) \(if $useDesc == "1" then (.description // "") else "" end) \(if $useTag == "1" then (.tag_names | fromjson | .[1:] | map("#" + .) | join(" ")) else "" end) \(if $useKeyword == "1" then (.keyword // "") else "" end)",
    		"quicklookurl": "\(if $useQL == "1" then .url else "" end)",
    		"text": { "largetype": "[\(.tag_names | fromjson | .[1:] | join(", "))]\n\n\(.url)" },
		"icon": { "path": "images/\($releaseChannel).png" },
    		"mods": {
    			"cmd": {
    				"subtitle": "⌘↩ Open in secondary browser",
    				"arg": .url,
    				"variables": { "bSecondary": true }
    			},
    			"shift": {
    				"subtitle": (.description // "")
    			}
    		}
    	}
    end)) else
        [{
			"title": "Search Bookmarks...",
			"subtitle": "You have no bookmarks",
			"valid": "false"
		}]
	end)
}'