if status is-interactive
    # Commands to run in interactive sessions can go here
	#ASDF INSTALL
	source ~/.asdf/asdf.fish
	
	#ALIASES
	alias temp="cd /tmp"
	alias exa="exa --icons"
	alias la="exa -lha"
	alias ll="exa -lh"
	alias fish-conf="nvim $HOME/.dotfiles/config.fish"
	alias testf="touch test.txt"
end



