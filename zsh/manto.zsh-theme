	

    # ZSH Theme - Preview: http://cl.ly/f701d00760f8059e06dc
    # Edited by manto89
    # Thanks to gallifrey, upon whose theme this is based
     
    local return_code="%(?..%{$fg_bold[red]%}%? ↵%{$reset_color%})"
     
    function my_git_prompt_info() {
      ref=$(git symbolic-ref HEAD 2> /dev/null) || return
      GIT_STATUS=$(git_prompt_status)
      [[ -n $GIT_STATUS ]] && GIT_STATUS=" $GIT_STATUS"
      echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$GIT_STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
    }
     
    function get_RAM() {
      free -m | awk '{if (NR==3) print $4}' | xargs -i echo 'scale=1;{}/1000' | bc
      }
     
    #function get_batt() {
    #  cat /sys/class/power_supply/BAT0/capacity
    #  }
    # $(get_batt)%% %{$reset_color%}' aggiugere sotto 
     
    function get_load() {
      uptime | awk '{print $11}' | rev | cut -c 2- | rev
      }
     
    PROMPT='%{$fg_bold[green]%}%n@%m%{$reset_color%} %{$fg_bold[blue]%}%2~%{$reset_color%} $(my_git_prompt_info)%{$reset_color%}%B»%b '
     
    RPROMPT='%{$fg_bold[red]%}% [$(get_RAM)G, $(get_load)%%] %{$fg_bold[green]%}%* %{$reset_color%}'
     
    #RPS1="${return_code}"
     
    ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
    ZSH_THEME_GIT_PROMPT_SUFFIX=") %{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%%"
    ZSH_THEME_GIT_PROMPT_ADDED="+"
    ZSH_THEME_GIT_PROMPT_MODIFIED="*"
    ZSH_THEME_GIT_PROMPT_RENAMED="~"
    ZSH_THEME_GIT_PROMPT_DELETED="!"
    ZSH_THEME_GIT_PROMPT_UNMERGED="?"


