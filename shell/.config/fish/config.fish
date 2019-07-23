abbr -a yr 'cal -y'
abbr -a c cargo
abbr -a e nvim
abbr -a m make
abbr -a g git
abbr -a gc 'git chekcout'
abbr -a ca 'git add -p'
abbr -a vimdiff 'nvim -d'
abbr -a ct 'cargo t'
abbr -a amz 'env AWS_SECRET_KEY=(pass www/aws-secret-key | head -n1)'
abbr -a ais "aws ec2 describe-instances | jq '.Reservations[] | .Instances[], type: .InstanceType, key:.KeyName, state:.State.Name, Host:.PublicDnsName}'"
abbr -a gah 'git stash; and git pull --rebase; and git stash pop'

set -U fish_user_paths /usr/local/sbin /usr/local/bin /usr/bin /bin

if status --is-interactive
	tmux ^ /dev/null; and exec true
end

if command -v exa > /dev/null
	abbr -a l 'exa'
	abbr -a ls 'exa'
	abbr -a ll 'exa -l'
	abbr -a lll 'exa -la'
else
	abbr -a l 'ls'
	abbr -a ll 'ls -l'
	abbr -a lll 'ls -la'
end

if [ -e /usr/share/fish/functions/fzf_key_bindings.fish ]; and status --is-interactive
	source /usr/share/fish/functions/fzf_key_bindings.fish
end

if test -f /usr/share/autojump/autojump.fish;
	source /usr/share/autojump/autojump.fish;
end

function ssh
	switch $argv[1]
		case "*.amazonaws.com"
			env TERM=xterm /usr/bin/ssh $argv
		case "ubuntu@"
			env TERM=xterm /usr/bin/ssh $argv
		case "*"
			/usr/bin/ssh $argv
		end
	end

function asend
	if test (count $argv) -ne 1
		echo "No argument given"
		return
	end
	adb shell input text (echo $argv[1] | sed -e 's/ /%s/g' -e 's/\([[()<>{}$|;&*\\~"\'`]\)/\\\\\1/g')
end

function remote_alacritty
	set (mktemp)
	infocmp alacritty > $fn
	scp $fn $argv[1]":alactritty.ti"
	ssh $argv[1] tic "alacritty.ti"
	ssh $arvg[1] rm "alacritty.ti"
end

set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

setenv LESS_TERMCAP_mb \e'[01;31m'
setenv LESS_TERMCAP_md \e'[01;36;5;74m'
setenv LESS_TERMCAP_me \e'[0m'
setenv LESS_TERMCAP_se \e'[0m'
setenv LESS_TERMCAP_so \e'[38;5;246m'
setenv LESS_TERMCAP_ue \e'[0m'
setenv LESS_TERMCAP_us \e'[04;38;5;146m'

setenv LD_LIBRARY_PATH (rustc +nightly --print sysroot)"/lib:$LD_LIBRARY_PATH"
setenv RUST_SRC_PATH (rustc --print sysroot)"/lib/rustlib/src/rust/src"

setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
setenv FZF_DEFAULT_OPTS '--height 20%'

set FISH_CLIPBOARD_CMD "cat"

function fish_user_key_bindings
	bind \cz 'fg>/dev/null ^/dev/null'
	if functions -q fzf_key_bindings
		fzf_key_bindings
	end
end

function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end




