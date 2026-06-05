{ config, pkgs, ... }: 

{
	home.packages = with pkgs; [
		emacs-pgtk

		tmux 
		curl 
		btop 
		unzip
		p7zip
		ripgrep 
		bat

		radare2 
		ghidra 
		python3Packages.ropper 
		ltrace 
		strace 
		file 
		checksec 
		gdb
		gef
	] ++ lib.optionals (pkgs.stdenv.isx86_64) [
		kitty
	]; 

	home.file = {
		".config/kitty/kitty.conf".source = ../../configs/kitty-config; 
		".config/tmux/tmux.conf".source = ../../configs/tmux-config; 
	}; 

	programs.direnv = {
		enable = true; 
		enableZshIntegration = true; 
		nix-direnv.enable = true; 
	}; 

	programs.fastfetch = {
		enable = true;
		settings = {
			logo = {
				source = "nixos_old_small";
				padding = {
					top = 1;
					right = 2;
				};
			};
			modules = [
				"title"
				"separator"
				"os"
				"host"
				"kernel"
				"uptime"
				"packages"
				"shell"
				"wm"
				"terminal"
				"cpu"
				"memory"
				"disk"
				"colors"
			];
		};
	};

	programs.git = {
		enable = true; 
		settings.user = {
			name = "tsyrx"; 
			email = "tommmasrt@gmail.com";
		}; 
	}; 

	programs.neovim = {
		enable = true; 
		defaultEditor = true; 
		viAlias = true; 
		vimAlias = true; 
	};

	programs.fzf = {
		enable = true; 
		enableZshIntegration = true; 
	};

	programs.zsh = {
		enable = true; 
		enableCompletion = true; 

		history = {
			path = "$HOME/.histfile";
			size = 1000; 
			save = 1000; 
		}; 

		syntaxHighlighting = {
			enable = true; 
			styles = {
				"reserved-word" = "fg=blue";
				"alias" = "fg=116";
				"unknown-token" = "fg=red";
				"path" = "fg=117";
				"path_pathseparator" = "fg=217";
				"precommand" = "fg=168,underline";
				"command" = "fg=116";
				"double-quoted-argument" = "fg=214";
				"single-quoted-argument" = "fg=214";
				"back-quoted-argument" = "fg=214";
				"arg0" = "fg=116";
				"single-hyphen-option" = "fg=182";
				"double-hyphen-option" = "fg=182";
			};
		}; 

		shellAliases = {
			sudo = "sudo "; 
			ll = "ls -lah";
			l = "ls -lh";
			ls = "ls --group-directories-first --color=auto";
			grep = "grep --color=auto";
			rm = "rm -i";
			checksec = "checksec file";
			m-hms = "home-manager switch --flake ~/nix-config/#tsyr@fred"; 
			t-hms = "home-manager switch -f ~/nix-config/hosts/nixos-t480/home.nix"; 
		}; 

		envExtra = ''
			export LS_COLORS='di=1;0;1;41:ln=35:so=30;47:pi=0;42:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
			'';

		initContent = ''
			setopt NO_BEEP
			bindkey -v 
			zstyle :compinstall filename '/home/tsyr/.zshrc'
			zstyle ':completion:*' menu select

			function mkcd() {
				mkdir -p "$1" && cd "$1"
			}           
			
			if [ ! -f /run/current-system/sw/bin/nixos-rebuild ]; then
				PROMPT="%n@%m:%~/ > "
			fi

			fastfetch
			'';
	};
}
