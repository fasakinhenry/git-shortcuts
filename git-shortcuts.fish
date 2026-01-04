function a; git add .; end
function gc; git commit -m "$argv"; end
function gs; git status -sb; end
function gl; git log --oneline --graph --decorate -10; end
function p; git push -u origin (git branch --show-current); end
function pl; git pull; end
function gnew; git checkout -b $argv; end
function gundo; git reset --soft HEAD~1; end
function gfix; git commit --amend; end
function gclean
    for b in (git branch --merged | string trim)
        if not string match -r '^\*|main|master|dev' $b
            git branch -d $b
        end
    end
end
