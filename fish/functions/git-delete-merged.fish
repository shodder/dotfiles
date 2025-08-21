#!/usr/bin/env fish

function git-delete-merged
	git branch --merged | sed -n '/\(develop\|master\)/!p' | xargs -I {} git branch -d {}
end
