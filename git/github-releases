gen-release-notes() {
	echo "Creating release notes for..."
	GITHUB_REPO=$(git config --get remote.origin.url | sed -n 's/^.*:\(.*\).git$/\1/p')
	git fetch
	git log --merges --pretty=format:%s ...origin/master \
		| sed -n 's/^Merge pull request.*isisbusapps\/\([0-9][0-9]*\).*/\1/p' \
		| sort -un \
		| xargs -I {} -n1 curl -su shodder:$GITHUB_API_TOKEN https://api.github.com/repos/$GITHUB_REPO/issues/\{\} \
		| jq -r '(.number|tostring) + " - " + .title + " - [" + (["\"" + .labels[]?.name + "\""] | join(", ")) + "]"'
}


gen-pr-list() {
	echo "Getting all PRs since last merge to master..."
	GITHUB_REPO=$(git config --get remote.origin.url | sed -n 's/^.*:\(.*\).git$/\1/p')
	git fetch
	git log --merges --pretty=format:%s ...origin/master \
	| sed -n 's/^Merge pull request #\([0-9]\{0,\}\).*isisbusapps\/\(.*\)/PR:\1	BRANCH:\2/p' \
	| sort -u
}

